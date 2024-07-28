# Raylib-C3

Raylib bindings for the C3 programming language. (WIP)

# Usage

- Copy `src/raylib.c3` in ur project
- In your file:
    - import lib: `import raylib;`
    - Use the raylib functions: ```fn void main() {
    raylib::init_window(420, 69, "Deez nuts");
    }```
- Link with raylib lib: ```c3c compile -l /usr/lib/libraylib.so my_file.c3 raylib.c3```
- Profit!
