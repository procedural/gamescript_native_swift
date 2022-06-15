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

* Before running LLDB, you may want to change `-Ounchecked` to `-Onone` in `compile_game.sh` and `compile_thread2.sh` files. On Windows, change `-Ounchecked` to `-Onone -use-ld=lld -Xlinker -debug:dwarf` flags.
* If you get LLDB errors on application start after entering the `r` command, just continue execution with `c` commands.
* To debug a frame, enter `b frame` command first before entering the `r` command.
* Use `fr v` command to show variables for the current stack frame.
* You can also use LLDB version that is shipped with the `GameScriptNativeSwift.AppImage` like so:
```
./GameScriptNativeSwift.AppImage --appimage-extract
LD_LIBRARY_PATH=./squashfs-root/usr/lib/ ./squashfs-root/usr/bin/lldb -- ./squashfs-root/usr/bin/game_script_native --set-directory-path /opt/GameScriptNative/
```
* You may need to symlink the following files to `/usr/lib/swift/` folder:
```
sudo mkdir -p /usr/lib/swift/
sudo ln -s /usr/lib/x86_64-linux-gnu/libdl.so    /usr/lib/swift/
sudo ln -s /usr/lib/x86_64-linux-gnu/libutil.so  /usr/lib/swift/
sudo ln -s /lib/x86_64-linux-gnu/libpthread.so.0 /usr/lib/swift/libpthread.so
sudo ln -s /lib/x86_64-linux-gnu/libm.so.6       /usr/lib/swift/libm.so
```

## Other links:

* https://github.com/apple/swift/issues/58438
