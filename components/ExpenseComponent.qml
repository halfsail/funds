import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import Ubuntu.Components.Pickers 0.1
import "../backend/scripts.js" as Logic

Page{
    id:add
    title: "Expense"
    head.backAction: Action {
        iconName: "close"
        onTriggered: stack.pop(home);
    }
    head.actions: Action {
        id:save
        iconName: "ok"
        onTriggered:{

            if(amount.text === ""){
                //do nothing
                amountLabel.color = "#f55443"
                amountLabel.text = "Expense Amount    (invalid amount)"
            } else if(type.selectedIndex === 0) {
                    userCircle.contents = {"week": userCircle.contents.week - parseInt(amount.text),
                    "today": userCircle.contents.today - parseInt(amount.text), "month": userCircle.contents.month - parseInt(amount.text), "payday":userCircle.payday};
                    stack.pop(home);
            } else {
                userCircle.contents = {"week": userCircle.contents.week + parseInt(amount.text),
                    "today": userCircle.contents.today + parseInt(amount.text), "month": userCircle.contents.month + parseInt(amount.text), "payday":userCircle.payday};
                    stack.pop(home);
            }
        }
    }
    visible: false
    Flickable{
        height: parent.height
        width:parent.width
        clip:true
        contentHeight: parent.height + units.gu(10)
        Column{
            anchors{
                fill:parent
                margins:units.gu(3)
            }
            /*TextField {
                style: Rectangle {
                    height:units.gu(5)
                    color:"#235b66"
                    radius: units.gu(3)
                }
            }*/
            spacing: units.gu(3)
            OptionSelector{
                id:type
                text:"Type"
                selectedIndex: 0
                model: [i18n.tr("Expense"),i18n.tr("Income")]
                onSelectedIndexChanged: console.log(type.selectedIndex)
            }
            Label{
                id:amountLabel
                text:"Expense Amount"
            }
            TextField {
                id:amount
                inputMethodHints: Qt.ImhDigitsOnly
                width:parent.width

                color:"#235b66"
                placeholderText: "0.00"
            }

            Item{
                width:parent.width
                height:units.gu(20)
                Label{
                    id:pickLabel
                    text:"Expense Catorgorie"
                }
                Picker {
                    model: userCator.contents.cat
                    width:parent.width
                    anchors{
                        top: pickLabel.bottom
                        topMargin: units.gu(2)
                    }
                    selectedIndex:0
                    circular:false
                    delegate: PickerDelegate {
                        Label {
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            text: modelData.catName
                        }
                    }
                    onSelectedIndexChanged: print("index = " + selectedIndex)
                }// end of picker
            }
        }
    }
}
