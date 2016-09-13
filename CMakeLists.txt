## Header
cmake_minimum_required(VERSION 3.6)
project(blinky C ASM)
## Define absolute path to your SDK root folder
set(SDK_ROOT_FOLDER "C:/Kode/Nordic/SDK_11")

## File includes
add_definitions(-DNRF51
    -DBOARD_PCA10028
    -DSWI_DISABLE0)

## Include all directories
include_directories(
        ${SDK_ROOT_FOLDER}/components/toolchain/CMSIS/Include
        ${SDK_ROOT_FOLDER}/components/toolchain/gcc
        ${SDK_ROOT_FOLDER}/components/toolchain/
        ${SDK_ROOT_FOLDER}/components/device
        ${SDK_ROOT_FOLDER}/components/drivers_nrf/delay
        ${SDK_ROOT_FOLDER}/components/drivers_nrf/hal
        ${SDK_ROOT_FOLDER}/examples/bsp)


## Include all source files
set(SOURCE_FILES main.c
        ${SDK_ROOT_FOLDER}/components/drivers_nrf/delay/nrf_delay.c
        ${SDK_ROOT_FOLDER}/components/toolchain/gcc/gcc_startup_nrf51.s
        ${SDK_ROOT_FOLDER}/components/toolchain/system_nrf51.c)


add_executable(${PROJECT_NAME}.elf ${SOURCE_FILES})


## Set additional project-specific flags for compilers like e.g.:
# '-O0' for Optimization level 0.
# '-Werror' to tread all warnings as errors.
# '-lc -lrdimon -u _printf_float' for printf with floating points.
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -lc -lrdimon -u _printf_float") # <- Add extra project-specific flags for C compiler.
SET(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}") # <- Add extra project-specific flags for ASM compiler.

## Create .hex and .bin files after linking project
set(HEX_FILE ${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.hex)
set(BIN_FILE ${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.bin)
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${HEX_FILE}
        COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}.elf> ${BIN_FILE}
        COMMENT "Building ${HEX_FILE} \nBuilding ${BIN_FILE}"
        )


### Program application onto nRF5
#add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
#        COMMAND nrfjprog -e # Erase application region in flash.
#        COMMAND nrfjprog --program ${HEX_FILE} -r # Program application and reset.
#        COMMENT "Programming...\n"
#        )
