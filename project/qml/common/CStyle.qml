pragma Singleton
import QtQuick

QtObject {
    property QtObject background: QtObject {
        property color normal: "#FF049747"
        property color window: "#FFCCCCCC"
    }
    property QtObject border: QtObject {
        property color normal: "#FF000000"
        property color pressed: "#FFEEEEEE"
        property color hovered: "#FF999999"
        property int width: 2
        property int radius: 5
    }
    property color foreground: "#FF000000"
    property QtObject pointSize: QtObject {
        property int title: 25
        property int normal: 16
        property int copyright: 12
    }
}
