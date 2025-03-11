sudo apt install distrobox podman


distrobox create -a "--platform=linux/arm64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25-arm64


distrobox create -a "--platform=linux/arm64" -i debian -n debian-arm64





Evtl, nur für arm
`sudo apt install qemu-system qemu-user-static binfmt-support`

Distroboxen auflisten:
`distrobox list`



## x86_64
`distrobox create --image debian:bullseye --name raspbian-like`
`distrobox enter raspbian-like`

## arm aarch64
`distrobox create --image docker.io/bitnami/minideb:latest --name minideb-arm64 --additional-flags "--platform=linux/arm64"`
 distrobox enter minideb-arm64


//// `distrobox create -a "--platform=linux/arm64" -i debian:bullseye -n debian-arm64`
`distrobox enter debian-arm64` ( erster Start geht sehr lang )


### 2. Variante
`distrobox create -a "--platform=linux/arm64" -i debian:buster -n debian-arm64-buster`
`distrobox enter debian-arm64-buster`


### Prozesse auflisten
`podman logs -f debian-arm64`



sudo apt install libadwaita-1-dev 

