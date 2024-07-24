import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

// https://doc.qt.io/qt-6/qtquick3dphysics-units.html
// Qt Quick 3D Unit: cm
View3D {
    camera: cameraNode
    environment: SceneEnvironment {
        clearColor: "skyblue"
        backgroundMode: SceneEnvironment.Color
    }

    // A light like the sun
    DirectionalLight {
        eulerRotation.x: -30
        eulerRotation.y: -70
        castsShadow: true
        shadowMapQuality: Light.ShadowMapQualityVeryHigh
    }

    // Camera with its controller to make it easy to move around the player
    Node {
        id: originNode
        position: Qt.vector3d(0, 145, 0)
        PerspectiveCamera {
            id: cameraNode
            position: Qt.vector3d(0, 0, 100)
        }
    }
    OrbitCameraController {
        anchors.fill: parent
        origin: originNode
        camera: cameraNode
        panEnabled: false
    }

    Model {
        position: Qt.vector3d(0, -50, 0)
        scale: Qt.vector3d(100, 1, 100)
        source: "#Cylinder"
        materials: PrincipledMaterial {
            baseColor: "green"
        }
    }
}
