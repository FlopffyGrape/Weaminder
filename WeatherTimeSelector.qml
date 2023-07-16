import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ComboBox {
    id: weatherTimeSelector

    anchors.right: parent.right
    anchors.left: parent.left

    model: ListModel {
        id: listModel
    }

    delegate: Item {
        width: parent.width
        height: 50

        Row {
            spacing: 10

            Image {
                source: modelIcon
                width: 32
                height: 32
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 8
            }

            Label {
                font.pointSize: 12
                text: modelData // Display the item text
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                currentIndex = index
                weatherTimeSelector.popup.close()
            }
        }
    }

    function addTimeToList() {
        for (let i = 0; i < 24; i++)
            listModel.append({
                modelData: dateTime.getFollowingHours()[i],
                modelIcon: weather.weatherIconPaths[i]
            });
    }

//    Component.onCompleted: {
//        addTimeToList()
//    }
}
