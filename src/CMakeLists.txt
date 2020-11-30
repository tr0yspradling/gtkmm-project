set(GENERATED_FILES_DIR ${PROJECT_BINARY_DIR}/generated)

set(GENERATED_DATA_DIR ${GENERATED_FILES_DIR}/data)
FILE(GLOB SOURCES *.cpp)

add_executable(
   ${PROJECT_NAME}
   ${SOURCES}
   ${GENERATED_DATA_DIR}/resources.c
)

target_link_libraries(
   ${PROJECT_NAME}
   GTKMM
)

target_include_directories(${PROJECT_NAME} PRIVATE ${GENERATED_SOURCES_DIR})

compile_resources(
   ${GENERATED_DATA_DIR}/resources.c
   ${GENERATED_DATA_DIR/ui}
)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
