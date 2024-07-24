import QtQuick
import QtQuick.Layouts

Item {
    property int value: 0
    property int from: 0
    property int to: 100

    id: root
    width: 220
    height: 30
    Rectangle {
        id: line
        anchors.left: root.left
        anchors.right: root.right
        anchors.verticalCenter: root.verticalCenter

        height: 8
        border.color: "black"
        border.width: 2
        radius: height
        color: "transparent"
    }

    Rectangle {
        id: indicator
        anchors.verticalCenter: root.verticalCenter

        x: (root.value - root.from) / (root.to - root.from) * (line.width - indicator.width) + line.x
        height: 20
        width: 20
        border.color: "black"
        border.width: 2
        radius: height
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        preventStealing: true
        onPositionChanged: updateValue()
        onClicked: updateValue()

        function updateValue() {
            var newValue = (mouseX - indicator.width / 2 - line.x) / (line.width - indicator.width) * (root.to - root.from) + root.from;
            newValue = Math.max(newValue, root.from);
            newValue = Math.min(newValue, root.to);
            root.value = newValue;
        }
    }
}
