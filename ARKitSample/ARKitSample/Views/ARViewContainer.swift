import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelName: String
    @State internal var imageAnchor: ARImageAnchor?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configuración de la sesión AR
        let configuration = ARImageTrackingConfiguration()
        
        // Cargar las imágenes de referencia desde la carpeta AR Resources
        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) {
            configuration.trackingImages = referenceImages
            configuration.maximumNumberOfTrackedImages = 1
        } else {
            print("No se encontraron imágenes en AR Resources")
        }
        
        arView.session.run(configuration)
        arView.session.delegate = context.coordinator
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let imageAnchor {
            let anchor = AnchorEntity(anchor: imageAnchor)
            
            guard let modelEntity = try? Entity.loadModel(named: self.modelName) else { return }
            modelEntity.scale = .init(x: 0.1, y: 0.1, z: 0.1)
            anchor.addChild(modelEntity)
            uiView.scene.addAnchor(anchor)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(arView: self)
    }
}


class Coordinator: NSObject, ARSessionDelegate {
    
    var arView: ARViewContainer!
    
    init(arView: ARViewContainer!) {
        self.arView = arView
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            if let imageAnchor = anchor as? ARImageAnchor {
                print("Imagen reconocida: \(imageAnchor.referenceImage.name ?? "sin nombre")")
                self.arView.imageAnchor = imageAnchor
            }
        }
    }
}
