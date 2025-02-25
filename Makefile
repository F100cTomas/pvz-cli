CC = g++
CFLAGS = -Wall -std=c++20 -Iinclude -Isrc

FRONTEND = cli

bin/pvz-cli: build/main.o bin/engine.so bin/frontend.so
	$(CC) $^ -o $@ $(CFLAGS)
	@chmod +x $@

ENGINE_SRC = $(shell find src/engine -name "*.cpp")
ENGINE_OBJ = $(ENGINE_SRC:src/%.cpp=build/%.o)
bin/engine.so: $(ENGINE_OBJ)
	$(CC) -shared $^ -o $@ $(CFLAGS)

bin/frontend.so: bin/$(FRONTEND).so
	@cp $^ $@

CLI_SRC = $(shell find src/cli -name "*.cpp")
CLI_OBJ = $(CLI_SRC:src/%.cpp=build/%.o)
bin/cli.so: $(CLI_OBJ)
	@echo $(CLI_SRC)
	$(CC) -shared $^ -o $@ $(CFLAGS)

build/%.o: src/%.cpp
	@mkdir -p $(dir $@)
	$(CC) -c $^ -o $@ $(CFLAGS)

bin build:
	@mkdir $@

run: bin/pvz-cli
	@echo
	@bin/pvz-cli

clean:
	rm -rf build/* bin/*
