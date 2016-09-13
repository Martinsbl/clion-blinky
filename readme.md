# Simple example to get started with Nordic's SDKs in CLion
This is a simple example showing you how to setup and configure CLion and get started with Nordic's SDKs. It only shows how to do it in Windows and only the basic setps. 

# You'll need:
* [CLion](https://www.jetbrains.com/clion/).
* [TDM-GCC compiler](http://tdm-gcc.tdragon.net/).
* [SDK from Nordic](http://www.nordicsemi.com/eng/nordic/Products/nRF52-DK/nRF5-SDK-zip/54283). I used SDK V11.
* [GNU ARM Embedded Toolchain](https://launchpad.net/gcc-arm-embedded/+download).

# To get started:
1. Download and install CLion, the GNU Toolchain, and TDM-GCC.
2. Download and extract an SDK to a folder of your choice.
3. Clone this example to a folder of your choice. 
4. Open the project by clicking "Open Project" on the Welcome screen, then navigate to the folder where you cloned the project, and click "OK" (CLion has a buildt in version control system so you can even do this from whithin CLion). 
![WelcomeScreen](/images/WelcomeScreen.png?raw=true "Welcome Screen")
![SelectPath](/images/SelectPath.jpg?raw=true "Select Path")
5. Click "File->Settings->Build, Execution, Deployment->Toolchains" and configure CLion like this:
![Toolchain settings](/images/ToolchainSettings.jpg?raw=true "Toolchain Settings")
6. Then set the CMake settings like this:
![CMake settings](/images/CmakeSettings.jpg?raw=true "CMake Settings")
7. Inside CLion open CMakeLists.txt and change the line:
`set(SDK_ROOT_FOLDER "C:/Kode/Nordic/SDK_11")` 
so that it points to your SDK root folder.
8. Open linker_script.ld and change the line:
`INCLUDE "C:/Kode/Nordic/SDK_11/components/toolchain/gcc/nrf5x_common.ld"`
so that it points to your nrf5x_common.ld file.
9. Finally open toolchain.cmake and change the line:
`CMAKE_FORCE_C_COMPILER("C:/Program Files (x86)/GNU Tools ARM Embedded/5.4 2016q2/bin/arm-none-eabi-gcc.exe" GNU)`
so that it points to where you have installed your GNU toolchain.
10. CMake is caching some of your settings and file which can be frustrating source of bugs and errors. The toolchain.cmake file is one of the files that gets cached. So after you have made changes to this file you will need to delete this cache before the changes will take place. You can do this by clicking "Tools->CMake->Show Generated CMake Files in Explorer" and then delete the folder CLion shows you. After that click "Tools->CMake->Reset Cache and Reload Project".
![Reload project](/images/DeleteCache.png?raw=true "Reload project")


PS:
If you are unlucky like me you will stumble into a bug in CLion. The bug makes it so that the #include files are not recognized in CLion unless you inlcude a complete relative path to the header file. The project will compile even though you don't, but CLion will not index your project correctly and display helpful auto-complete features.
![Bug](/images/Bug.png?raw=true "Bug")

The bug is reported to JetBrains and discussed [here](https://youtrack.jetbrains.com/issue/CPP-3962).