#if 0
#define GPIO_BASE 0x3F200000
#define GPFSEL1   ((volatile unsigned int*)(GPIO_BASE + 0x04))
#define GPSET0    ((volatile unsigned int*)(GPIO_BASE + 0x1C))
#define GPCLR0    ((volatile unsigned int*)(GPIO_BASE + 0x28))

void delay(unsigned int count) {
    while(count--) asm volatile("nop");
}

int main() {
    *GPFSEL1 |= (1 << 18); // Set GPIO16 as output
    while(1) {
        *GPSET0 = (1 << 16); // Set GPIO16 high
        delay(500000);
        *GPCLR0 = (1 << 16); // Set GPIO16 low
        delay(500000);
    }
    return 0;
}

#endif
#define GPIO_BASE 0x3F200000
#define GPFSEL1   ((volatile unsigned int*)(GPIO_BASE + 0x04))
#define GPSET0    ((volatile unsigned int*)(GPIO_BASE + 0x1C))
#define GPCLR0    ((volatile unsigned int*)(GPIO_BASE + 0x28))

void delay(unsigned int count) {
    while(count--) asm volatile("nop");
}

int main() {
    *GPFSEL1 |= (1 << 18); // Set GPIO16 as output
    while(1) {
        *GPSET0 = (1 << 16); // Set GPIO16 high
        delay(500000);
        *GPCLR0 = (1 << 16); // Set GPIO16 low
        delay(500000);
    }
    return 0;
}
