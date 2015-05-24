import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import Ubuntu.Components.Pickers 0.1
import "../backend/scripts.js" as Logic

//add expense page

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
                //error handling
                //do nothing
                amountLabel.color = "#f55443"
                amountLabel.text = "Expense Amount    (invalid amount)"
            } else if(type.selectedIndex === 0) {
                //if expense is choosen
                //subtracts from circles
                userCircle.contents = {"week": userCircle.contents.week - parseInt(amount.text),
                    "today": userCircle.contents.today - parseFloat(amount.text), "month": userCircle.contents.month - parseFloat(amount.text), "payday":userCircle.payday};
                //stores expense to history list
                addItem.storeExpense({"type":type.selectedIndex,"name":name.text,"amount":parseFloat(amount.text),"cat":userCator.contents.cat[picker.selectedIndex].catName});
                //stores expense to cat list
                addItem.storeCat(picker.selectedIndex,{"cat":userCator.contents.cat[picker.selectedIndex].amount},{"catName":userCator.contents.cat[picker.selectedIndex].catName, "amount":userCator.contents.cat[picker.selectedIndex].amount+(parseFloat(amount.text))*1 });
                stack.pop(home);
            } else {
                //if income is picked
                //adds to circles
                userCircle.contents = {"week": userCircle.contents.week + parseInt(amount.text),
                    "today": userCircle.contents.today + parseFloat(amount.text), "month": userCircle.contents.month + parseFloat(amount.text), "payday":userCircle.payday};
                //stores income to history
                addItem.storeExpense({"type":type.selectedIndex,"name":name.text,"amount":parseFloat(amount.text),"cat":userCator.contents.cat[picker.selectedIndex].catName});
                //stores income to cat list
                addItem.storeCat(picker.selectedIndex,{"cat":userCator.contents.cat[picker.selectedIndex].amount},{"catName":userCator.contents.cat[picker.selectedIndex].catName, "amount":userCator.contents.cat[picker.selectedIndex].amount-parseFloat(amount.text)});
                stack.pop(home);
            }
            name.text="";
            amount.text="";
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
            spacing: units.gu(3)
            OptionSelector{
                id:type
                text:"Type"
                selectedIndex: 0
                model: [i18n.tr("Expense"),i18n.tr("Income")]
                onSelectedIndexChanged: console.log(type.selectedIndex)
            }
            Label{
                id:nameLabel
                text:"Item Name"
            }
            TextField {
                id:name
                width:parent.width

                color:"#235b66"
                placeholderText: "latte"
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
                    id:picker
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
                            id:pickName
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            text: modelData.catName

                        }
                    }

                }// end of picker
            }
        }
    }
}
