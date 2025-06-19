# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -g

# Directories
SRC_DIR = src
TEST_DIR = test
BUILD_DIR = build

# Targets
TARGET = server
TEST_TARGET = test

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)

# Object files in build directory for src and test
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/src/%.o,$(SRCS))
TEST_OBJS = $(patsubst $(TEST_DIR)/%.cpp,$(BUILD_DIR)/test/%.o,$(TEST_SRCS))

# Default target builds main server only
all: $(BUILD_DIR) $(BUILD_DIR)/$(TARGET)

# Create build subdirectories
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/src
	mkdir -p $(BUILD_DIR)/test

# Link main executable
$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files in src/
$(BUILD_DIR)/src/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile test objects from files in test/
$(BUILD_DIR)/test/%.o: $(TEST_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link test executable (depends on main objs and test objs)
$(BUILD_DIR)/test/$(TEST_TARGET): $(OBJS) $(TEST_OBJS)
	$(CXX) $(CXXFLAGS) -pthread -o $@ $^ $(shell pkg-config --libs --cflags gtest)

# Run tests
test: $(BUILD_DIR) $(BUILD_DIR)/test/$(TEST_TARGET)
	./$(BUILD_DIR)/test/$(TEST_TARGET)

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)


print:
	@echo TEST_SRCS: $(TEST_SRCS)
	@echo TEST_OBJS: $(TEST_OBJS)
