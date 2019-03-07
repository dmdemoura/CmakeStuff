find_path(ADVEN_INCLUDE_DIR adven/GameObject.hpp)
find_library(ADVEN_LIBRARY NAMES libadven.a)

if (ADVEN_INCLUDE_DIR AND ADVEN_LIBRARY)
    add_library(adven INTERFACE)
    target_include_directories(adven INTERFACE ${ADVEN_INCLUDE_DIR})
    target_link_libraries(adven INTERFACE ${ADVEN_LIBRARY})
else()
    message("Couldn't find advencore, downloading from GitHub")

    if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/external/Adven/.git)
        execute_process(COMMAND git submodule update --init -- external/Adven
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
    endif()
    
    add_subdirectory(external/Adven)
endif()