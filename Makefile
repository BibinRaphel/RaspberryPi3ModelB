CFLAGS = -O2 -nostdlib -nostartfiles -ffreestanding -march=armv8-a

all: kernel7.img

kernel7.img: start.o main.o
	arm-none-eabi-ld -T linker.ld -o kernel7.elf start.o main.o
	arm-none-eabi-objcopy kernel7.elf -O binary kernel7.img

start.o: start.S
	arm-none-eabi-gcc $(CFLAGS) -c start.S -o start.o

main.o: main.c
	arm-none-eabi-gcc $(CFLAGS) -c main.c -o main.o

clean:
	rm -f *.o *.elf *.img
