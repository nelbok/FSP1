#include <QtGui/QGuiApplication>
#include <QtGui/QIcon>
#include <QtQml/QQmlApplicationEngine>

#include <fsd/data/Character.hpp>
#include <fsd/data/Project.hpp>

#include "Config.hpp"
#include "Manager.hpp"

void initApp(QGuiApplication& app) {
	app.setOrganizationName(fsp1::Config::organization);
	app.setApplicationName(fsp1::Config::name);
	app.setApplicationVersion(fsp1::Config::version);
	app.setWindowIcon(QIcon(":/logo/logo.png"));
}

void initRegister(fsp1::Manager* manager) {
	// FSData
	qmlRegisterType<fsd::Character>("project", 1, 0, "MyCharacter");

	// FSP1
	qmlRegisterSingletonInstance("project", 1, 0, "MyManager", manager);
}

int main(int argc, char* argv[]) {
	QGuiApplication app(argc, argv);
	initApp(app);

	QScopedPointer<fsp1::Manager> manager(new fsp1::Manager);
	manager->init();

	QQmlApplicationEngine engine;

	initRegister(manager.get());

	// TMP
	QScopedPointer<fsd::Project> project(new fsd::Project);
	project->reset();
	auto* player = project->createCharacter();
	qmlRegisterSingletonInstance("project", 1, 0, "MyPlayer", player);

	// Translations
	//QObject::connect(manager->translationsManager(), &fse::TranslationsManager::currentUpdated, &engine, &QQmlApplicationEngine::retranslate);

	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed, &app,
		[]() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection);
	engine.loadFromModule("project", "Main");

	return app.exec();
}
