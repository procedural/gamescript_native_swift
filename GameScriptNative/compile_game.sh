if true; then

rm -f /opt/GameScriptNative/libgame.so
mv /opt/GameScriptNative/game.cpp /opt/GameScriptNative/game.swift
cd /opt/GameScriptNative/
swiftc -g -Ounchecked /opt/GameScriptNative/libgamescriptnative.swift /opt/GameScriptNative/game.swift -emit-library -module-name game

else

rm -f /opt/GameScriptNative/libgame.so
c++ -g -O2 -w -std=c++14 -shared -fPIC -include /opt/GameScriptNative/libgamescriptnative.cpp /opt/GameScriptNative/game.cpp -o /opt/GameScriptNative/libgame.so

fi

