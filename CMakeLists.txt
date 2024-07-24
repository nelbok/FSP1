cmake_minimum_required(VERSION 3.27)

include(FSEditor3D/cmake/defines.cmake)
include(cmake/defines.cmake)

project(${CFSP1} VERSION ${FSP1_VERSION} LANGUAGES CXX)

include(FSEditor3D/cmake/common.cmake)

find_package(QT NAMES Qt6 REQUIRED COMPONENTS Quick Quick3D Quick3DPhysics)
find_package(Qt6 REQUIRED COMPONENTS Quick Quick3D Quick3DPhysics)

add_subdirectory(FSEditor3D/data)
add_subdirectory(project)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${CFSP1})