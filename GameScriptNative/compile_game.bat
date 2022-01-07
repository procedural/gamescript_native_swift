@echo off

goto swift

:swift

del C:\GameScriptNative\game.dll
move C:\GameScriptNative\game.cpp C:\GameScriptNative\game.swift
cd C:\GameScriptNative\
swiftc -g -Ounchecked C:\GameScriptNative\libgamescriptnative.swift C:\GameScriptNative\game.swift -lC:\GameScriptNative\gamescript.dll -emit-library -module-name game
goto end

:cpp

del C:\GameScriptNative\game.dll
cl /EHsc /O2 /w /LD /FI C:/GameScriptNative/libgamescriptnative.cpp C:/GameScriptNative/game.cpp /link C:/GameScriptNative/gamescript.dll.lib /dll /out:C:/GameScriptNative/game.dll
goto end

:end

