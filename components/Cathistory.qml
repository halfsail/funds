import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import Ubuntu.Components.ListItems 0.1 as ListItem
//import Ubuntu.Components.Popups 0.1

//history list component

    Column{
        id:col
        height:list.height
        width:parent.width
        spacing:units.gu(3)
        clip:true

        Flickable{
            height:parent.height
            width:parent.width
            contentHeight: list.height + units.gu(5)
            ListView {
                id:list
                model: userCator.contents.cat
                width:parent.width
                height:userCator.contents.cat.length*units.gu(5)//scales listview to match size of list
                interactive:false
                delegate:
                    Item{
                    width:parent.width
                    height: units.gu(5)
                    anchors.horizontalCenter: parent.horizontalCenter
                    Label{
                        text:modelData.catName
                        anchors{
                            verticalCenter: parent.verticalCenter
                            left:parent.left
                            leftMargin: units.gu(3)
                        }
                    }
                    Label{
                        text:Number(Math.abs(modelData.amount)).toLocaleCurrencyString(Qt.locale());
                        color:modelData.amount < 0 ? "#93ba2c" : "#5f5f5f";
                        anchors{
                            right:parent.right
                            rightMargin: units.gu(3)
                            verticalCenter: parent.verticalCenter
                        }
                    }
                }

                    /*ListItem.SingleValue {
                    showDivider: false
                    text:modelData.catName;
                    value:modelData.amount < 0 ? "+ "+Number(Math.abs(modelData.amount)).toLocaleCurrencyString(Qt.locale()) : Number(Math.abs(modelData.amount)).toLocaleCurrencyString(Qt.locale());
                }*/
            }// end of listview
        }// end of flick
    }

