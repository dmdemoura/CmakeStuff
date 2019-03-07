find_path(ADVENCORE_INCLUDE_DIR advenCore/VBAPrint.hpp)
find_library(ADVENCORE_LIBRARY NAMES advencore.a)

if (ADVENCORE_INCLUDE_DIR AND ADVENCORE_LIBRARY)
    add_library(advencore INTERFACE)
    target_include_directories(advencore INTERFACE ${ADVENCORE_INCLUDE_DIR})
    target_link_libraries(advencore INTERFACE ${ADVENCORE_LIBRARY})
else()
    message("Couldn't find advencore, downloading from GitHub")
    execute_process(COMMAND git submodule update --init -- external/AdvenCore
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
    
    add_subdirectory(external/AdvenCore)
endif()