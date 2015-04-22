import QtQuick 2.0
import Ubuntu.Components.ListItems 0.1 as ListItem
import U1db 1.0 as U1db
import Ubuntu.Components 1.1
import "../backend/scripts.js" as Logic



    Item{
        height:units.gu(35)
        width: height - units.gu(5)

    Rectangle {
        id:back
        height:units.gu(30)
        width:height
        radius:units.gu(50)
        color: Logic.color(index);
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            font.pixelSize: back.height*0.17
            text:Number(Logic.circleText(index,userCircle.contents.week, userCircle.contents.today, userCircle.contents.month)).toLocaleCurrencyString(Qt.locale())
             wrapMode: Text.WordWrap
            color: "white"
            anchors.centerIn: parent
        }


        Item{
            id:lvlHold
            clip:true
            anchors.bottom:parent.bottom
            Behavior on height { NumberAnimation { easing.type: Easing.OutBack; duration: 1300} }
            height: Logic.lvl(userCircle.contents.week, userCircle.contents.today, userCircle.contents.month,
                              userGoal.contents.week, userGoal.contents.today, userGoal.contents.month,
                              lvl.height, index) //units.gu(Logic.lvl(index))//parent.height - Logic.lvl(parent.height, 5)
            width:parent.width

        Rectangle{
            id:lvl
            anchors.bottom:parent.bottom
            anchors.bottomMargin: units.gu(.5)
            anchors.horizontalCenter: parent.horizontalCenter
            height: units.gu(29)
            radius: units.gu(50)
            width:height
            color:"white"
            opacity: .2

            Behavior on height {
                SpringAnimation {
                     spring: 3
                     damping: 0.2
                 }
            }
        }
    }


    }//end of back


    Label {
        text:Logic.circleLorem(index)
        fontSize:"large"
        anchors.topMargin: units.gu(2)
        anchors.bottom:parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}


