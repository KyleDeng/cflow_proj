all: run

ROOT := $(pwd)
OUTPUT := ./output
SRCS := $(shell find ./src -name "*.c")
OBJS := $(patsubst ./src/%.c,$(OUTPUT)/%.o,$(SRCS))
CFLAGS := -O2 -g -Wall -std=c99
LDFLAGS := -g -Wall

$(OUTPUT)/%.o: ./src/%.c
	@gcc $(CFLAGS) -c $< -o $@


cflow: $(SRCS)
	@cflow $^ -o $(OUTPUT)/cflow.out
	@cat $(OUTPUT)/cflow.out | ./tree2dotx > $(OUTPUT)/cflow.dot
	@dot -Tpng $(OUTPUT)/cflow.dot -o $(OUTPUT)/cflow.png
	@echo "cflow finished."

cflow_show:
	@if [ -f $(OUTPUT)/cflow.dot ]; then \
		{ xdot $(OUTPUT)/cflow.dot; }& \
	else \
		echo "Use [make cflow]."; \
	fi

calltree: $(SRCS)
	@calltree -np -b depth=10 list=main $^ -dot > $(OUTPUT)/calltree.dot
	@dot -Tpng $(OUTPUT)/calltree.dot -o $(OUTPUT)/calltree.png
	@echo "calltree finished."

calltree_show:
	@if [ -f $(OUTPUT)/calltree.dot ]; then \
		{ xdot $(OUTPUT)/calltree.dot; }& \
	else \
		echo "Use [make calltree]."; \
	fi

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

.PHONY: all build run config clean cflow cflow_show calltree calltree_show
