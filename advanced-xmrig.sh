#!/bin/bash
startdir=$(pwd)
sudo apt-get install git build-essential cmake automake libtool autoconf -y
[ -d xmrig ] && rm -rf xmrig > /dev/null 2>&1
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build && cd xmrig/scripts
./build_deps.sh && cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)
cd "$startdir"
echo "Done! XMRig is in ./xmrig, XMRig executable is in ./xmrig/build/xmrig"
