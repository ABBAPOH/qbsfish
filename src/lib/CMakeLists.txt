set(HEADERS
    class.h
)
set(SOURCES
    class.cpp
)

add_library(Lib SHARED ${HEADERS} ${SOURCES})
target_link_libraries(Lib ${QT_LIBRARIES})

install(TARGETS Lib
    LIBRARY DESTINATION ${INSTALL_LIBRARY_PATH}
    RUNTIME DESTINATION ${INSTALL_LIBRARY_PATH}
)
