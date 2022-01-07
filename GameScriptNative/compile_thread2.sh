if true; then

rm -f /opt/GameScriptNative/libthread2.so
mv /opt/GameScriptNative/thread2.cpp /opt/GameScriptNative/thread2.swift
cd /opt/GameScriptNative/
swiftc -g -Ounchecked /opt/GameScriptNative/libgamescriptnative.swift /opt/GameScriptNative/thread2.swift -emit-library -module-name thread2

else

rm -f /opt/GameScriptNative/libthread2.so
c++ -g -O2 -w -std=c++14 -shared -fPIC -include /opt/GameScriptNative/libgamescriptnative.cpp /opt/GameScriptNative/thread2.cpp -o /opt/GameScriptNative/libthread2.so

fi

