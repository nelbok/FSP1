import QtQuick
import QtQuick3D

Item {
    required property Node character

    id: root
    SequentialAnimation {
        property int duration: 400

        id: actionJump
        running: false

        NumberAnimation {
            target: root.character
            property: "y"
            duration: actionJump.duration / 2
            from: 0
            to: 100
            easing.type: Easing.OutQuart
        }
        NumberAnimation {
            target: root.character
            property: "y"
            duration: actionJump.duration / 2
            from: 100
            to: 0
            easing.type: Easing.InQuart
        }
    }

    SequentialAnimation {
        property int duration: 400

        id: actionFlip
        running: false
        NumberAnimation {
            target: root.character
            property: "z"
            duration: actionFlip.duration * 2
            from: 0
            to: 100
            easing.type: Easing.Linear
        }
        ParallelAnimation {
            SequentialAnimation {
                NumberAnimation {
                    target: root.character
                    property: "y"
                    duration: actionFlip.duration / 2
                    from: 0
                    to: 150
                    easing.type: Easing.OutQuart
                }
                NumberAnimation {
                    target: root.character
                    property: "y"
                    duration: actionFlip.duration / 2
                    from: 150
                    to: 0
                    easing.type: Easing.InQuart
                }
            }
            NumberAnimation {
                target: root.character
                property: "eulerRotation.x"
                duration: actionFlip.duration
                from: 360
                to: 0
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: root.character
                property: "z"
                duration: actionFlip.duration
                from: 100
                to: -100
                easing.type: Easing.Linear
            }
        }
        NumberAnimation {
            target: root.character
            property: "z"
            duration: actionFlip.duration * 2
            from: -100
            to: 0
            easing.type: Easing.Linear
        }
    }

    ParallelAnimation {
        property int duration: 400

        id: actionSpin
        running: false
        NumberAnimation {
            target: root.character
            property: "eulerRotation.y"
            duration: actionSpin.duration
            from: 360
            to: 0
            easing.type: Easing.Linear
        }
        SequentialAnimation {
            NumberAnimation {
                target: root.character
                property: "y"
                duration: actionSpin.duration / 2
                from: 0
                to: 20
                easing.type: Easing.OutQuart
            }
            NumberAnimation {
                target: root.character
                property: "y"
                duration: actionSpin.duration / 2
                from: 20
                to: 0
                easing.type: Easing.InQuart
            }
        }
    }

    ParallelAnimation {
        property int duration: 400

        id: actionAttack
        running: false
        SequentialAnimation {
            NumberAnimation {
                target: root.character
                property: "eulerRotation.z"
                duration: actionAttack.duration / 2
                from: 0
                to: -5
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: root.character
                property: "eulerRotation.z"
                duration: actionAttack.duration / 4
                from: -5
                to: 5
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: root.character
                property: "eulerRotation.z"
                duration: actionAttack.duration / 2
                from: 5
                to: 0
                easing.type: Easing.Linear
            }
        }
        SequentialAnimation {
            NumberAnimation {
                target: root.character
                property: "eulerRotation.x"
                duration: actionAttack.duration / 2
                from: 0
                to: -20
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: root.character
                property: "eulerRotation.x"
                duration: actionAttack.duration / 4
                from: -20
                to: 20
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: root.character
                property: "eulerRotation.x"
                duration: actionAttack.duration / 2
                from: 20
                to: 0
                easing.type: Easing.Linear
            }
        }
    }

    function jump() {
        if (actionJump.running === false) {
            actionJump.start()
        }
    }

    function flip() {
        if (actionFlip.running === false) {
            actionFlip.start()
        }
    }

    function spin() {
        if (actionSpin.running === false) {
            actionSpin.start()
        }
    }

    function attack() {
        if (actionAttack.running === false) {
            actionAttack.start()
        }
    }
}
