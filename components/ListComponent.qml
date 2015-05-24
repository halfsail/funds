import QtQuick 2.0
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components 1.1
import "../backend/scripts.js" as Logic


Item {
    anchors.horizontalCenter: parent.horizontalCenter


ListView {
    id:list
         anchors.fill: parent
         //contentX: units.gu(400)
         orientation: ListView.Horizontal
         model: 3//fruitModel
         spacing:units.gu(1.1)
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



