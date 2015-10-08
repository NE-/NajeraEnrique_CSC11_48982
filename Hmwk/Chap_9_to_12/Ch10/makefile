PROGRAMS = LSL LSR ASR ROR RRX
ifneq ($(MAKECMDGOALS),)
PROGRAMS = $(MAKECMDGOALS)
endif

all: $(PROGRAMS)

$(PROGRAMS): % : %.o
		ld -o $@ $<

clean:
		rm -f *.o $(PROGRAMS)

