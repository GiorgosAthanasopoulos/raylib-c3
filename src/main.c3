module main;

import raylib;

fn void main() {
    raylib::set_config_flags(raylib::ConfigFlags.FLAG_WINDOW_RESIZABLE.num);
    raylib::init_window(1280, 720, "Hello Raylib from C3!");
    defer raylib::close_window();

    raylib::Vector2 pos = {0, 0};

    while (!raylib::window_should_close()) {
        raylib::begin_drawing();
        defer raylib::end_drawing();
        raylib::clear_background(raylib::BLACK);
 
        pos += raylib::get_frame_time() * 100;
        raylib::draw_rectangle_v(pos, {100, 100}, raylib::RED);

        if (raylib::is_key_pressed(raylib::KeyboardKey.KEY_W.num)) {
            pos.y -= 100;
        }
    }
}
