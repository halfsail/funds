import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import Ubuntu.Components.ListItems 1.0 as ListItem
import U1db 1.0 as U1db
import "../components"

Component {
    id: dialogComponent

    Dialog {
        id: dialog
        title: "Add Category"
        Column {
            //height:units.gu(30)
            width:parent.width
            spacing:units.gu(3)
            clip:true
            anchors.top:head.bottom

            Label{
                text:"Category Name"
            }
            TextField{
                id:expenseName
                width:parent.width
                //height:units.gu(5)
                placeholderText: "Food"
            }
            Label{
                text:"Color"
            }
            Grid{
                columns: 4
                columnSpacing: units.gu(4)
                rowSpacing:units.gu(3)
                rows: 2
                //spacing:units.gu(3)
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
                Rectangle {
                    color: "transparent";
                    border.color: "red"
                    border.width: units.gu(.5)
                    radius:units.gu(50)
                    width: units.gu(4); height:width
                }
            }

        Button {
            text: i18n.tr("Save")
            width:parent.width
            color:UbuntuColors.green
            onClicked:{
                //PopupUtils.close(dialog)
                add.storePlayer({"catName":expenseName.text,"amount":0})
            }
        }
        Button {
            text: i18n.tr("Cancel")
            width:parent.width
            onClicked:{ PopupUtils.close(dialog) }
        }
    }
}
}
