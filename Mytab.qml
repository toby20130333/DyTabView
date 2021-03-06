import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Rectangle{
    id:tab
    width:400
    height:parent.width
    Flickable {
         id: flick
         width: 300; height: 200;
         anchors.centerIn: parent
         contentWidth: edit.paintedWidth
         contentHeight: edit.paintedHeight
         clip: true
         function ensureVisible(r)
         {
             if (contentX >= r.x)
                 contentX = r.x;
             else if (contentX+width <= r.x+r.width)
                 contentX = r.x+r.width-width;
             if (contentY >= r.y)
                 contentY = r.y;
             else if (contentY+height <= r.y+r.height)
                 contentY = r.y+r.height-height;
         }
         TextEdit {
             id: edit
             width: flick.width
             height: flick.height
             focus: true
             wrapMode: TextEdit.Wrap
             onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
         }
     }
    function returnTxt(){
        return edit.text;
    }
    function setTxt(str){
        edit.text = str+"页面";
    }
}

