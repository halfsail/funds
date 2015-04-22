import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db

Item{
    //id:start3
    width:parent.width
    height:parent.height
    opacity: 0;
    visible: false
    Behavior on opacity { NumberAnimation { easing.type: Easing.OutBack; duration: 2600} }
    //--add cat --//

    Column{
        id:col3
        width:parent.width
        spacing:units.gu(3)
        Item{
            id:add
            function storePlayer(playerObject) {
                var tempContents = {};
                tempContents = userCator.contents;
                if (tempContents.cat.indexOf(playerObject) != -1) throw "Already exists";
                tempContents.cat.push(playerObject);
                userCator.contents = tempContents;
                }
        }
        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Setup Catorgorie"
            color:"#235b66"
            fontSize: "x-large"
        }
CatlistComponent{}
    }
    Item{
        width:parent.width
        height:units.gu(5)
        anchors{
            bottom:parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Rectangle{
            //custom button shape
            width:parent.width/1.2
            height:units.gu(5)
            color:"#396B75"
            radius: units.gu(3)
            anchors.horizontalCenter: parent.horizontalCenter;

            Row{
                //position the back button
                width:parent.width
                height:parent.height
                spacing:parent.width/8
                anchors.centerIn: parent
                Item{
                    //this is the back button
                    id:back3
                    width:units.gu(5)
                    height:parent.height
                    Icon{
                        height:parent.height/2
                        width:height
                        anchors.centerIn: parent
                        name:"back"
                        color:"white"
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            start3.opacity = 0;
                            start3.visible = false
                            start2.visible = true
                            start2.opacity = 1;
                        }
                    }
                }//end of back button
                Label {
                    text: "Tap to Finish Setup"
                    anchors.verticalCenter: parent.verticalCenter
                    //anchors.centerIn: parent
                    color:"white"
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            stack.pop()
                            stack.push(home)
                            //change variable marker later
                        }
                    }
                }// end of finish button
            }// end of row
        }//end of custom button
    }
}//end of item 3
