.PHONY: build run test clean

build: build/out build/test
	@echo '' > /dev/null

run: build
	@build/out

test: build/test
	@build/test

clean:
	rm -rf build .cache
	rm -f .vscode/*.log

# ==== Begin Generated Config ==== #

build/out: .cache/src/lib/sample.o .cache/src/main.o
	@mkdir -p $(@D)
	g++ $^ -o $@

build/test: .cache/src/lib/sample.o .cache/test/main_test.o .cache/test/sample_test.o
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

.cache/test/sample_test.o: test/sample_test.cpp test/../src/lib/sample.hpp
	@mkdir -p $(@D)
	g++ -c $< -o $@

# ==== End Generated Config ==== #
