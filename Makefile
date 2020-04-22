CC=g++

CFLAGS=-Ofast -march=native -mtune=native -std=c++14

LDFLAGS=

EXEC=main

SRC=./src/Livre.cpp   \
    ./src/main.cpp

OBJ= $(SRC:.cpp=.o)

all: $(EXEC)

main: $(OBJ)
	$(CC) $(CFLAGS) -o ./bin/$@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: clean mrproper

clean:
	find ./bin -name main -exec rm {} \;
	find ./src -name *.o  -exec rm {} \;

mrproper: clean
	rm $(EXEC)
