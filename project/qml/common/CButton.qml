import QtQuick

Rectangle {
    property alias text: label.text
    signal clicked()

    border.color: {
        if (mouseArea.containsPress) return CStyle.border.pressed
        if (mouseArea.containsMouse) return CStyle.border.hovered
        return CStyle.border.normal
    }
    border.width: CStyle.border.width
    color: CStyle.background.normal
    radius: CStyle.border.radius

    width: 100
    height: 35

    Text {
        id: label
        anchors.fill: parent

        color: CStyle.foreground
        font.pointSize: CStyle.pointSize.normal
        horizontalAlignment: Text.AlignHCenter
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton

        // Avoid 3D View to catch mouse events
        preventStealing: true

        onClicked: parent.clicked()
    }
}
