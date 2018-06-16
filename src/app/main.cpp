#include "mainwindow.h"

#include <lib/class.h>

#include <QtWidgets/QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Class c;
    c.foo();

    MainWindow w;
    w.show();

    return app.exec();
}
