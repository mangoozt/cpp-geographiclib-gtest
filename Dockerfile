FROM ubuntu:21.04

RUN /bin/sh -c echo "deb http://old-releases.ubuntu.com/ubuntu zesty main" | tee /etc/apt/sources.list.d/zesty.list  \
&& rm -rf /etc/sources.d/universe*  \
&& apt-get update  \
&& apt-get install  --no-install-recommends -y build-essential gcc-6 g++-6 wget ca-certificates libboost-dev  \
&& update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100  \
&& update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 100  \
&& update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-6 100 \
&& /bin/sh -c wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null  \
&& echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null  \
&& apt-get update  \
&& apt-get install  --no-install-recommends -y cmake libgtest-dev libgeographic

ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++
