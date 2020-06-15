import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import Respira 1.0

import "modes"
import "controls"

ApplicationWindow {
    id: window
    visible: true
    width: 1024
    // Setting max and  min size
    // to avoid resize screens on windowed mode
    minimumWidth: 1024
    maximumWidth: 1024
    minimumHeight: 600
    maximumHeight: 600
    height: 600
    title: qsTr("Ventilator")

    // uncomment this like if you want to see it full-screen
    // But that shouldn't matter on rPI running on EGLFS
    //visibility: Qt.WindowFullScreen

    background: Rectangle {
        color: Style.theme.color.windowBackground
    }

    FpsItem {
        anchors {
            right: parent.right; rightMargin: 8
            bottom: parent.bottom; bottomMargin: 8
        }
        z: 10
    }

    header: ToolBar {
        contentHeight: 60
        background:  Item {  }

        MainHeader {
            anchors {
                left: parent.left; leftMargin: 8
                top: parent.top;
            }

            onMenuClicked: console.log("Menu Click")
            onAlarmSettingsClicked: console.log("Alarm Settings Clicked")
            onModeSelectionClicked: modeSelectionPopup.open()
        }

        DeviceStatusDisplay {
            anchors {
                right: parent.right; rightMargin: 8
                verticalCenter: parent.verticalCenter
            }
        }
    }

    ModeSelectionPopup {
        id: modeSelectionPopup
        currentMode: pageStack.currentMode
        modesModel: pageStack.modesModel
    }

    StackView {
        id: pageStack
        anchors.fill: parent
        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 300
            }
        }
        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        property var currentMode: modesModel.get(0)

        property ListModel modesModel: ListModel {
            ListElement {
                mode: "command_pressure_mode"
                title: qsTr("Command Pressure")
                description: "Space for a short, but well-crafted message summarizing the main reasons for choosing this mode over the others available."
                acronym: "PC"
            }
            ListElement {
                mode: "pressure_assist_mode"
                title: qsTr("Pressure Assist")
                description: "Space for a short, but well-crafted message summarizing the main reasons for choosing this mode over the others available."
                acronym: "A/C PC"
            }
            ListElement {
                mode: "high_flow_nasal_cannula_mode"
                title: qsTr("High-flow nasal cannula")
                description: "Space for a short, but well-crafted message summarizing the main reasons for choosing this mode over the others available."
                acronym: "HFNC"
            }
        }

        property var components: {
            "command_pressure_mode": commandPressureMode,
            "pressure_assist_mode": pressureAssistMode,
            "high_flow_nasal_cannula_mode": highFlowNasalCannulaMode
        }

        onCurrentModeChanged: {
            pageStack.replace(components[currentMode.mode])
            GuiStateContainer.mode_str = currentMode.mode
        }

        Connections {
            target: modeSelectionPopup
            onSelectedMode: pageStack.currentMode = mode
        }
    }

    Component {
        id: pressureAssistMode
        PressureAssistMode {}
    }

    Component {
        id: commandPressureMode
        CommandPressureMode {}
    }

    Component {
        id: highFlowNasalCannulaMode
        HighFlowNasalCannulaMode {}
    }
}
