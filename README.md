1.	Install arm-none-eabi-gcc
-	sudo apt update
-	sudo apt install gcc-arm-none-eabi
2.	File structure 
/baremetal
  ├── linker.ld        # Linker script
  ├── start.S          # Assembly startup code
  ├── main.c           # C code for your app
  ├── Makefile         # To build the binary
3.	Download bootcode.bin and start.elf from  https://github.com/raspberrypi/firmware/tree/master/boot config.txt (optional, can configure settings like UART, clock)
4.	Format SD and Select FAT (FAT32).
5.	Copy files kernel7.img, bootcode.bin and start.elf into SD card
