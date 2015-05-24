import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import Ubuntu.Components.ListItems 0.1 as ListItem
//import Ubuntu.Components.Popups 0.1

Item{
    id:wrapper
    //makes component height the right size
    height: list.height + units.gu(5)
    width:parent.width
    Column{
    width:parent.width
    height:parent.height
    spacing:units.gu(3)
    Label{
        //use to hide component when list is empty
        text: todayExpense.contents.day.length === 0 ? "" : "History";
        fontSize: "large"
    }
    ListView {
        id:list
        model: todayExpense.contents.day
        width:parent.width
        height:todayExpense.contents.day.length*units.gu(5)//scales listview to match size of list
        interactive:false
        delegate: ListItem.Subtitled {
            showDivider: false
            Row{
                height:parent.height
                width:parent.width
                spacing:units.gu(2)
                Item{
                    height:itemName.height
                    width:parent.width
                    Label{
                        id:itemName
                        color:modelData.type === 1 ? "#93ba2c" : "#f55443";
                        text:Number(modelData.amount).toLocaleCurrencyString(Qt.locale()) + "  " + modelData.name
                    }
                    Label{
                        fontSize:"small"
                        text:modelData.cat
                        color:UbuntuColors.warmGrey
                        anchors{
                            left:itemName.left
                            top:itemName.bottom
                        }
                    }
                }
            }
        }
    }// end of listview


    }
}


