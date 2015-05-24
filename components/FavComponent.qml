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

            TextField{
                id:expenseName
                width:parent.width
                //height:units.gu(5)
                placeholderText: "Food"
            }

        Button {
            text: i18n.tr("Save")
            width:parent.width
            color:"#93ba2c"
            onClicked:{
                PopupUtils.close(dialog)
                addItem.storePlayer({"catName":expenseName.text,"amount":0})
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
