import QtQuick
import QtQuick.Layouts

import project

Item {
    anchors.fill: parent

    CMView {
        anchors.fill: parent

        CModel {
            id: player
            chair: MyPlayer.hair
            cskin: MyPlayer.skin
            cclothes: MyPlayer.clothes
            cheight: MyPlayer.height
            cgender: MyPlayer.gender
        }
    }

    CTextInput {
        id: cname
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10

        text: MyPlayer.name
        placeholder: qsTr("Your name...")
        onClicked: updateTabs(cname)
        onEditingFinished: MyPlayer.name = text
    }

    CTab {
        id: cchead
        anchors.top: cname.bottom
        anchors.left: parent.left
        anchors.margins: 10
        onTitleClicked: updateTabs(cchead)

        title: qsTr("Head")
        Item {
            visible: cchead.expanded
            anchors.fill: cchead.content
            ColumnLayout {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    text: qsTr("Hair color")
                    font.pointSize: 16
                    color: palette.windowText
                }
                RowLayout {
                    CCheckButton {
                        color: "brown"
                        checked: MyPlayer.hair === color
                        onClicked: MyPlayer.hair = color
                    }
                    CCheckButton {
                        color: "red"
                        checked: MyPlayer.hair === color
                        onClicked: MyPlayer.hair = color
                    }
                    CCheckButton {
                        color: "gold"
                        checked: MyPlayer.hair === color
                        onClicked: MyPlayer.hair = color
                    }
                    CCheckButton {
                        color: "white"
                        checked: MyPlayer.hair === color
                        onClicked: MyPlayer.hair = color
                    }
                    CCheckButton {
                        color: "black"
                        checked: MyPlayer.hair === color
                        onClicked: MyPlayer.hair = color
                    }
                }
                Text {
                    text: qsTr("Skin color")
                    font.pointSize: 16
                    color: palette.windowText
                }
                RowLayout {
                    CCheckButton {
                        color: "mistyrose"
                        checked: MyPlayer.skin === color
                        onClicked: MyPlayer.skin = color
                    }
                    CCheckButton {
                        color: "navajowhite"
                        checked: MyPlayer.skin === color
                        onClicked: MyPlayer.skin = color
                    }
                    CCheckButton {
                        color: "peachpuff"
                        checked: MyPlayer.skin === color
                        onClicked: MyPlayer.skin = color
                    }
                    CCheckButton {
                        color: "pink"
                        checked: MyPlayer.skin === color
                        onClicked: MyPlayer.skin = color
                    }
                    CCheckButton {
                        color: "rosybrown"
                        checked: MyPlayer.skin === color
                        onClicked: MyPlayer.skin = color
                    }
                }
            }
        }
    }

    CTab {
        id: ccbody
        anchors.top: cchead.bottom
        anchors.left: parent.left
        anchors.margins: 10
        onTitleClicked: updateTabs(ccbody)

        title: qsTr("Body")
        Item {
            visible: ccbody.expanded
            anchors.fill: ccbody.content
            ColumnLayout {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    text: qsTr("Height: %1 cm").arg(MyPlayer.height)
                    font.pointSize: 16
                    color: palette.windowText
                }
                CSlider {
                    from: 135
                    to: 200
                    value: MyPlayer.height
                    onValueChanged: MyPlayer.height = value
                }
                Text {
                    text: qsTr("Clothes color")
                    font.pointSize: 16
                    color: palette.windowText
                }
                RowLayout {
                    CCheckButton {
                        color: "red"
                        checked: MyPlayer.clothes === color
                        onClicked: MyPlayer.clothes = color
                    }
                    CCheckButton {
                        color: "yellow"
                        checked: MyPlayer.clothes === color
                        onClicked: MyPlayer.clothes = color
                    }
                    CCheckButton {
                        color: "green"
                        checked: MyPlayer.clothes === color
                        onClicked: MyPlayer.clothes = color
                    }
                    CCheckButton {
                        color: "white"
                        checked: MyPlayer.clothes === color
                        onClicked: MyPlayer.clothes = color
                    }
                    CCheckButton {
                        color: "black"
                        checked: MyPlayer.clothes === color
                        onClicked: MyPlayer.clothes = color
                    }
                }
            }
        }
    }

    CTab {
        id: ccgender
        anchors.top: ccbody.bottom
        anchors.left: parent.left
        anchors.margins: 10
        onTitleClicked: updateTabs(ccgender)

        title: qsTr("Species")

        Item {
            visible: ccgender.expanded
            anchors.fill: ccgender.content
            ColumnLayout {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    text: qsTr("Species")
                    font.pointSize: 16
                    color: palette.windowText
                }
                RowLayout {
                    CCheckButton {
                        checked: MyPlayer.species === MyCharacter.Species.Fox
                        onClicked: MyPlayer.species = MyCharacter.Species.Fox
                        text: "🦊"
                    }
                    CCheckButton {
                        checked: MyPlayer.species === MyCharacter.Species.Cat
                        onClicked: MyPlayer.species = MyCharacter.Species.Cat
                        text: "🐱"
                    }
                    CCheckButton {
                        checked: MyPlayer.species === MyCharacter.Species.Dog
                        onClicked: MyPlayer.species = MyCharacter.Species.Dog
                        text: "🐶"
                    }
                    CCheckButton {
                        checked: MyPlayer.species === MyCharacter.Species.Bun
                        onClicked: MyPlayer.species = MyCharacter.Species.Bun
                        text: "🐰"
                    }
                    CCheckButton {
                        checked: MyPlayer.species === MyCharacter.Species.Rat
                        onClicked: MyPlayer.species = MyCharacter.Species.Rat
                        text: "🐭"
                    }
                }
                Text {
                    text: qsTr("Gender")
                    font.pointSize: 16
                    color: palette.windowText
                }
                RowLayout {
                    CCheckButton {
                        checked: MyPlayer.gender === MyCharacter.Gender.Male
                        onClicked: MyPlayer.gender = MyCharacter.Gender.Male
                        text: "♂"
                    }
                    CCheckButton {
                        checked: MyPlayer.gender === MyCharacter.Gender.Female
                        onClicked: MyPlayer.gender = MyCharacter.Gender.Female
                        text: "♀"
                    }
                }
            }
        }
    }

    CTab {
        id: ccactions
        anchors.top: ccgender.bottom
        anchors.left: parent.left
        anchors.margins: 10
        onTitleClicked: updateTabs(ccactions)

        title: qsTr("Actions")

        Item {
            visible: ccactions.expanded
            anchors.fill: ccactions.content
            ColumnLayout {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                RowLayout {
                    CButton {
                        text: qsTr("Jump")
                        onClicked: playerActions.jump()
                    }
                    CButton {
                        text: qsTr("Flip")
                        onClicked: playerActions.flip()
                    }
                }
                RowLayout {
                    CButton {
                        text: qsTr("Spin")
                        onClicked: playerActions.spin()
                    }
                    CButton {
                        text: qsTr("Attack")
                        onClicked: playerActions.attack()
                    }
                }
            }
        }
    }

    CCharacterAction {
        id: playerActions
        character: player
    }

    CButton {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10

        text: "←"
        onClicked: parent.visible = false
    }

    function updateTabs(current) {
        cchead.collapsing = cchead !== current
        ccbody.collapsing = ccbody !== current
        ccgender.collapsing = ccgender !== current
        ccactions.collapsing = ccactions !== current
    }
}
