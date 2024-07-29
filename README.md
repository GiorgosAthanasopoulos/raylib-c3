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

# Example

- See `src/main.c3` and `makefile` (for building) for an example on how to use the library.

# Progress

- [x] rcore
    - [x] Enumerations (window flags, etc.)
    - [x] Macro definitions (colors, etc.)
    - [x] Structures (vectors, etc.)
    - [x] window functions
    - [x] cursor functions
    - [x] drawing functions
    - [x] vr functions 
    - [x] shader functions 
    - [x] screen/space functions
    - [x] timing functions
    - [x] frame control functions
    - [x] random functions  
    - [x] misc functions
    - [x] util functions
    - [x] callback functions
    - [x] file functions
    - [x] filesystem functions
    - [x] compression functions
    - [x] automation functions
    - [x] keyboard functions
    - [x] gamepads functions
    - [x] mouse functions
    - [x] touch functions
    - [x] gestures
    - [x] camera
- [x] rshapes
    - [x] basic shape functions
    - [x] spline functions
    - [x] spline segment functions
    - [x] basic collision functions
- [x] rtextures
    - [x] image loading functions
    - [x] image generation functions
    - [x] image manipulation functions
    - [x] image drawing functions
    - [x] texture loading functions
    - [x] texture configuration functions
    - [x] texture drawing functions
    - [x] color/pixel related functions
- [ ] rtext
    - [x] font loading/unloading functions
    - [x] text drawing functions
    - [x] font info functions
    - [x] text codepoint management functions
    - [ ] text strings management functions
- [ ] rmodels
    - [ ] basic 3d shape functions
    - [ ] model management functions
    - [ ] model drawing functions 
    - [ ] mesh management functions
    - [ ] mesh generation functions
    - [ ] material loading/unloading functions 
    - [ ] model animations loading/unloading functions
    - [ ] collision detection functions
- [ ] raudio
    - [ ] audio device management functions
    - [ ] wave/sound loading/unloading functions
    - [ ] wave/sound management functions
    - [ ] music management functions
    - [ ] audiostream management functions
