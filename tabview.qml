import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.3
Rectangle {
    width: 400
    height: 462
    color:Qt.rgba(Math.random())
    Row{
        id:col
        width: parent.width
        height: 50
        Button{
            id:addTab
            width:col.width/2
            height:50
            text: "添加页面"
            onClicked:{
                tabview.loadTab();
            }
        }
        Button{
            id:getInfo
            width:col.width/4
            height:50
            text:"获取当前页面内容"
            onClicked:{
                input.text = getCurrentTxt(tabview.currentIndex);
            }
        }
        TextInput{
            id:input
            width:col.width/4
            height:50
            text:"当前页面内容...."
            clip:true
            wrapMode: TextInput.WrapAnywhere
        }
    }

    TabView{
        id:tabview
        visible: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: col.bottom
        anchors.bottom: parent.bottom
        Component{
            id:viewComp
            Mytab{
                anchors.fill:parent
                color:"black"
            }
        }
        function loadTab(){
            var c_tab=currentIndex;
            var t=tabview.addTab(count,viewComp)
            currentIndex=count-1;
            t.item.color=Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
            setCurrentTxt(tabview.currentIndex,count-1);
            tabview.currentIndex = count-1;
        }
        style: TabViewStyle {
                frameOverlap: 1
                tab: Rectangle {
                    color: styleData.selected ? "steelblue" :"lightsteelblue"
                    border.color:  "steelblue"
                    implicitWidth: Math.max(text.width + 4, 80)
                    implicitHeight: 20
                    radius: 2
                    Text {
                        id: text
                        anchors.centerIn: parent
                        text: styleData.title
                        color: styleData.selected ? "white" : "black"
                    }
                    Image {
                        id: img
                        source: styleData.selected ?"http://download.easyicon.net/png/504283/16/":""
                        anchors.right: parent.right
                        anchors.rightMargin: -4
                        anchors.top: parent.top
                        anchors.topMargin: -4
                    }
                }
                frame: Rectangle { color: "steelblue" }
            }
    }
    function setCurrentTxt(index,txt){
        var obj =  tabview.getTab(index);
        if(obj){
            var item = obj.item;
            if(item){
                 item.setTxt(txt);
            }
        }
    }
    function getCurrentTxt(index){
        var obj =  tabview.getTab(index);
        if(obj){
            var item = obj.item;
            if(item){
                return item.returnTxt();
            }
        }
        return "error";
    }
}

