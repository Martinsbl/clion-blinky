# Simple example to get started with Nordic's SDKs in CLion
This is a simple example showing you how to setup and configure CLion and get started with Nordic's SDKs. It only shows how to do it in Windows and only the basic setps. 

# You'll need:
* [CLion](https://www.jetbrains.com/clion/).
* [TDM-GCC compiler](http://tdm-gcc.tdragon.net/).
* [SDK from Nordic](http://www.nordicsemi.com/eng/nordic/Products/nRF52-DK/nRF5-SDK-zip/54283). I used SDK V11.

# To get started:
1. Download and install CLion and TDM-GCC.
2. Download and extract an SDK to a folder of your choice.
3. Clone this example to a folder of your choice. CLion has a buildt in version control system so you can even do this from within CLion. 
4. Open the project by clicking "Open Project" on the Welcome screen, then navigate to the folder where you cloned the project, and click "OK". 
![WelcomeScreen](/images/WelcomeScreen.png?raw=true "Welcome Screen")
![SelectPath](/images/SelectPath.jpg?raw=true "Select Path")
5. Click File->Settings->Build, Execution, Deployment->Toolchains and configure CLion like this:
![Toolchain settings](/images/ToolchainSettings.jpg?raw=true "Toolchain Settings")
6. Then set the CMake settings like this:
![CMake settings](/images/CmakeSettings.jpg?raw=true "CMake Settings")