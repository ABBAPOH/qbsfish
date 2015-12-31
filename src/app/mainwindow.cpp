#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	connect(ui->actionQuit, &QAction::triggered, qApp, &QCoreApplication::quit);
}

MainWindow::~MainWindow()
{
	delete ui;
}
