# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -g

# Target executable
TARGET = server

# Source files
SRCS = main.cpp

# Build directory
BUILD = ./build

# Object files in build directory
OBJS = $(patsubst %.cpp, $(BUILD)/%.o, $(SRCS))

# Default rule
all: $(BUILD) $(BUILD)/$(TARGET)

$(BUILD):
	mkdir -p $(BUILD)

# Linking
$(BUILD)/$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile .cpp files into .o files in build directory
$(BUILD)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build directory
clean:
	rm -rf $(BUILD)
