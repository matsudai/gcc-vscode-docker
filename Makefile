.PHONY: build run test clean

build: build/out
	@echo '' > /dev/null

run: build
	@build/out

test: build/out build/test
	@build/test

clean:
	rm -rf build .cache
	rm -f .vscode/*.log

# ==== Begin Generated Config ==== #

build/out: .cache/src/lib/sample.o .cache/src/main.o
	@mkdir -p $(@D)
	g++ $^ -o $@

build/test: .cache/src/lib/sample.o .cache/test/main_test.o .cache/test/lib/sample_test.o
	@mkdir -p $(@D)
	g++ $^ -o $@ -lgtest -lgtest_main -pthread

.cache/src/lib/sample.o: src/lib/sample.cpp src/lib/sample.hpp
	@mkdir -p $(@D)
	g++ -c $< -o $@

.cache/src/main.o: src/main.cpp src/lib/sample.hpp
	@mkdir -p $(@D)
	g++ -c $< -o $@

.cache/test/main_test.o: test/main_test.cpp
	@mkdir -p $(@D)
	g++ -c $< -o $@

.cache/test/lib/sample_test.o: test/lib/sample_test.cpp test/lib/../../src/lib/sample.hpp
	@mkdir -p $(@D)
	g++ -c $< -o $@

# ==== End Generated Config ==== #
