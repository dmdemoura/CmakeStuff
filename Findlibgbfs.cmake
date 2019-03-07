find_path(LIGBGBFS_INCLUDE_DIR tonc.h)
find_library(LIBGBFS_LIBRARY NAMES libtonc.a)

if (LIBGBFS_INCLUDE_DIR AND LIBGBFS_LIBRARY)
    add_library(libgbfs INTERFACE)
    target_include_directories(libgbfs INTERFACE ${TONC_INCLUDE_DIR})
    target_link_libraries(libgbfs INTERFACE ${TONC_LIBRARY})
else()
    message("Couldn't find libgbfs, downloading from GitHub")
    execute_process(COMMAND git submodule update --init -- external/libgbfs
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
    
    add_subdirectory(external/libgbfs)
endif()