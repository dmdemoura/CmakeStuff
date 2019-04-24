function(add_rom target)

    add_executable(${target}.elf EXCLUDE_FROM_ALL ${ARGN})

    add_custom_target(
        ${target}.bin
        COMMENT "Building ${target}.bin"
        COMMAND ${CMAKE_OBJCOPY} -O binary ${target}.elf ${target}.bin
    )
    add_custom_target(
        ${target}.gba
        COMMENT "Building ${target}.gba"
        COMMAND cp ${target}.bin ${target}.gba && gbafix ${target}.gba
    )

    add_dependencies(${target}.bin ${target}.elf)
    add_dependencies(${target}.gba ${target}.bin)

endfunction()

function(add_gbfs_rom target)

    add_rom(${target} ${ARGN})

    add_custom_target
    (
        ${target}.gbfs
        COMMENT "Building ${target}.gbfs"
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/makeData.py ${CMAKE_CURRENT_BINARY_DIR}/${target}.gbfs ${CMAKE_CURRENT_SOURCE_DIR}/data ${CMAKE_CURRENT_SOURCE_DIR}/buildData
    )
    add_custom_target
    (
        ${target}.gbfs.gba
        ALL
        COMMENT "Building ${target}.gbfs.gba"
        COMMAND padbin 256 ${target}.gba && cat ${target}.gba ${target}.gbfs > ${target}.gbfs.gba
    )

    add_dependencies(${target}.gbfs.gba ${target}.gba ${target}.gbfs)

endfunction()



