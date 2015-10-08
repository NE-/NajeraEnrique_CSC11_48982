PROGRAMS = SMLAB SMLABTCC UMULL

ifneq ($(MAKECMDGOALS),)
PROGRAMS = $(MAKECMDGOALS)
endif

all: $(PROGRAMS)

$(PROGRAMS): % : %.o
		ld -o $@ $<

clean:
		rm -f *.o $(PROGRAMS)

