.PHONY: build run clean

CC = g++

build: build/a.out
	@echo '' > /dev/null

run: build
	@build/a.out

clean:
	rm -rf build
	rm .vscode/*.log

# ==== Begin Generated Config ==== #

build/a.out: build/lib/sample.o build/main.o
	@mkdir -p $(@D)
	$(CC) $^ -o $@

build/lib/sample.o: src/lib/sample.cpp src/lib/sample.hpp
	@mkdir -p $(@D)
	$(CC) -c $< -o $@

build/main.o: src/main.cpp src/lib/sample.hpp
	@mkdir -p $(@D)
	$(CC) -c $< -o $@

# ==== End Generated Config ==== #
