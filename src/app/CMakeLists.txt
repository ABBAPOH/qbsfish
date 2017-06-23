set(HEADERS
    mainwindow.h
)
set(SOURCES
    mainwindow.cpp
    main.cpp
)
set(FORMS
    mainwindow.ui
)
qt5_wrap_ui(FORMS_SRC ${FORMS})
add_executable(${APP_TARGET} ${HEADERS} ${SOURCES} ${FORMS_SRC})
target_link_libraries(${APP_TARGET} ${QT_LIBRARIES} Lib)

qt5_use_modules(${APP_TARGET} Core Widgets)

install(TARGETS ${APP_TARGET}
    LIBRARY DESTINATION ${INSTALL_LIBRARY_PATH}
    RUNTIME DESTINATION ${INSTALL_LIBRARY_PATH}
)
