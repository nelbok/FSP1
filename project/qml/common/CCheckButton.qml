import QtQuick

Rectangle {
    property bool checked: false
    property alias text: label.text
    signal clicked()
    signal pressed()
    signal released()

    border.color: {
        if (mouseArea.containsPress || checked) return CStyle.border.pressed
        if (mouseArea.containsMouse) return CStyle.border.hovered
        return CStyle.border.normal
    }
    border.width: CStyle.border.width
    color: CStyle.background.normal
    radius: CStyle.border.radius

    width: 35
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
        onPressed: parent.pressed()
        onReleased: parent.released()
    }
}
