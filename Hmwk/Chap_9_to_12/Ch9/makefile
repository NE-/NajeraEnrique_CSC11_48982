PROGRAMS = EQ NE MI PL CS CC AL NV HI LS GE LT GT LE

ifneq ($(MAKECMDGOALS),)
PROGRAMS = $(MAKECMDGOALS)
endif

all: $(PROGRAMS)

$(PROGRAMS): % : %.o
		ld -o $@ $<

clean:
		rm -f *.o $(PROGRAMS)

