set(HEADERS
)
set(SOURCES
    main.cpp
)

add_executable(${APP_TARGET} ${HEADERS} ${SOURCES})
target_link_libraries(${APP_TARGET} ${QT_LIBRARIES} Lib)

qt5_use_modules(${APP_TARGET} Core Widgets)

install(TARGETS ${APP_TARGET}
    LIBRARY DESTINATION ${INSTALL_LIBRARY_PATH}
    RUNTIME DESTINATION ${INSTALL_LIBRARY_PATH}
)
