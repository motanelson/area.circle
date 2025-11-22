rm *.o
rm *.elf
rm *.img
arm-linux-gnueabi-as -c -o boot.o boot.S
arm-linux-gnueabi-gcc -c -nostdlib -o kernel.o kernel.c -lgcc
arm-linux-gnueabi-ld -T link.ld boot.o kernel.o -o kernel.elf -nostdlib
arm-linux-gnueabi-objcopy kernel.elf -O binary kernel.img
qemu-system-arm -m 1g -M raspi2b -serial stdio -kernel kernel.elf