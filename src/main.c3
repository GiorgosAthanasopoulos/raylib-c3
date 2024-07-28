module main;

import raylib;

fn void main() {
    raylib::set_config_flags(raylib::ConfigFlags.FLAG_WINDOW_RESIZABLE.hex|raylib::ConfigFlags.FLAG_WINDOW_UNDECORATED.hex);
    raylib::init_window(1280, 720, "Hello Raylib from C3!");

    while (!raylib::window_should_close()) {
        raylib::begin_drawing();
        raylib::clear_background(raylib::BLACK);
        raylib::end_drawing();
    }
    
    raylib::close_window();
}
