#ifndef __PIP_IO__
#define __PIP_IO__

#include <stdint.h>
void outb(uint16_t port, uint8_t value);
uint8_t inb(uint16_t port);
void outw(uint16_t port, uint16_t value);
uint16_t inw(uint16_t port);
void outaddrl(uint16_t port, uint32_t value);
void outl(uint16_t port, uint32_t value);
uint32_t inl(uint16_t port);
void halt();
uint64_t mmioRead(uint32_t base,uint32_t offset,uint32_t size);
void mmioWrite(uint32_t base,uint32_t offset,uint32_t size,uint8_t value);
void mmioSet(uint32_t base,uint32_t offset,uint32_t size,uint8_t smask);
void mmioClear(uint32_t base,uint32_t offset,uint32_t size,uint8_t cmask);
void mmioModify(uint32_t base,uint32_t offset,uint32_t size,uint8_t cmask,uint8_t smask);
uint32_t writeMMIO(uint32_t dst,uint32_t src);
#endif
