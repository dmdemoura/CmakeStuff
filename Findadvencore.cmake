find_path(ADVENCORE_INCLUDE_DIR tonc.h)
find_library(ADVENCORE_LIBRARY NAMES libtonc.a)

if (ADVENCORE_INCLUDE_DIR AND ADVENCORE_LIBRARY)
    add_library(advencore INTERFACE)
    target_include_directories(advencore INTERFACE ${TONC_INCLUDE_DIR})
    target_link_libraries(advencore INTERFACE ${TONC_LIBRARY})
else()
    message("Couldn't find advencore, downloading from GitHub")
    execute_process(COMMAND git submodule update --init -- external/AdvenCore
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
    
    add_subdirectory(external/AdvenCore)
endif()