GHC = ghc

BUILD_DIR = build

HS_FILES = $(wildcard *.hs)

OUTPUT = $(BUILD_DIR)/witcher

GHC_FLAGS = -outputdir=$(BUILD_DIR)

all: $(OUTPUT)

$(OUTPUT): $(HS_FILES)
	mkdir -p $(BUILD_DIR)
	$(GHC) $(GHC_FLAGS) -o $(OUTPUT) $(HS_FILES)

run: $(OUTPUT)
	@echo "Running the program..."
	@$(OUTPUT)

clean:
	@echo "Cleaning up..."
	rm -rf $(BUILD_DIR)
