project( Fish )

cmake_minimum_required( VERSION 3.3 )

find_package( Qt5Core REQUIRED )
find_package( Qt5Widgets REQUIRED )

if( APPLE )
	set(APP_TARGET "Fish")
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

add_subdirectory(src)
