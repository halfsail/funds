import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components.Popups 0.1

Item{
    width:parent.width
    height:units.gu(25)
    Column{
    width:parent.width
    height:parent.height
    spacing:units.gu(2)

        ListItem.Base{
            width:parent.width
            height:units.gu(5)
            Label{
                id:catorgorietext
                text:"Budget Catorgorie"
                //fontSize:"large"
                anchors.verticalCenter: parent.verticalCenter
            }
            Icon{
                height:catorgorietext.height
                width:height
                color:"#93ba2c"
                name:"add"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                MouseArea{
                    anchors.fill: parent
                    onClicked: PopupUtils.open(fav)
                }
            }
        }


        Item{
            height:units.gu(40)
            width:parent.width
            Column {
                id: contentCol1
                width:parent.width
                ListView {
                    id:list
                    model: userCator.contents.cat.reverse()
                    width:parent.width
                    height:units.gu(40)
                    delegate: ListItem.Standard {
                        showDivider: false
                        text: modelData.catName;
                        Row{
                            spacing:units.gu(2)
                            anchors{
                                verticalCenter: parent.verticalCenter
                                right:parent.right
                                rightMargin: units.gu(3)
                            }
                            Icon{
                                name: "delete"
                                width:units.gu(3)
                                color:"#f55443"
                                height:width
                                anchors{
                                    verticalCenter: parent.verticalCenter
                                }
                                MouseArea{
                                    anchors.fill:parent;
                                    onClicked:{
                                        serve.deleteFavorite(modelData.foodName, modelData.calorieCount)
                                        console.log("bye")
                                    }
                                }
                            }
                        }// end of row
                    }
                }// end of listview
            }
        }
    FavComponent{ id:fav }
    }
}//end of item
