# XMRig Docker

Docker image for [XMRig](https://github.com/xmrig/xmrig) cryptocurrency miner - donate-less version.

# Installation
+ Download image from [GitHub Packages](https://github.com/samedamci/xmrig-docker/packages).

or

+ Clone repo.
```
$ git clone https://git.samedamci.com/samedamci/xmrig-docker && cd xmrig-docker
```
+ Build image itself.
```
# docker build -t samedamci/xmrig .
```

# Usage
You can pass any XMRig arguments via command line.

For example:
```
# docker run --name xmrig samedamci/xmrig -o MINING_POOL_ADDRESS -u WALLET_ADDRESS --tls --rig-id RIG_ID
```
