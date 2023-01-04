import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: passwordField

    focus: true
    selectByMouse: true

    echoMode: TextInput.Password
    passwordCharacter: "•"
    passwordMaskDelay: 1000
    
    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.LoginFontSize
    font.bold: true
    color: config.AccentText
    horizontalAlignment: TextInput.AlignHCenter

    placeholderText: "Enter Password"

    background: Rectangle {
        id: fieldBackground

        color: config.AccentDark
        border.color: config.AccentText
        border.width: 0
        radius: 5
    }

    states: [
        State {
            name: "focused"
            when: passwordField.activeFocus
            PropertyChanges {
                target: fieldBackground
                color: Qt.darker(config.AccentDark, 1.2)
                border.width: 3
            }
        },
        State {
            name: "hovered"
            when: passwordField.hovered
            PropertyChanges {
                target: fieldBackground
                color: Qt.darker(config.AccentDark, 1.2)
            }
        }
    ]

    transitions: Transition {
        PropertyAnimation {
            properties: "color, border.color, border.width"
            duration: 150
        }
    }
}
