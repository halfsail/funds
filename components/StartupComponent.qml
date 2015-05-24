import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import "../backend/scripts.js" as Logic
import Ubuntu.Components.Pickers 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components.Popups 0.1

Page{
    id:startup

    Column{
        spacing:units.gu(3)
        anchors.fill: parent
        anchors.margins: units.gu(5)

        Item{
            id:start1
            opacity: 1
            visible: true
            Behavior on opacity { NumberAnimation { easing.type: Easing.OutBack; duration: 1000} }
            Column{
                spacing:units.gu(5)
                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Set Up Process"
                    color:"#235b66"
                    fontSize: "x-large"
                }
                    Image{
                        height:units.gu(32)
                        width:height
                        anchors.horizontalCenter:parent.horizontalCenter
                        source: "../sirsplashy.png"
                        smooth:true
                    }
                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    wrapMode: Text.Wrap
                    width:parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text:"Thank you for downloading funds."
                    fontSize: "large"
                }
                Rectangle{
                    width:parent.width/1.2
                    height:units.gu(5)
                    color:"#235b66"
                    radius: units.gu(3)
                    anchors.horizontalCenter: parent.horizontalCenter
                    Label {
                        text: "Tap to Continue"
                        anchors.centerIn: parent
                        color:"white"
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            start1.opacity = 0;
                            start2.visible = true;
                            start2.opacity = 1;
                            console.log("clicked")
                            //start1.visible = false
                        }
                    }
                }// end of custom button
            }
        }//end of item

        Item{
            id:start2
            width:parent.width
            opacity: 0;
            visible: false
            Behavior on opacity { NumberAnimation { easing.type: Easing.OutBack; duration: 2600} }
            Flickable{
                height:500//parent.height
                width:parent.width
                contentHeight: parent.height+units.gu(50)
                //contentWidth: parent.width
            Column{
                //height:parent.height
                width:parent.width
                spacing:units.gu(4)

                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Setup Budget"
                    color:"#235b66"
                    fontSize: "x-large"
                }
                Item{
                    id:amountholder
                    height:units.gu(5)
                    width:parent.width
                    Label{
                        id:amountLabel
                        text:"Budget Amount"
                    }
                    TextField {
                        id:amount
                        anchors.top: amountLabel.bottom
                        anchors.topMargin: units.gu(2)
                        inputMethodHints: Qt.ImhDigitsOnly
                        width:parent.width
                        color:"#235b66"
                        placeholderText: "0.00"
                    }
                }
                    OptionSelector{
                        id:option
                        text:"On Reset Date"
                        selectedIndex: 0
                        width:parent.width
                        model: [i18n.tr("Carry Over Extra"),i18n.tr("Forget About Extra")]
                        onSelectedIndexChanged: console.log(option.selectedIndex)
                    }
                    Item{
                        width:parent.width
                        height:units.gu(20)
                        Label{
                            id:pickLabel
                            text:"Bugdet Reset Date"
                        }
                        Picker {
                            id:date
                            anchors.top: pickLabel.bottom
                            anchors.topMargin: units.gu(2)
                            circular: false
                            width:parent.width
                            height:units.gu(15)
                            selectedIndex:0
                            model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
                            delegate: PickerDelegate {
                                Label {
                                    text: modelData
                                    anchors.fill: parent
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }
                    }
                    Rectangle{
                        width:parent.width/1.2
                        height:units.gu(5)
                        color:"#235b66"
                        radius: units.gu(3)
                        anchors.horizontalCenter: parent.horizontalCenter
                        Label {
                            text: "Tap to Continue"
                            anchors.centerIn: parent
                            color:"white"
                        }
                        MouseArea{
                            anchors.fill:parent
                            onClicked: {
                                userGoal.contents = {"week":Logic.setupWeeks(parseFloat(amount.text)),
                                    "today": Logic.setupDay(parseFloat(amount.text)), "month": parseFloat(amount.text),"payday": date.selectedIndex + 1, "start":Logic.day()};
                                userCircle.contents = {"week": userGoal.contents.week, "today": userGoal.contents.today, "month": userGoal.contents.month,"payday": userGoal.contents.payday, "start": option.selectedIndex};
                                start2.visible = false;
                                start2.visible = 0;
                                start3.visible = true;
                                start3.opacity = 1;

                            }
                        }
                    }//end of custom button

                }
            }
        }//end of item
        Start3Component{
            id:start3
            opacity: 0;
            visible: false
        }

    }
}
