SOURCES := $(wildcard *.hs)

OBJECTS := $(patsubst %.hs,bin/%.o,$(SOURCES))

EXECUTABLES := $(patsubst %.hs,bin/%,$(SOURCES))

all: $(EXECUTABLES)

bin/%.o: %.hs
	mkdir -p bin
	ghc -c $< -o $@
	mv $(patsubst %.hs,%.hi,$<) bin/

bin/%: bin/%.o
	ghc $< -o $@

clean:
	rm -rf bin $(wildcard *.o)

.PHONY: clean
