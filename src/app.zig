// Copyright 2023 XXIV
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
pub const APP_S16 = c_short;
pub const APP_U32 = c_uint;
pub const APP_U64 = c_ulonglong;

pub const app_t = opaque {};

pub const app_state_t = enum(c_uint) {
    APP_STATE_EXIT_REQUESTED,
    APP_STATE_NORMAL
};

pub const app_log_level_t = enum(c_uint) {
    APP_LOG_LEVEL_INFO,
    APP_LOG_LEVEL_WARNING,
    APP_LOG_LEVEL_ERROR
};

pub const app_interpolation_t = enum(c_uint) {
    APP_INTERPOLATION_NONE,
    APP_INTERPOLATION_LINEAR
};

pub const app_screenmode_t = enum(c_uint) {
    APP_SCREENMODE_WINDOW,
    APP_SCREENMODE_FULLSCREEN
};

pub const app_display_t = extern struct {
    id: [64]u8,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
};

pub const app_displays_t = extern struct {
    displays: [*c]app_display_t,
    count: c_int,
};

pub const app_key_t = enum(c_uint) {
    APP_KEY_INVALID, APP_KEY_LBUTTON, APP_KEY_RBUTTON, APP_KEY_CANCEL, APP_KEY_MBUTTON,
    APP_KEY_XBUTTON1, APP_KEY_XBUTTON2, APP_KEY_BACK, APP_KEY_TAB, APP_KEY_CLEAR, APP_KEY_RETURN, APP_KEY_SHIFT,
    APP_KEY_CONTROL, APP_KEY_MENU, APP_KEY_PAUSE, APP_KEY_CAPITAL, APP_KEY_KANA, APP_KEY_HANGUL = .APP_KEY_KANA,
    APP_KEY_JUNJA, APP_KEY_FINAL, APP_KEY_HANJA, APP_KEY_KANJI = .APP_KEY_HANJA, APP_KEY_ESCAPE, APP_KEY_CONVERT,
    APP_KEY_NONCONVERT, APP_KEY_ACCEPT, APP_KEY_MODECHANGE, APP_KEY_SPACE, APP_KEY_PRIOR, APP_KEY_NEXT, APP_KEY_END,
    APP_KEY_HOME, APP_KEY_LEFT, APP_KEY_UP, APP_KEY_RIGHT, APP_KEY_DOWN, APP_KEY_SELECT, APP_KEY_PRINT, APP_KEY_EXEC,
    APP_KEY_SNAPSHOT, APP_KEY_INSERT, APP_KEY_DELETE, APP_KEY_HELP, APP_KEY_0, APP_KEY_1, APP_KEY_2, APP_KEY_3,
    APP_KEY_4, APP_KEY_5, APP_KEY_6, APP_KEY_7, APP_KEY_8, APP_KEY_9, APP_KEY_A, APP_KEY_B, APP_KEY_C, APP_KEY_D,
    APP_KEY_E, APP_KEY_F, APP_KEY_G, APP_KEY_H, APP_KEY_I, APP_KEY_J, APP_KEY_K, APP_KEY_L, APP_KEY_M, APP_KEY_N,
    APP_KEY_O, APP_KEY_P, APP_KEY_Q, APP_KEY_R, APP_KEY_S, APP_KEY_T, APP_KEY_U, APP_KEY_V, APP_KEY_W, APP_KEY_X,
    APP_KEY_Y, APP_KEY_Z, APP_KEY_LWIN, APP_KEY_RWIN, APP_KEY_APPS, APP_KEY_SLEEP, APP_KEY_NUMPAD0, APP_KEY_NUMPAD1,
    APP_KEY_NUMPAD2, APP_KEY_NUMPAD3, APP_KEY_NUMPAD4, APP_KEY_NUMPAD5, APP_KEY_NUMPAD6, APP_KEY_NUMPAD7,
    APP_KEY_NUMPAD8, APP_KEY_NUMPAD9, APP_KEY_MULTIPLY, APP_KEY_ADD, APP_KEY_SEPARATOR, APP_KEY_SUBTRACT,
    APP_KEY_DECIMAL, APP_KEY_DIVIDE, APP_KEY_F1, APP_KEY_F2, APP_KEY_F3, APP_KEY_F4, APP_KEY_F5, APP_KEY_F6, APP_KEY_F7,
    APP_KEY_F8, APP_KEY_F9, APP_KEY_F10, APP_KEY_F11, APP_KEY_F12, APP_KEY_F13, APP_KEY_F14, APP_KEY_F15, APP_KEY_F16,
    APP_KEY_F17, APP_KEY_F18, APP_KEY_F19, APP_KEY_F20, APP_KEY_F21, APP_KEY_F22, APP_KEY_F23, APP_KEY_F24,
    APP_KEY_NUMLOCK, APP_KEY_SCROLL, APP_KEY_LSHIFT, APP_KEY_RSHIFT, APP_KEY_LCONTROL, APP_KEY_RCONTROL, APP_KEY_LMENU,
    APP_KEY_RMENU, APP_KEY_BROWSER_BACK, APP_KEY_BROWSER_FORWARD, APP_KEY_BROWSER_REFRESH, APP_KEY_BROWSER_STOP,
    APP_KEY_BROWSER_SEARCH, APP_KEY_BROWSER_FAVORITES, APP_KEY_BROWSER_HOME, APP_KEY_VOLUME_MUTE, APP_KEY_VOLUME_DOWN,
    APP_KEY_VOLUME_UP, APP_KEY_MEDIA_NEXT_TRACK, APP_KEY_MEDIA_PREV_TRACK, APP_KEY_MEDIA_STOP, APP_KEY_MEDIA_PLAY_PAUSE,
    APP_KEY_LAUNCH_MAIL, APP_KEY_LAUNCH_MEDIA_SELECT, APP_KEY_LAUNCH_APP1, APP_KEY_LAUNCH_APP2, APP_KEY_OEM_1,
    APP_KEY_OEM_PLUS, APP_KEY_OEM_COMMA, APP_KEY_OEM_MINUS, APP_KEY_OEM_PERIOD, APP_KEY_OEM_2, APP_KEY_OEM_3,
    APP_KEY_OEM_4, APP_KEY_OEM_5, APP_KEY_OEM_6, APP_KEY_OEM_7, APP_KEY_OEM_8, APP_KEY_OEM_102, APP_KEY_PROCESSKEY,
    APP_KEY_ATTN, APP_KEY_CRSEL, APP_KEY_EXSEL, APP_KEY_EREOF, APP_KEY_PLAY, APP_KEY_ZOOM, APP_KEY_NONAME, APP_KEY_PA1,
    APP_KEY_OEM_CLEAR, APP_KEYCOUNT
};

pub const app_input_type_t = enum(c_uint) {
    APP_INPUT_KEY_DOWN, APP_INPUT_KEY_UP, APP_INPUT_DOUBLE_CLICK, APP_INPUT_CHAR,
    APP_INPUT_MOUSE_MOVE, APP_INPUT_MOUSE_DELTA, APP_INPUT_SCROLL_WHEEL, APP_INPUT_TABLET
};

pub const app_pressed_t = enum(c_uint) {
    APP_NOT_PRESSED, APP_PRESSED
};

pub const data_t = extern union {
    key: app_key_t,
    char_code: u8,
    mouse_pos: extern struct {
        x: c_int,
        y: c_int,
    },
    mouse_delta: extern struct {
        x: f32,
        y: f32,
    },
    wheel_delta: f32,
    tablet: extern struct {
        x: c_int,
        y: c_int,
        pressure: f32,
        tip: app_pressed_t,
        lower: app_pressed_t,
        upper: app_pressed_t,
    },
};

pub const app_input_event_t = extern struct {
    type: app_input_type_t,
    data: data_t,
};

pub const app_input_t = extern struct {
    events: [*c]app_input_event_t,
    count: c_int,
};

pub extern fn app_run(app_proc: ?fn (?*app_t, ?*anyopaque) callconv(.C) c_int, user_data: ?*anyopaque, memctx: ?*anyopaque, logctx: ?*anyopaque, fatalctx: ?*anyopaque) c_int;
pub extern fn app_yield(app: ?*app_t) app_state_t;
pub extern fn app_cancel_exit(app: ?*app_t) void;
pub extern fn app_title(app: ?*app_t, title: [*c]const u8) void;
pub extern fn app_cmdline(app: ?*app_t) [*c]const u8;
pub extern fn app_filename(app: ?*app_t) [*c]const u8;
pub extern fn app_userdata(app: ?*app_t) [*c]const u8;
pub extern fn app_appdata(app: ?*app_t) [*c]const u8;
pub extern fn app_time_count(app: ?*app_t) APP_U64;
pub extern fn app_time_freq(app: ?*app_t) APP_U64;
pub extern fn app_log(app: ?*app_t, level: app_log_level_t, message: [*c]const u8) void;
pub extern fn app_fatal_error(app: ?*app_t, message: [*c]const u8) void;
pub extern fn app_pointer(app: ?*app_t, width: c_int, height: c_int, pixels_abgr: [*c]APP_U32, hotspot_x: c_int, hotspot_y: c_int) void;
pub extern fn app_pointer_default(app: ?*app_t, width: [*c]c_int, height: [*c]c_int, pixels_abgr: [*c]APP_U32, hotspot_x: [*c]c_int, hotspot_y: [*c]c_int) void;
pub extern fn app_pointer_pos(app: ?*app_t, x: c_int, y: c_int) void;
pub extern fn app_pointer_x(app: ?*app_t) c_int;
pub extern fn app_pointer_y(app: ?*app_t) c_int;
pub extern fn app_pointer_limit(app: ?*app_t, x: c_int, y: c_int, width: c_int, height: c_int) void;
pub extern fn app_pointer_limit_off(app: ?*app_t) void;
pub extern fn app_interpolation(app: ?*app_t, interpolation: app_interpolation_t) void;
pub extern fn app_screenmode(app: ?*app_t, screenmode: app_screenmode_t) void;
pub extern fn app_window_size(app: ?*app_t, width: c_int, height: c_int) void;
pub extern fn app_window_width(app: ?*app_t) c_int;
pub extern fn app_window_height(app: ?*app_t) c_int;
pub extern fn app_window_pos(app: ?*app_t, x: c_int, y: c_int) void;
pub extern fn app_window_x(app: ?*app_t) c_int;
pub extern fn app_window_y(app: ?*app_t) c_int;
pub extern fn app_displays(app: ?*app_t) app_displays_t;
pub extern fn app_present(app: ?*app_t, pixels_xbgr: [*c]const APP_U32, width: c_int, height: c_int, mod_xbgr: APP_U32, border_xbgr: APP_U32) void;
pub extern fn app_sound(app: ?*app_t, sample_pairs_count: c_int, sound_callback: ?fn ([*c]APP_S16, c_int, ?*anyopaque) callconv(.C) void, user_data: ?*anyopaque) void;
pub extern fn app_sound_volume(app: ?*app_t, volume: f32) void;
pub extern fn app_input(app: ?*app_t) app_input_t;
pub extern fn app_coordinates_window_to_bitmap(app: ?*app_t, width: c_int, height: c_int, x: [*c]c_int, y: [*c]c_int) void;
pub extern fn app_coordinates_bitmap_to_window(app: ?*app_t, width: c_int, height: c_int, x: [*c]c_int, y: [*c]c_int) void;
