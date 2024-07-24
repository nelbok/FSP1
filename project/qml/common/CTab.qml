import QtQuick

Rectangle {
    property int nHeightMin: 40
    property int nHeightMax: 200
    property int nWidth: 250
    property bool collapsing: true
    property bool collapsed: height === nHeightMin
    property bool expanded: height === nHeightMax
    property alias title: title.text
    property alias content: innerContent
    signal titleClicked()

    id: root

    border.color: {
        if (titleArea.containsPress || !collapsed) return CStyle.border.pressed
        if (titleArea.containsMouse) return CStyle.border.hovered
        return CStyle.border.normal
    }
    border.width: CStyle.border.width
    color: CStyle.background.normal
    radius: CStyle.border.radius

    width: nWidth
    height: (collapsing) ? nHeightMin : nHeightMax

    MouseArea {
        anchors.fill: parent

        // Avoid 3D View to catch mouse events
        preventStealing: true
    }

    Behavior on height {
        NumberAnimation { duration: 100 }
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5

        text: parent.title
        font.pointSize: CStyle.pointSize.normal
        horizontalAlignment: Text.AlignHCenter
        color: CStyle.foreground
        height: parent.nHeightMin - 10

        MouseArea {
            id: titleArea

            anchors.fill: parent

            hoverEnabled: true
            acceptedButtons: Qt.LeftButton

            // Avoid 3D View to catch mouse events
            preventStealing: true

            onClicked: {
                root.titleClicked()
                root.focus = true
            }
        }
    }

    Rectangle {
        id: line
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.right: parent.right
        anchors.rightMargin: 2

        height: 2

        color: CStyle.border.normal
        visible: parent.expanded
    }

    Item {
        id: innerContent
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5
    }
}
