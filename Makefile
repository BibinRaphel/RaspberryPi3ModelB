CFLAGS = -O2 -nostdlib -nostartfiles -ffreestanding -march=armv8-a
BUILD_DIR = .build
OUT_DIR = $(BUILD_DIR)/out

all: $(OUT_DIR)/kernel7.img

# Create build and output directories
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(BUILD_DIR)/start.o: start.S | $(BUILD_DIR)
	arm-none-eabi-gcc $(CFLAGS) -c start.S -o $@

$(BUILD_DIR)/main.o: main.c | $(BUILD_DIR)
	arm-none-eabi-gcc $(CFLAGS) -c main.c -o $@

$(OUT_DIR)/kernel7.elf: $(BUILD_DIR)/start.o $(BUILD_DIR)/main.o | $(OUT_DIR)
	arm-none-eabi-ld -T linker.ld -o $@ $^

$(OUT_DIR)/kernel7.img: $(OUT_DIR)/kernel7.elf
	arm-none-eabi-objcopy $< -O binary $@

clean:
	rm -rf $(BUILD_DIR)
