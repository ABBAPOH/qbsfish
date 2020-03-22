#include "mainwindow.h"

#include <fishlib/class.h>

#include <QtWidgets/QApplication>
#include <QtCore/QDebug>
#include <QtCore/QDir>
#include <QtCore/QLibrary>

using BarFunc = const char *(*)();

QString pluginsDir()
{
    QString result = QCoreApplication::applicationDirPath();
#if defined(Q_OS_MAC)
    result += "/../PlugIns" ;
#elif defined(Q_OS_WIN)
    result += "/plugins";
#else
    result += "/../lib/fish/plugins";
#endif
    return QDir::cleanPath(result);
}

QString pluginFileName(QStringView pluginName)
{
#if defined(Q_OS_WIN)
    return pluginName.toString();
#else
    return QStringLiteral("lib%1").arg(pluginName);
#endif
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    const auto c = std::make_unique<Class>();
    c->foo();

    qDebug() << pluginsDir();

    QLibrary lib(pluginsDir() + '/' + pluginFileName(u"FishPlugin"));
    if (!lib.load()) {
        qCritical() << "Failed to load plugin";
        return 1;
    }
    auto barFunc = reinterpret_cast<BarFunc>(lib.resolve("bar"));
    if (!barFunc) {
        qCritical() << "Failed to resolve bar";
        return 1;
    }
    qDebug() << barFunc();

    MainWindow w;
    w.show();

    return app.exec();
}
