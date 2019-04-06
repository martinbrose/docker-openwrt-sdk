docker-openwrt-sdk
========================
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/redorbluepill/docker-openwrt-sdk/blob/master/LICENSE)

This is for building Docker Images for the [OpenWRT](https://openwrt.org/) SDK.

If a Docker Image is not already available for the target system, change the Dockerfile 'Dockerfile.18.06.2-lantiq-xrx200' to point to the SDK of the target system and rename the Dockerfile.

Various OpenWrt SDKs are available [here](https://downloads.openwrt.org/releases/).

Build the Docker Image with
(example for version 18.06.2 and target system lantiq-xrx200)
```sh
$ ./build.sh Dockerfile.18.06.2-lantiq-xrx200 18.06.2-lantiq-xrx200
```
