@echo off

goto swift

:swift

del C:\GameScriptNative\thread2.dll
move C:\GameScriptNative\thread2.cpp C:\GameScriptNative\thread2.swift
cd C:\GameScriptNative\
swiftc -g -Ounchecked C:\GameScriptNative\libgamescriptnative.swift C:\GameScriptNative\thread2.swift -lC:\GameScriptNative\gamescript.dll -emit-library -module-name thread2
goto end

:cpp

del C:\GameScriptNative\thread2.dll
cl /EHsc /O2 /w /LD /FI C:/GameScriptNative/libgamescriptnative.cpp C:/GameScriptNative/thread2.cpp /link C:/GameScriptNative/gamescript.dll.lib /dll /out:C:/GameScriptNative/thread2.dll
goto end

:end

