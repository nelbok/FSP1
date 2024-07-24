import QtQuick
import QtQuick.Layouts

import project

Window {
    id: root
    width: 1280
    height: 768
    minimumWidth: 1280
    minimumHeight: 768
    maximumWidth: 1280
    maximumHeight: 768
    visible: true
    title: MyManager.about.name

    Rectangle {
        anchors.fill: parent

        color: CStyle.background.window

        Text {
            anchors.top: parent.top
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter

            text: MyManager.about.name
            font.pointSize: CStyle.pointSize.title
            font.bold: true
            font.italic: true
            horizontalAlignment: Text.AlignHCenter
            color: CStyle.foreground
        }

        ColumnLayout {
            anchors.margins: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 20

            CButton {
                width: 300
                text: qsTr("Character customization")
                onClicked: root.createLHMain("charmaker/CMMain.qml")
            }

            CButton {
                width: 300
                text: qsTr("Work in progress...")
            }

            CButton {
                width: 300
                text: qsTr("Work in progress...")
            }

            CButton {
                width: 300
                text: qsTr("Work in progress...")
            }

            CButton {
                width: 300
                text: qsTr("Work in progress...")
            }
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter

            text: MyManager.about.copyright
            font.pointSize: CStyle.pointSize.copyright
            horizontalAlignment: Text.AlignHCenter
            color: CStyle.foreground
        }
    }

    property list<Item> lhMains
    function createLHMain(lhMain) {
        // Clear
        for (var m in root.lhMains) {
            root.lhMains[m].destroy();
        }
        root.lhMains = [];

        // Create
        var cpt = Qt.createComponent(lhMain);
        if (cpt.status === Component.Ready) {
            root.lhMains.push(cpt.createObject(root));
        } else if (cpt.status === Component.Error) {
            console.log("Main.qml: Error while loading:" + cpt.errorString());
        } else {
            console.log("Main.qml: Something wrong...");
        }
    }
}
