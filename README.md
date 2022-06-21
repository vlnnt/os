# COMPILE "OS"

    i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o
    nasm kernel.s -f elf -o kernel.o
    i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel.o kernel.o --oformat binary
    nasm boot.s -f bin -o boot.bin
    cat boot.bin kernel.bin > os.bin
    qemu-system-x86_64 -fda os.bin
    
 # USEFUL MATERIALS THAT I USED
 
    https://github.com/cfenollosa/os-tutorial
    https://github.com/nativeos/i386-elf-toolchain/releases
    https://github.com/joeangel/linux-0.0.1
    https://wiki.osdev.org/Main_Page
    https://www.hexadecimaldictionary.com/
    https://www.ctyme.com/intr/int.htm
    https://stanislavs.org/helppc/idx_assembler.html
    https://www.ibm.com/docs/en/zos/2.1.0?topic=reference-assembler-instruction-statements
    https://blog.csdn.net/litao31415/article/details/48048881
    https://www.opennet.ru/docs/RUS/nasm/contents.html
