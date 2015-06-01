#include "mainwindow.h"
#include <QApplication>
#include <QQuickWidget>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    //w.show();
    QQuickWidget *view = new QQuickWidget;
    view->setSource(QUrl::fromLocalFile("../../../tabview.qml"));
    view->show();
    return a.exec();
}
