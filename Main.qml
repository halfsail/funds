import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import "components"
import "backend/scripts.js" as Logic

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    backgroundColor: "#ffffff"
    // Note! applicationName needs to match the "name" field of the click manifest
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
          defaults: { "week": 49, "today": 10, "month": 147, "payday": 8,}
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
          //stores goals and payday amount
          database: fundsSave
          docId: "cator"
          create: true
          defaults: {"cat":[{"catName": "Miscellanneous", "amount":0},{"catName": "Personal", "amount":0}]}
        }
        PageStack {
            id:stack
            Component.onCompleted: userGoal.contents.start === 0 ? stack.push(start) : stack.push(home);
        }
        StartupComponent{
            id:start
            anchors.fill:parent
            visible: false//userGoal.contents.start === 0 ? start.visible = true : start.visible = false;
        }

    Page {
        id:home
        visible: false//userGoal.contents.start === 0 ? home.visible = false : home.visible = true;
        title: i18n.tr("Funds")
        head.actions: Action {
            id:settingCog
            iconName: "settings"
            onTriggered:{
                //console.log(Logic.daysInMonth())
                stack.push(settings);
                //userCircle.contents = {"week": userGoal.contents.week, "today": userGoal.contents.today, "month": userGoal.contents.month,"payday": userGoal.contents.payday, "start": 0};
                //userGoal.contents = {"week": 49, "today": 10, "month": 147,"payday": 8, "start":0};
            }
        }

        Column {
            spacing: units.gu(4)
            anchors {
                margins: units.gu(2)
                fill: parent
            }
            ListComponent{
                height:units.gu(40)
                width:parent.width
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                fontSize:"large"
                //color:"#235b66"
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
    }

    //-- add funds pages ---//
    SettingsComponent{
        id:settings
    }
    ExpenseComponent{
        id:add
    }
}

