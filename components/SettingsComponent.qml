import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import "../backend/scripts.js" as Logic
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components.Popups 0.1

Page{
    id:add
    title: "Settings"
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
                text:"Change Budget Infomation"
                progression: true
                onClicked: {
                    PopupUtils.open((dialog))
                }
            }
            Component{
                id:dialog
            Dialog {
             id: dialogue
             title: "Change Infomation"
             text: "This will reset your current progress are you sure?"
             Button {
                 text: "Continue"
                 color:"#235b66"
                 onClicked:
                 {
                     stack.pop()
                     stack.push(start)
                     PopupUtils.close(dialogue)
                 }
             }
             Button {
                 text: "Cancel"
                 onClicked: PopupUtils.close(dialogue)
             }
            }
            }
            CatlistComponent{}
        }
    }

}
