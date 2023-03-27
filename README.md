# arm-image-installer containerfied

## Background
`arm-image-installer` is a tool by the Fedora community to install and
manipulate ARM images for use on physical devices like Raspberry Pi and RPi
clones.

## Why this project?
I wanted it containerized. I primarily work off of OSTree-based OSes and having
the tooling in a container helps keep the non-system applications separate from
the system utilities.

## Example Usage
```
# podman build -t arm-image-installer .
# IMAGE=Fedora-IoT-37.aarch64.raw.xz
# TARGET=rock64-rk3328
# DEV=/dev/sda
# DEV_MAJ=`ls -l $DEV | cut -f5 -d' ' | sed -e "s/[^0-9]//g"`
# podman run -it -v ~/Downloads/:/tmp/:Z --device $DEV --device-cgroup-rule "b $DEV_MAJ:* rwm" --privileged arm-image-installer --image /tmp/Fedora-IoT-37-20221118.0.aarch64.raw.xz --target=rock64-rk3328 --media=$DEV --selinux=OFF --resizefs
```

## License
MIT
