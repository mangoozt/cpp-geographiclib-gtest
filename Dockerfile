FROM gcc:6.3
RUN apt-get update  \
&& apt-get install  --no-install-recommends -y cmake libgtest-dev libgeographic \
&& rm -rf /var/lib/apt/lists/*

ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++
