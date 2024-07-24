qt_standard_project_setup(REQUIRES 6.5)

set(PROJECT_SOURCES
	src/tools/About.cpp
	src/tools/About.hpp

	src/Config.hpp.in
	src/main.cpp
	src/Manager.cpp
	src/Manager.hpp

	resources/resource.h
	resources/logo.ico
	resources/resources.rc.in
	resources/resources.qrc
)
set(QML_SOURCES
	qml/charmaker/CMMain.qml
	qml/charmaker/CMView.qml
	qml/common/CButton.qml
	qml/common/CCharacterAction.qml
	qml/common/CCheckButton.qml
	qml/common/CModel.qml
	qml/common/CSlider.qml
	qml/common/CTab.qml
	qml/common/CTextInput.qml
	qml/Main.qml
)
set(QML_SINGLETON
	qml/common/CStyle.qml
)
set_source_files_properties(${QML_SINGLETON} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

configure_file(resources/resources.rc.in resources/resources.rc)
configure_file(resources/resource.h resources/resource.h COPYONLY)
configure_file(resources/logo.ico resources/logo.ico COPYONLY)

set(OTHER_FILES
	${CMAKE_CURRENT_BINARY_DIR}/resources/resources.rc
)

qt_add_executable(${CFSP1} ${PROJECT_SOURCES} ${OTHER_FILES})
qt_add_qml_module(${CFSP1} URI project VERSION 1.0 QML_FILES ${QML_SOURCES} ${QML_SINGLETON})

source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}" PREFIX "" FILES ${PROJECT_SOURCES} ${QML_SOURCES})
include_directories(src)

configure_file(src/Config.hpp.in include/Config.hpp)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${CFSP1} PROPERTIES
	MACOSX_BUNDLE_GUI_IDENTIFIER com.${FS_ORGANIZATION}.${CFSP1}
	MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
	MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
	MACOSX_BUNDLE TRUE
	WIN32_EXECUTABLE TRUE
)

target_link_libraries(${CFSP1} PRIVATE Qt6::Quick Qt6::Quick3D Qt6::Quick3DPhysics ${CFS_DATA})

include(GNUInstallDirs)
install(TARGETS ${CFSP1}
	BUNDLE DESTINATION .
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
if(WIN32)
	# Win deploy qt
	get_target_property(DEPLOYQT Qt6::windeployqt IMPORTED_LOCATION)

	# Deploy editor
	add_custom_command(TARGET ${CFSP1} POST_BUILD COMMAND ${DEPLOYQT} --qmldir "${CMAKE_CURRENT_SOURCE_DIR}/qml" "$<TARGET_FILE:${CFSP1}>")
endif()
