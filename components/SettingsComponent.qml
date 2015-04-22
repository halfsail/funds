import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import "../backend/scripts.js" as Logic
import Ubuntu.Components.ListItems 0.1 as ListItem

Page{
    id:add
    title: "Settings"
    /*head.backAction: Action {
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
    }*/
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
            spacing: units.gu(1)
            ListItem.Standard{
                text:"Change Budget"
                progression: true
                onClicked: {
                    stack.pop()
                    stack.push(start)
                }
            }
            ListItem.Standard{
                text:"Change Reset Date"
                progression: true
                onClicked: {
                    stack.pop()
                    stack.push(start)
                }
            }
            ListItem.Standard{
                text:"Factory Reset"
                progression: true
                onClicked: {
                    stack.pop()
                    stack.push(start)
                }
            }

            CatlistComponent{}
        }
    }
}
