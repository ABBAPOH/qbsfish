#include "mainwindow.h"

#include <lib/class.h>

#include <QtWidgets/QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    const auto c = std::make_unique<Class>();
    c->foo();

    MainWindow w;
    w.show();

    return app.exec();
}
