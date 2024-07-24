import QtQuick

Rectangle {
    property alias text: textEdit.text
    property alias placeholder: placeholderText.text
    signal clicked()
    signal editingFinished()

    id: rect
    border.color: {
        if (textEdit.focus) return CStyle.border.pressed
        if (mouseArea.containsMouse) return CStyle.border.hovered
        return CStyle.border.normal
    }
    border.width: CStyle.border.width
    color: CStyle.background.normal
    radius: CStyle.border.radius

    width: 250
    height: 40

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
    }

    TextInput {
        id: textEdit
        anchors.fill: parent
        anchors.margins: 5

        font.pointSize: CStyle.pointSize.normal
        horizontalAlignment: Text.AlignHCenter
        color: CStyle.foreground

        onFocusChanged: {
            if (focus)
                rect.clicked()
        }
        onEditingFinished: rect.editingFinished()

        Text {
            id: placeholderText
            anchors.fill: parent
            visible: textEdit.text === ""

            font.pointSize: CStyle.pointSize.normal
            font.italic: true
            horizontalAlignment: Text.AlignHCenter
            color: "#CCCCCC"
        }
    }
}
