# the compiler to use
CC      = g++

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CCFLAGS = -Wall
RM      = rm -rf
MKDIR	= mkdir
RMD		= rm -r

# $(wildcard *.cpp /xxx/xxx/*.cpp): get all .cpp files from the current directory and dir "/xxx/xxx/"
SRCS := $(wildcard src/*.cpp)
# $(patsubst %.cpp,%.o,$(SRCS)): substitute all ".cpp" file name strings to ".o" file name strings
OBJS := $(patsubst %.cpp,%.o,$(SRCS))

default: main

#Check OS
UNAME 	:= $(shell uname)

checkos:
ifeq ($(UNAME), Linux)
SFMLLINK = -lsfml-graphics -lsfml-window -lsfml-system
endif
main: checkos clean main.cpp $(OBJS)
	@echo $(SRCS)
	@echo $(OBJS)
	$(RMD) build
	$(MKDIR) build
	$(CC) $(CCFLAGS) -no-pie -o bin/main main.cpp $(OBJS) $(SFMLLINK) icon/app.res
	@mv src/*.o build/
	@echo $(UNAME)
	@echo "Build complete"
%.o: src/%.cpp
	$(CC) -c src/%.cpp
clean:
	$(RM) *.dSYM *.out src/*.o build/main
	@echo "Clean complete"
