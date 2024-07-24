import QtQuick
import QtQuick3D

import project

Node {
    property color chair: "magenta"
    property color cskin: "magenta"
    property color cclothes: "magenta"
    property int cheight: 160
    property int cgender: MyCharacter.Gender.Male

    id: root
    Model {
        position: Qt.vector3d(0, root.cheight - 14, -1)
        scale: Qt.vector3d(0.3, 0.3, 0.3)
        source: "#Sphere"
        materials: PrincipledMaterial {
            baseColor: root.chair
        }
    }

    Model {
        position: Qt.vector3d(0, root.cheight - 15, 0)
        scale: Qt.vector3d(0.3, 0.3, 0.3)
        source: "#Sphere"
        materials: PrincipledMaterial {
            baseColor: root.cskin
        }
    }

    Model {
        position: Qt.vector3d(0, (root.cgender === MyCharacter.Gender.Male) ? root.cheight - 30 : 0, 0)
        eulerRotation.x: (root.cgender === MyCharacter.Gender.Male) ? 180 : 0
        scale: Qt.vector3d(0.4, (root.cheight - 30) / 100.0, 0.4)
        source: "#Cone"
        materials: PrincipledMaterial {
            baseColor: root.cclothes
        }
    }
}
