# ProjectOverflow
https://openradar.appspot.com/radar?id=5017827253682176
http://www.openradar.me/23472326



When Swift project is big enough, the build system generates a swiftc command that does not fit the command line length on the host system, failing to build the project. clang supports @file format to read the inputs, ld has -filelist flag to pass the list of files to link into the binary, but swiftc apparently does not support neither of these flags. Thus, it is not possible to build large swift modules.

Steps to Reproduce:
1. Checkout https://github.com/CognitiveDisson/ProjectOverflow
2. Run `bash generate_folder.sh`
3. Open ProjectOverflow.xcodeproj in Xcode and press Build
4. Observe error: 
Build operation failed without specifying any errors. Individual build tasks may have failed for unknown reasons.
One possible cause is if there are too many (possibly zombie) processes; in this case, rebooting may fix the problem.
Some individual build task failures (up to 12) may be listed below.
5. Switch the project settings to use the new build system.
6. Hit Build again. Now build will fail with the following error message: Unable to spawn the process. In the build log you will see the command that Xcode attempted to execute:
/Applications/Xcode.app/.../usr/bin/swiftc    /path/to/ProjectOverflow/test/1/2/3/3abcdefghijklmnopqrstuvwxyz384.swift /path/to/ProjectOverflow/ProjectOverflow/test/1/1abcdefghijklmnopqrstuvwxyz919.swift //path/to/ProjectOverflow/ProjectOverflow/test/1/1abcdefghijklmnopqrstuvwxyz386.swift
....


Actual Results:
Buils fails and build logs (when new build system is enabled) shows that command line is too lengthy. Copy-pasting the command from Xcode build log into some bash script and attempting to execute it will print: "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc: Argument list too long"
