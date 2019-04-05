docker-openwrt-sdk
========================
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/hnw/docker-openwrt-sdk/blob/master/LICENSE)

This is a docker container for the [OpenWRT](https://openwrt.org/) / [LEDE](https://www.lede-project.org/) SDK.
This is a docker container for the [OpenWRT](https://openwrt.org/) SDK.

If a docker image is not already available for the target system, change the Dockerfile 'Dockerfile.18.06.2-lantiq-xrx200' in ./Make_docker_images to point to the SDK of the target system. Make sure to rename the Dockerfile.

Build the docker container with
(example for version 18.06.2 and target system lantiq-xrx200)
```sh
$ ./build.sh Dockerfile.18.06.2-lantiq-xrx200 18.06.2-lantiq-xrx200
```
Go back to the parent container and change the docker-compose.yml to point to the image just built.
Start the docker container with
```sh
$ docker-compose up -d
```
To look for the container id and then run a shell as `openwrt` user in the SDK container, execute the following command:
```sh
$ docker container ls
$ docker exec -it -u openwrt -w /home/openwrt/sdk [docker_container-id] /bin/bash
```
Own packages can be copied into the sub folder './mypackages'.
They will be available in the Docker container under /home/openwrt/mypackages and will be available after running the feeds update below.

Then build packages as follows:

```sh
$ ./scripts/feeds update -a
$ ./scripts/feeds install php7
$ make -j$(nproc * 1.5) package/php7/compile V=s
$ ls -la bin/packages/mips_24kc/packages/php7-cli*
-rw-r--r-- 1 openwrt openwrt 1457137 Sep 19 06:30 bin/packages/mips_24kc/packages/php7-cli_7.1.1-1_mips_24kc.ipk
```

Built packages will be available in the folder /home/openwrt/sdk/bin and in the host system in the ./packages_built subfolder.

More information on how to use the SDK tool-chain can be found on the
[OpenWRT wiki](http://wiki.openwrt.org/doc/howto/build).

## See also

- [Using the SDK](https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk) OpenWrt Wiki
