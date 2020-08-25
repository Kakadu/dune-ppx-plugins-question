.PHONY: celan

all:
	dune build --verbose

celan: clean
clean:
	dune clean
