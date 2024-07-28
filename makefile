all:run

run:$(wildcard src/*.c3)
	c3c compile -l /usr/lib/libraylib.so --output-dir bin src/*.c3
