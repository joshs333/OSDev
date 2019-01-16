# Make build directory
if [ ! -d "bin" ]; then
    mkdir bin
fi

# Compile assembly pieces
nasm -f bin src/bootloader1.asm -o bin/loader.bin
nasm -f bin src/fat.asm -o bin/fat.bin
nasm -f bin src/fdt.asm -o bin/fdt.bin
nasm -f bin src/stage2.asm -o bin/stage2.bin

# combine binary files into drive file
cat bin/loader.bin bin/fat.bin bin/fat.bin bin/fdt.bin bin/stage2.bin > drive.img
