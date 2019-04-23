set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(devkitarm $ENV{DEVKITARM})
set(prefix ${devkitarm}/bin/arm-none-eabi-)

set(CMAKE_C_COMPILER ${prefix}gcc)
set(CMAKE_CXX_COMPILER ${prefix}g++)
set(CMAKE_ASM_COMPILER ${prefix}gcc)
set(CMAKE_OBJCOPY ${prefix}objcopy)

set(ASM_OPTIONS "-x assembler-with-cpp")
set(CMAKE_ASM_FLAGS "${CFLAGS} ${ASM_OPTIONS}")
set(CMAKE_CXX_FLAGS "-mcpu=arm7tdmi -mtune=arm7tdmi -fomit-frame-pointer -ffast-math -mthumb -mthumb-interwork -specs=gba.specs")