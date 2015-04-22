import QtQuick 2.0
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components 1.1
import "../backend/scripts.js" as Logic


Item {
    anchors.horizontalCenter: parent.horizontalCenter
ListModel {
    id: fruitModel

    ListElement {
        funds: 33.00
        day: "this week"
    }
    ListElement {
        funds: 10.00
        day: "today"
    }
    ListElement {
        funds: 100000
        day: "this month"
    }
}

ListView {
    id:list
         anchors.fill: parent
         //contentX: units.gu(400)
         orientation: ListView.Horizontal
         model: 3//fruitModel
         spacing:units.gu(3)
         //anchors.leftMargin: units.gu(5)
         //currentIndex: 1
         snapMode:ListView.SnapToItem
         preferredHighlightBegin: units.gu(5)
         preferredHighlightEnd: units.gu(5)
         delegate: Circle{

             MouseArea{
                 anchors.fill:parent
                 onClicked: list.currentIndex = model.index
             }

             x: list.x
                     Behavior on x {
                         SpringAnimation {
                             spring: 3
                             damping: 0.2
                         }
                     }

         }
         //highlight: Rectangle {color: "lightsteelblue"; radius: 5;}
         //highlightFollowsCurrentItem: true
         highlightRangeMode: ListView.StrictlyEnforceRange
         focus: true;
         Component.onCompleted: {positionViewAtIndex(1, ListView.Center)}
     }

}

/*Flickable {
    flickableDirection: Flickable.HorizontalFlick
    clip:true

    Grid {
        width:parent.width
        height:parent.width
        columns:2
        spacing: parent.width/5


    Item{
        height:units.gu(35)
        width: height - units.gu(5)

    Rectangle {
        id:back
        height:units.gu(30)
        width:height
        radius:units.gu(50)
        //color:"#484F56"
        color: "#E13949"


        Item{
            id:lvlHold
            clip:true
            anchors.bottom:parent.bottom

            height: parent.height
            //radius:50
            width:parent.width

        Rectangle{
            id:lvl
            anchors.bottom:parent.bottom
            anchors.bottomMargin: units.gu(1)
            anchors.horizontalCenter: parent.horizontalCenter
            height: units.gu(28)
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
        text:"today"
        fontSize:"large"
        anchors.topMargin: units.gu(2)
        anchors.bottom:parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}



    Item{
        height:units.gu(35)
        width: height - units.gu(5)

    Rectangle {
        id:back2
        height:units.gu(30)
        width:height
        radius:units.gu(50)
        //color:"#484F56"
        color: "#333333"


        Item{
            id:lvlHold2
            clip:true
            anchors.bottom:parent.bottom

            height: parent.height
            //radius:50
            width:parent.width

        Rectangle{
            id:lvl2
            anchors.bottom:parent.bottom
            anchors.bottomMargin: units.gu(1)
            anchors.horizontalCenter: parent.horizontalCenter
            height: units.gu(28)
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
        text:"today"
        fontSize:"large"
        anchors.topMargin: units.gu(2)
        anchors.bottom:parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
    }

}
*/


