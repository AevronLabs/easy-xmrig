#!/bin/bash
startdir=$(pwd)
sudo apt-get install git build-essential cmake automake libtool autoconf -y
[ -d xmrig ] && rm -rf xmrig > /dev/null 2>&1
if [ "$USE_DEFAULT" = "1" ]; then
    git clone https://github.com/xmrig/xmrig.git
else
    git clone https://github.com/AevronLabs/xmrig.git
fi
mkdir xmrig/build && cd xmrig/scripts
./build_deps.sh && cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps 
make -j$(nproc) -k
cd "$startdir"
echo "Done! XMRig is in ./xmrig, XMRig executable is in ./xmrig/build/xmrig"
