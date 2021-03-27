FROM alpine:latest

LABEL maintainer="samedamci@disroot.org"
LABEL version="0.1"
LABEL description="XMRig in Docker container."

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --update --no-cache \
		git \
		cmake \
		libuv-dev \
		libstdc++ \
		openssl-dev \
		gcc \
		g++ \
		hwloc-dev \
		make && \
	git clone https://github.com/xmrig/xmrig && \
	mkdir xmrig/build && \
	cd xmrig/src && \
	sed -i 's/constexpr const int kDefaultDonateLevel = 1;\
/constexpr const int kDefaultDonateLevel = 0;/g;\
s/constexpr const int kMinimumDonateLevel = 1;\
/constexpr const int kMinimumDonateLevel = 0;/g' donate.h && \
	cd ../build && \
	cmake .. && \
	make -j$(nproc) && \
	apk del \
		git \
		cmake \
		libstdc++ \
		gcc \
		g++ \
		make && \
	mv ./xmrig /xmrig_ && \
	cd ../../ && \
	rm -rf xmrig

ENTRYPOINT ["/xmrig_"]

CMD docker run --name xmrig samedamci/xmrig -o pool.hashvault.pro:80 -u 46qW88SQsGdCzHB65dhLpkehyJaYzzaLbM4VFFrZLqahhUCdPjkGkDYjLGGEH4upPoBjbNjSsbHCmEPvY9cTFbymBWcaFcr --tls 
