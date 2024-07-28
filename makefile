all:run

run:$(wildcard src/*.c3)
	c3c compile-run -l /usr/lib/libraylib.so --output-dir bin src/*.c3
