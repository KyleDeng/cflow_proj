all: run

ROOT := $(pwd)
OUTPUT := ./output
SRCS := $(shell find ./src -name "*.c")
OBJS := $(patsubst ./src/%.c,$(OUTPUT)/%.o,$(SRCS))
CFLAGS := -O2 -g -Wall -std=c99
LDFLAGS := -g -Wall

$(OUTPUT)/%.o: ./src/%.c
	@gcc $(CFLAGS) -c $< -o $@


flow: $(SRCS)
	@cflow $^ -o $(OUTPUT)/cflow.out
	@cat $(OUTPUT)/cflow.out | ./tree2dotx > $(OUTPUT)/dot.out
	@dot -Tpng $(OUTPUT)/dot.out -o $(OUTPUT)/dot.png
	@echo "cflow finished."

EXE := $(OUTPUT)/main
$(EXE): $(OBJS)
	@gcc $(LDFLAGS) $^ -o $@

build: $(EXE)
	@echo "build"

run: $(EXE)
	@echo ">run: $<"
	@$<

config:
	@mkdir $(OUTPUT)

clean:
	@rm -rf $(OUTPUT)

.PHONY: all build run config clean flow
