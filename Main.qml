import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import "components"
import "backend/scripts.js" as Logic


MainView {
    objectName: "mainView"
    backgroundColor: "#ffffff"
    applicationName: "funds2.kevinfeyder"
    useDeprecatedToolbar: false
    width: units.gu(45)
    height: units.gu(75)

    //--- database -- //
    U1db.Database {
            id:fundsSave;
            path: "funds.u1db"
        }
        U1db.Document {
          id: userCircle
          //stores waterlvl number, and user progress and end goal
          database: fundsSave
          docId: "progress"
          create: true
          defaults: { "week": 49, "today": 10, "month": 147, "payday": 8,"start":0}
        }
        U1db.Document {
          id: userGoal
          //stores goals and payday amount
          database: fundsSave
          docId: "goal"
          create: true
          defaults: { "week": 49, "today": 10, "month": 147, "payday": 8,"start":0}
        }
        U1db.Document {
          id: userCator
          //stores expense catigorie
          database: fundsSave
          docId: "cator"
          create: true
          defaults: {"cat":[{"catName": "Miscellanneous", "amount":0},{"catName": "Personal", "amount":0}]}
        }
        U1db.Document {
          id: todayExpense
          //stores todays expenes
          database: fundsSave
          docId: "today"
          create: true
          defaults: {"day":[]}
        }
        Item{
            id:addItem
            Timer {
                interval: 500; running: true; repeat: true
                onTriggered:{ addItem.newDay();}
             }

            function newDay(){
                if(userGoal.contents.start !== Logic.day() && userGoal.contents.start === 0 ){ //first time started
                    userGoal.contents = {"week":userGoal.contents.week,"today": userGoal.contents.today,
                        "month":userGoal.contents.month,"payday": userGoal.contents.payday, "start":Logic.day()};
                    addItem.deleteItem()
                    addItem.clearCat()
                }else if (userGoal.contents.start !== Logic.day() ){//new day
                    if(Logic.day() === 0){
                        addItem.clearCat()
                        userGoal.contents = {"week":Logic.setupWeeks((userGoal.contents.month + Math.abs(userCircle.contents.today))),"today": Logic.setupDay((userGoal.contents.month + Math.abs(userCircle.contents.today))),
                            "month": (userGoal.contents.month + Math.abs(userCircle.contents.today)),"payday": userGoal.contents.payday, "start":userGoal.contents.start};
                    }

                    addItem.deleteItem();
                    //stores saving to cat list
                    addItem.storeCat(0,{"cat":userCator.contents.cat[0].amount},{"catName":userCator.contents.cat[0].catName, "amount":userCator.contents.cat[0].amount-parseFloat(userCircle.contents.today)});
                    //saves savings to history list
                    addItem.storeExpense({"type":1,"name":"Savings","amount":parseFloat(userCircle.contents.today),"cat":userCator.contents.cat[0].catName});
                    //reset circles
                    addItem.transferDay();
                    // mont check function here
                    print("cirecle " + userCircle.contents.today)
                    print("goal " + userGoal.contents.today)
                    print(parseFloat(parseFloat(userGoal.contents.today) + parseFloat(userCircle.contents.today)))

                }else { // same day
                    // do nothing
                }

            }
            function checkMonth(){

            }
            function transferDay(){//reset circles
               print("enter")
                userGoal.contents = {"week":userGoal.contents.week,"today": userGoal.contents.today,
                    "month":userGoal.contents.month,"payday": userGoal.contents.payday, "start":Logic.day()};
                //reset circles
                userCircle.contents = {"week":parseFloat(parseFloat(userCircle.contents.week) + parseFloat(userCircle.contents.today)),"today":(parseFloat(parseFloat(userGoal.contents.today) + parseFloat(userCircle.contents.today))),
                    "month": parseFloat(parseFloat(userCircle.contents.month) + parseFloat(userCircle.contents.today)),"payday": userGoal.contents.payday, "start":userCircle.contents.start};

            }
            function storePlayer(playerObject) {
                //add new budget cat
                var tempContents = {};
                tempContents = userCator.contents;
                if (tempContents.cat.indexOf(playerObject) != -1) throw "Already exists";
                tempContents.cat.push(playerObject);
                userCator.contents = tempContents;
                }
            function storeExpense(playerObject) {
                //stores expense/income to history list
                var tempContents = {};
                tempContents = todayExpense.contents;
                if (tempContents.day.indexOf(playerObject) != -1) throw "Already exists";
                tempContents.day.push(playerObject);
                todayExpense.contents = tempContents;
            }
            function storeCat(index,oldDice, newDice) {
                //used when adding values to the cat list
                var tempContents = {};
                tempContents = userCator.contents;
                tempContents.cat.splice(index, 1, newDice);
                userCator.contents = tempContents;
            }
            function clearCat(){
                for(x=0; x < userCator.contents.cat.length; x++){
                    addItem.storeCat(x,{"catName":userCator.contents.cat[0].catName},{"catName":userCator.contents.cat[x].catName, "amount":0})
                }
            }

            function deleteItem() {
                var tempContents = {};
                tempContents = todayExpense.contents;
                var index = tempContents.day.indexOf();
                tempContents.day.splice(0, todayExpense.contents.day.length);
                todayExpense.contents = tempContents;
            }
            function dismissCat(index) {
                // deletes cat from budget list
                var tempContents = {};
                tempContents = userCator.contents;
                //var index = tempContents.players.indexOf(index);
                tempContents.cat.splice((index),1);
                userCator.contents = tempContents;
            }

        }

        PageStack {
            id:stack
            Component.onCompleted: userGoal.contents.start === 0 ? stack.push(start) : stack.push(home);
        }
        StartupComponent{
            id:start
            anchors.fill:parent
            visible: false
        }

    PageWithBottomEdge {
        id:home
        visible: false
        title: i18n.tr("Funds")
        clip:true
        // bottom edge page code
        bottomEdgeTitle: i18n.tr("Details")
        bottomEdgePageComponent:Page {
            id:details
            title: i18n.tr("Details")
            Cathistory{
                width:parent.width
                height:parent.height
            }
        } // end of bottomedge

        head.actions: Action {
            id:settingCog
            iconName: "settings"
            onTriggered:{
                stack.push(settings);
                //userGoal.contents = {"week":userGoal.contents.week,"today": userGoal.contents.today,
                    //"month":userGoal.contents.month,"payday": userGoal.contents.payday, "start":0};

            }
        }
        Flickable{
            width:parent.width
            height:parent.height
            contentHeight: home.height + log.height

        Column {
            spacing: units.gu(4)
            anchors {
                margins: units.gu(3)
                fill: parent
            }
            ListComponent{
                height:units.gu(35)
                width:parent.width
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                fontSize:"large"
                text: Logic.daysInMonth(userGoal.contents.payday) + " days left"
            }

            Rectangle{
                width:parent.width/1.2
                height:units.gu(5)
                color:"#235b66"
                radius: units.gu(3)
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "add expense"
                    anchors.centerIn: parent
                    color:"white"
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        stack.push(add)
                    }
                }
            }// end of custom button
        }
        HistoryComponent{
            id:log
            width: parent.width - units.gu(6)
            anchors{
                bottom:parent.bottom
                bottomMargin: units.gu(4)
                horizontalCenter: parent.horizontalCenter
            }
        }
        }
    }


    //-- add funds pages ---//
    SettingsComponent{
        id:settings
    }
    ExpenseComponent{
        id:add
    }
}

