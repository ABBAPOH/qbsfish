project( Fish )

cmake_minimum_required( VERSION 2.8 )

find_package( Qt5Core CONFIG REQUIRED )
find_package( Qt5Widgets CONFIG REQUIRED )

set(CMAKE_AUTOMOC ON)
SET(CMAKE_AUTOUIC ON)
SET(CMAKE_INCLUDE_CURRENT_DIR ON)

if( APPLE )
    set(APP_TARGET "Fish")
    set( APP_APPLICATION_PATH  ${PROJECT_BINARY_DIR} )
    set( APP_BINARY_PATH       ${APP_APPLICATION_PATH}/Fish.app/Contents/MacOs )
    set( APP_LIBRARY_PATH      ${APP_APPLICATION_PATH}/Fish.app/Contents/Frameworks )

    set( INSTALL_PATH              ${CMAKE_INSTALL_PREFIX} )
    set( INSTALL_BINARY_PATH       ${INSTALL_PATH}/Fish.app/Contents/MacOs )
    set( INSTALL_LIBRARY_PATH      ${INSTALL_PATH}/Fish.app/Contents/Frameworks )

elseif( WIN32 )
	set(APP_TARGET "fish")
elseif( UNIX )
	set(APP_TARGET "fish")

	set( LIB_SUFFIX "")
    set( APP_APPLICATION_PATH  ${PROJECT_BINARY_DIR} )
    set( APP_BINARY_PATH       ${APP_APPLICATION_PATH}/bin )
    set( APP_LIBRARY_PATH      ${APP_APPLICATION_PATH}/lib${LIB_SUFFIX} )

    set( INSTALL_PATH              ${CMAKE_INSTALL_PREFIX} )
    set( INSTALL_BINARY_PATH       ${INSTALL_PATH}/bin )
    set( INSTALL_LIBRARY_PATH      ${INSTALL_PATH}/lib${LIB_SUFFIX}/fish )
endif()

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(${PROJECT_SOURCE_DIR}/src)

add_subdirectory(src)
