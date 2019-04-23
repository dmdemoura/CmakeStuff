function(add_rom target)
    message(${target}: ${ARGN})
    add_executable(${target}.elf EXCLUDE_FROM_ALL ${ARGN})
    set_target_properties(${target}.elf PROPERTIES COMPILE_OPTIONS -specs=gba.specs)
    set_target_properties(${target}.elf PROPERTIES LINK_FLAGS -specs=gba.specs)

    add_custom_command(
        OUTPUT ${target}.bin
        MAIN_DEPENDENCY ${target}.elf
        COMMENT "Striping Binary"
        COMMAND ${CMAKE_OBJCOPY} -O binary ${target}.elf ${target}.bin
    )
    add_custom_command(
        OUTPUT ${target}.gba
        MAIN_DEPENDENCY ${target}.bin
        COMMENT "Fixing ROM"
        COMMAND cp ${target}.bin ${target}.gba && gbafix ${target}.gba
    )
endfunction()