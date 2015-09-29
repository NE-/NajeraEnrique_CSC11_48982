PROGRAMS = DivModShift

$(PROGRAMS): % : %.o
	ld -o $@ $<

clean:
	rm -f *.o $(PROGRAMS)

