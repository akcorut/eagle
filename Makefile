CC=gcc
CFLAGS=-g -Wall -O2 -pthread

HTSDIR=htslib
INCLUDES=-I$(HTSDIR)
LFLAGS=-L$(HTSDIR)
LIBS=$(HTSDIR)/libhts.a
#LDLIBS=-lm -lz -lpthread # older version of htslib
LDLIBS=-lm -lz -llzma -lbz2 -lpthread

MAIN = eagle
AUX = util.o vector.o

all: UTIL HTSLIB READCLASSIFY
	$(CC) $(CFLAGS) $(LFLAGS) $(INCLUDES) $(MAIN).c -o $(MAIN) $(AUX) $(LIBS) $(LDLIBS)

HTSLIB:
	$(MAKE) -C $(HTSDIR)/

UTIL:
	$(CC) $(CFLAGS) -c util.c vector.c $(LDLIBS)

READCLASSIFY:
	$(CC) $(CFLAGS) $(LFLAGS) $(INCLUDES) eagle-rc.c -o eagle-rc $(AUX) $(LIBS) $(LDLIBS)

clean:
	rm -f eagle eagle-rc *.o

# DO NOT DELETE THIS LINE -- make depend needs it
