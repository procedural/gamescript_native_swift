# Game Script Native Swift

## Tested with:

* [Game Script Native from Jan 2, 2022](https://procedural.itch.io/gamescriptnative)
* [Swift 5.5.2 on Ubuntu 16.04 (64-bit)](https://download.swift.org/swift-5.5.2-release/ubuntu1604/swift-5.5.2-RELEASE/swift-5.5.2-RELEASE-ubuntu16.04.tar.gz)
* [Swift 5.5.2 on Windows 7 (64-bit)](https://download.swift.org/swift-5.5.2-release/windows10/swift-5.5.2-RELEASE/swift-5.5.2-RELEASE-windows10.exe)
* [Python 3.7.9 on Windows 7 (64-bit)](https://www.python.org/ftp/python/3.7.9/python-3.7.9-amd64.exe)

## Install:

* Copy all the files from the `GameScriptNative` folder to `/opt/GameScriptNative` folder on Ubuntu 16.04 and higher and `C:/GameScriptNative` folder on Windows 7 and higher.
* On Windows, you may need to [copy the following Swift libraries](https://forums.swift.org/t/compiling-a-simple-hello-swift-on-windows/40534/4).
* On Windows, to make LLDB work, you may need to install Python 3.7.9 and add `C:\Users\<YOUR_USERNAME>\AppData\Local\Programs\Python\Python37` path to system PATH environment variable, with `<YOUR_USERNAME>` replaced with your Windows username.

## Examples to try:

* https://github.com/procedural/gamescript_raytracing/blob/master/raytracing_gsns.js

## Porting C++ code from Game Script Native to Game Script Native Swift:

Replace `frame`
```cpp
cfn frame() {}
```
with
```swift
@_cdecl("frame") public func frame() {}
```

---

Replace functions
```cpp
fn add(Number x, Number y) {}
```
with
```swift
func add(_ x: Number, _ y: Number) -> Number {}
```

---

Replace loops
```cpp
for (var i = 0; i < count; i += 1) {}
```
with
```swift
for i in stride(from: 0, to: count, by: 1) {}
```

---

Replace block scopes
```cpp
{
}
```
with
```swift
do {
}
```

---

Replace array accesses
```cpp
array[i]
```
with
```swift
array[Int(i)]
```

## LLDB tips:

* If you get LLDB errors on application start after entering the `r` command, just continue execution with `c` commands.
* To debug a frame, enter `b frame` command first before entering the `r` command.
* You can also use LLDB version that is shipped with the `GameScriptNativeSwift.AppImage` like so:
```
./GameScriptNativeSwift.AppImage --appimage-extract
LD_LIBRARY_PATH=./squashfs-root/usr/lib/ ./squashfs-root/usr/bin/lldb -- ./squashfs-root/usr/bin/game_script_native --set-directory-path /opt/GameScriptNative/
```
