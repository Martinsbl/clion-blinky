INCLUDE(CMakeForceCompiler)
SET(CMAKE_SYSTEM_NAME Generic)
CMAKE_FORCE_C_COMPILER("C:/Program Files (x86)/GNU Tools ARM Embedded/4.9 2015q3/bin/arm-none-eabi-gcc.exe" GNU)
#add_compile_options(-Wno-deprecated-declarations)


SET(CMAKE_C_FLAGS "-std=gnu99 -mcpu=cortex-m0 -mthumb -mabi=aapcs -g3 -mfloat-abi=soft -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin --short-enums")
SET(CMAKE_ASM_FLAGS "-x assembler-with-cpp")

SET(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/linker_script.ld)
SET(TEMPLATE_PATH "../../../components/toolchain/gcc/Makefile.windows")
SET(CMAKE_EXE_LINKER_FLAGS "-Xlinker -Map=${LISTING_DIRECTORY}/${OUTPUT_FILENAME}.map -mthumb -mabi=aapcs -L ${TEMPLATE_PATH} -T${LINKER_SCRIPT} -mcpu=cortex-m0 -Wl,--gc-sections  --specs=nano.specs -lc -lnosys")

