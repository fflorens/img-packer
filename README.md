# Scaleway ubuntu image builder

Build a SCW ubuntu image with packer from ubuntu cloudimg using packer.

The instance is booted in _rescue mode_, then we get the rootfs from the official ubuntu cloudimg and configure it for scaleway.

Currently support building Ubuntu Bionic and Xenial images for start1-{XS,S,M,L} instances.
The skel is build using the overlay from image-tools and image-ubuntu and ommiting the docker one.

## Variables

You can set environnement variable to change the build output.
`UBUNTU_FLAVOR=` can be `xenial` or `bionic`, defaults to `bionic`.
`VARIANT=` can be `classic` or `mini`, defaults to `classic`, `mini` is to build a 25GB volume for start1-XS.
`SCW_REGION=` can be `par1` or `ams1`, defaults to `par1`, to change the region where you are building the image.

## Usage

```
# fill your crendentials
cp packer/secrets.example.json packer/secrets.json
vim packer/secrets.json
# or if you have the latest scw cli
scw login -c packer/secrets.json
# to build ubuntu xenial mini (for start1-xs)
UBUNTU_FLAVOR=xenial VARIANT=mini make
```
