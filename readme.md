# Basic Bootloader
This is my attempt at following the [Operating System Development Guide](http://www.brokenthorn.com/Resources/OSDev6.html).
The challenge for me is doing this development on MacOS as opposed to Linux or Windows. This guide uses Windows with command prompt, bosch and other windows based tools such as the floppy drive emulator, I will use similar tools but on MacOS.

## Dependencies
This uses nasm and qemu. I installed them using homebrew.
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install nasm
brew install qemu
```
You don't need homebrew to install these, but homebrew rocks so I highly recommend it. If you don't use or want homebrew then google how to install it without homebrew.

## Compile
I made a compile script that turns the assembly files into binary then combines them into a binary image.
To run this use the following commands.
```
chmod +x make_image.sh
./make_img.sh
```
This will place the binary outputs of nasm into the bin/ folder. All of these will be combined into a single binary image combined_disk.img which will also be in the bin folder.
This script will also convert this raw binary image into a qcow2 image called floppy_img.qcow2 which can be loaded without error by qemu.

## Run in Qemu
```
qemu-system-x86_64 -fda floppy_img.qcow2
```
The reason we make the raw binary image into a qcow2 image is that while qemu will run the raw image it will give a warning and prevent write access to block 0. While this may or may not be an issue depending on where we are and what exactly we are doing... It's good to clear the error early on and it puts my soul at ease to remove the warning.
