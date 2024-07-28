module raylib;

struct Matrix {
    float m0, m4, m8, m12;
    float m1, m5, m9, m13;
    float m2, m6, m10, m14;
    float m3, m7, m11, m15;
}

struct Rectangle {
    float x, y, width, height;
}

struct Image {
    void *data;
    int width, height, mipmaps, format;
}

struct Texture {
    uint id;
    int width, height, mipmaps, format;
}
struct RenderTexture {
    uint id;
    Texture texture;
    Texture depth;
}

struct NPatchInfo {
    Rectangle source;
    int left, top, right, bottom, layout;
}

struct GlyphInfo {
    int value, offsetX, offsetY, advanceX;
    Image image;
}

struct Font {
    int baseSize, glyphCount, glyphPadding;
    Texture2D texture;
    Rectangle *recs;
    GlyphInfo *glyphs;
}

struct Camera3D {
    Vector3 pos;
    float fovy;
    int projection;
}
struct Camera2D {
    Vector2 offset, target;
    float rotation, zoom;
}

struct Mesh {
    int vertexCount, triangleCount;
    float *vertices, texcoords, texcoords2, normals, tangents, animVertices, animNormals, boneWeights;
    char *colors, boneIds;
    ushort *indices;
    uint vaoId;
    uint *vboId;
}

struct Shader {
    uint id;
    int *locs;
}

struct MaterialMap {
    Texture2D texture;
    Color color;
    float value;
}
struct Material {
    Shader shader;
    MaterialMap *maps;
    float [4]params;
}

struct Transform {
    Vector3 translation, scale;
    Quaternion rotation;
}

struct BoneInfo {
    char [32]name;
    int parent;
}

struct Model {
    Matrix transform;
    int meshCount, materialCount, boneCount;
    Mesh *meshes;
    Material *materials;
    int *meshMaterial;
    BoneInfo *bones;
    Transform *bindPose;
}
struct ModelAnimation {
    int boneCount, frameCount;
    BoneInfo *bones;
    Transform **framePoses;
    char [32]name;
}

struct Ray {
    Vector3 position, direction;
}
struct RayCollision {
    bool hit;
    float distance;
    Vector3 point, normal;
} 
struct BoundingBox {
    Vector3 min, max;
}

struct Wave {
    uint frameCount, sampleRate, sampleSize, channels;
    void *data;
}
struct AudioStream {
    // TODO: implement rlaudio
    uint sampleRate, sampleSize, channels;

}
struct Sound {
    AudioStream sound;
    uint frameCount;
}
struct Music {
    AudioStream stream;
    uint frameCount;
    bool looping;
    int ctxType;
    void *ctxData;
}

struct VrDeviceInfo {
    int hResolution, vResolution;
    float hScreenSize, vScreenSize, eyeToScreenDistance, lensSeparationDistance, interpupillaryDistance;
    float [4]lensDistortionValues, chromaAbCorrection;
}
struct VrStereoConfig {
    Matrix [2]projection, viewOffset;
    float [2]leftLensCenter, rightLensCenter, leftScreenCenter, rightScreenCenter, scale, scaleIn;
}

struct FilePathList {
    uint capacity;
    uint count;
    char **paths;
}

struct AutomationEvent {
    uint frame, type;
    int [4]params;
}
struct AutomationEventList {
    uint capacity;
    uint count;
    AutomationEvent *events;
}

enum ConfigFlags : int(int hex) {
    FLAG_VSYNC_HINT         = 0x00000040,      
    FLAG_FULLSCREEN_MODE    = 0x00000002,
    FLAG_WINDOW_RESIZABLE   = 0x00000004,
    FLAG_WINDOW_UNDECORATED = 0x00000008, 
    FLAG_WINDOW_HIDDEN      = 0x00000080,  
    FLAG_WINDOW_MINIMIZED   = 0x00000200,   
    FLAG_WINDOW_MAXIMIZED   = 0x00000400,   
    FLAG_WINDOW_UNFOCUSED   = 0x00000800, 
    FLAG_WINDOW_TOPMOST     = 0x00001000,  
    FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   
    FLAG_WINDOW_TRANSPARENT = 0x00000010,   
    FLAG_WINDOW_HIGHDPI     = 0x00002000,   
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000,
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, 
    FLAG_MSAA_4X_HINT       = 0x00000020,  
    FLAG_INTERLACED_HINT    = 0x00010000    
}

enum TraceLogLevel : int(int num) {
    LOG_ALL = 0,
    LOG_TRACE = 1,
    LOG_DEBUG = 2,
    LOG_INFO = 3,
    LOG_WARNING = 4,
    LOG_ERROR = 5,
    LOG_FATAL = 6,
    LOG_NONE = 7,
}

enum KeyboardKey : int(int num) {
    KEY_NULL            = 0,        
    KEY_APOSTROPHE      = 39,      
    KEY_COMMA           = 44,     
    KEY_MINUS           = 45,    
    KEY_PERIOD          = 46,   
    KEY_SLASH           = 47,  
    KEY_ZERO            = 48, 
    KEY_ONE             = 49,
    KEY_TWO             = 50,
    KEY_THREE           = 51,
    KEY_FOUR            = 52,
    KEY_FIVE            = 53,
    KEY_SIX             = 54,
    KEY_SEVEN           = 55,
    KEY_EIGHT           = 56,
    KEY_NINE            = 57,
    KEY_SEMICOLON       = 59,
    KEY_EQUAL           = 61,
    KEY_A               = 65,
    KEY_B               = 66,
    KEY_C               = 67,       
    KEY_D               = 68,      
    KEY_E               = 69,     
    KEY_F               = 70,    
    KEY_G               = 71,   
    KEY_H               = 72,  
    KEY_I               = 73, 
    KEY_J               = 74,
    KEY_K               = 75,       
    KEY_L               = 76,      
    KEY_M               = 77,     
    KEY_N               = 78,    
    KEY_O               = 79,   
    KEY_P               = 80,  
    KEY_Q               = 81, 
    KEY_R               = 82,
    KEY_S               = 83,       
    KEY_T               = 84,      
    KEY_U               = 85,     
    KEY_V               = 86,    
    KEY_W               = 87,   
    KEY_X               = 88,  
    KEY_Y               = 89, 
    KEY_Z               = 90,
    KEY_LEFT_BRACKET    = 91,       
    KEY_BACKSLASH       = 92,      
    KEY_RIGHT_BRACKET   = 93,     
    KEY_GRAVE           = 96,    
    KEY_SPACE           = 32,       
    KEY_ESCAPE          = 256,     
    KEY_ENTER           = 257,    
    KEY_TAB             = 258,   
    KEY_BACKSPACE       = 259,  
    KEY_INSERT          = 260, 
    KEY_DELETE          = 261,      
    KEY_RIGHT           = 262,     
    KEY_LEFT            = 263,    
    KEY_DOWN            = 264,   
    KEY_UP              = 265,  
    KEY_PAGE_UP         = 266, 
    KEY_PAGE_DOWN       = 267,
    KEY_HOME            = 268,      
    KEY_END             = 269,     
    KEY_CAPS_LOCK       = 280,    
    KEY_SCROLL_LOCK     = 281,   
    KEY_NUM_LOCK        = 282,
    KEY_PRINT_SCREEN    = 283,  
    KEY_PAUSE           = 284, 
    KEY_F1              = 290,
    KEY_F2              = 291,      
    KEY_F3              = 292,     
    KEY_F4              = 293,    
    KEY_F5              = 294,   
    KEY_F6              = 295,  
    KEY_F7              = 296, 
    KEY_F8              = 297,
    KEY_F9              = 298,
    KEY_F10             = 299,      
    KEY_F11             = 300,     
    KEY_F12             = 301,    
    KEY_LEFT_SHIFT      = 340,   
    KEY_LEFT_CONTROL    = 341,  
    KEY_LEFT_ALT        = 342, 
    KEY_LEFT_SUPER      = 343,
    KEY_RIGHT_SHIFT     = 344,      
    KEY_RIGHT_CONTROL   = 345,     
    KEY_RIGHT_ALT       = 346,    
    KEY_RIGHT_SUPER     = 347,   
    KEY_KB_MENU         = 348,  
    KEY_KP_0            = 320,      
    KEY_KP_1            = 321,     
    KEY_KP_2            = 322,    
    KEY_KP_3            = 323,   
    KEY_KP_4            = 324,  
    KEY_KP_5            = 325,  
    KEY_KP_6            = 326, 
    KEY_KP_7            = 327,    
    KEY_KP_8            = 328,     
    KEY_KP_9            = 329,      
    KEY_KP_DECIMAL      = 330, 
    KEY_KP_DIVIDE       = 331,  
    KEY_KP_MULTIPLY     = 332,   
    KEY_KP_SUBTRACT     = 333,    
    KEY_KP_ADD          = 334,     
    KEY_KP_ENTER        = 335,      
    KEY_KP_EQUAL        = 336, 
    KEY_BACK            = 4,   
    KEY_MENU            = 5,  
    KEY_VOLUME_UP       = 24,
    KEY_VOLUME_DOWN     = 25
}

enum MouseButton : int(int num) {
    MOUSE_BUTTON_LEFT = 0,
    MOUSE_BUTTON_RIGHT = 1,
    MOUSE_BUTTON_MIDDLE = 2,
    MOUSE_BUTTON_SIDE    = 3,     
    MOUSE_BUTTON_EXTRA   = 4,     
    MOUSE_BUTTON_FORWARD = 5,       
    MOUSE_BUTTON_BACK    = 6,
}
enum MouseCursor : int(int num) {
    MOUSE_CURSOR_DEFAULT       = 0,     
    MOUSE_CURSOR_ARROW         = 1,    
    MOUSE_CURSOR_IBEAM         = 2,     
    MOUSE_CURSOR_CROSSHAIR     = 3,   
    MOUSE_CURSOR_POINTING_HAND = 4,    
    MOUSE_CURSOR_RESIZE_EW     = 5,     
    MOUSE_CURSOR_RESIZE_NS     = 6,  
    MOUSE_CURSOR_RESIZE_NWSE   = 7,   
    MOUSE_CURSOR_RESIZE_NESW   = 8,    
    MOUSE_CURSOR_RESIZE_ALL    = 9,     
    MOUSE_CURSOR_NOT_ALLOWED   = 10
}

enum GamepadButton : int(int num) {
    GAMEPAD_BUTTON_UNKNOWN = 0,         
    GAMEPAD_BUTTON_LEFT_FACE_UP = 1,        
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,     
    GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,   
    GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,      
    GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,       
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,    
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,     
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,     
    GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,     
    GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,    
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,  
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12, 
    GAMEPAD_BUTTON_MIDDLE_LEFT = 13, 
    GAMEPAD_BUTTON_MIDDLE = 14,
    GAMEPAD_BUTTON_MIDDLE_RIGHT = 15,        
    GAMEPAD_BUTTON_LEFT_THUMB = 16,         
    GAMEPAD_BUTTON_RIGHT_THUMB = 17,
}
enum GamepadAxis : int(int num) {
    GAMEPAD_AXIS_LEFT_X        = 0,     
    GAMEPAD_AXIS_LEFT_Y        = 1,   
    GAMEPAD_AXIS_RIGHT_X       = 2,    
    GAMEPAD_AXIS_RIGHT_Y       = 3,     
    GAMEPAD_AXIS_LEFT_TRIGGER  = 4,     
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5
}

enum MaterialMapIndex : int(int num) {
    MATERIAL_MAP_ALBEDO = 0,        
    MATERIAL_MAP_METALNESS = 1, 
    MATERIAL_MAP_NORMAL = 2, 
    MATERIAL_MAP_ROUGHNESS = 3,   
    MATERIAL_MAP_OCCLUSION = 4,    
    MATERIAL_MAP_EMISSION = 5,      
    MATERIAL_MAP_HEIGHT = 6,         
    MATERIAL_MAP_CUBEMAP = 7,         
    MATERIAL_MAP_IRRADIANCE = 8,       
    MATERIAL_MAP_PREFILTER = 9,         
    MATERIAL_MAP_BRDF = 10,
}

enum ShaderLocationIndex : int(int num) {
    SHADER_LOC_VERTEX_POSITION = 0, 
    SHADER_LOC_VERTEX_TEXCOORD01 = 1,  
    SHADER_LOC_VERTEX_TEXCOORD02 = 2, 
    SHADER_LOC_VERTEX_NORMAL = 3,    
    SHADER_LOC_VERTEX_TANGENT = 4,      
    SHADER_LOC_VERTEX_COLOR = 5,       
    SHADER_LOC_MATRIX_MVP = 6,        
    SHADER_LOC_MATRIX_VIEW = 7,      
    SHADER_LOC_MATRIX_PROJECTION = 8,   
    SHADER_LOC_MATRIX_MODEL = 9,       
    SHADER_LOC_MATRIX_NORMAL = 10,     
    SHADER_LOC_VECTOR_VIEW = 11,
    SHADER_LOC_COLOR_DIFFUSE = 12,       
    SHADER_LOC_COLOR_SPECULAR = 13,     
    SHADER_LOC_COLOR_AMBIENT = 14,     
    SHADER_LOC_MAP_ALBEDO = 15,       
    SHADER_LOC_MAP_METALNESS = 16,   
    SHADER_LOC_MAP_NORMAL = 17,     
    SHADER_LOC_MAP_ROUGHNESS = 18, 
    SHADER_LOC_MAP_OCCLUSION = 19,       
    SHADER_LOC_MAP_EMISSION = 20,       
    SHADER_LOC_MAP_HEIGHT = 21,        
    SHADER_LOC_MAP_CUBEMAP = 22,      
    SHADER_LOC_MAP_IRRADIANCE = 23,  
    SHADER_LOC_MAP_PREFILTER = 24,  
    SHADER_LOC_MAP_BRDF = 25,
}
enum ShaderUniformDataType : int(int num) {
    SHADER_UNIFORM_FLOAT = 0,       
    SHADER_UNIFORM_VEC2 = 1,            
    SHADER_UNIFORM_VEC3 = 2,           
    SHADER_UNIFORM_VEC4 = 3,          
    SHADER_UNIFORM_INT = 4,          
    SHADER_UNIFORM_IVEC2 = 5,       
    SHADER_UNIFORM_IVEC3 = 6,      
    SHADER_UNIFORM_IVEC4 = 7,     
    SHADER_UNIFORM_SAMPLER2D = 8,
}
enum ShaderAttributeDataType : int(int num) {
    SHADER_ATTRIB_FLOAT = 0,
    SHADER_ATTRIB_VEC2 = 1,             
    SHADER_ATTRIB_VEC3 = 2,             
    SHADER_ATTRIB_VEC4 = 3,
}

enum PixelFormat : int(int num) {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,  
    PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,     
    PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,    
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5, 
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,      
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,     
    PIXELFORMAT_UNCOMPRESSED_R32 = 8,         
    PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,     
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10, 
    PIXELFORMAT_UNCOMPRESSED_R16 = 11,         
    PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12,
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13, 
    PIXELFORMAT_COMPRESSED_DXT1_RGB = 14,        
    PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15,  
    PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16,   
    PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17,    
    PIXELFORMAT_COMPRESSED_ETC1_RGB = 18,      
    PIXELFORMAT_COMPRESSED_ETC2_RGB = 19,       
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20,   
    PIXELFORMAT_COMPRESSED_PVRT_RGB = 21,      
    PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22,      
    PIXELFORMAT_COMPRESSED_ASTC_4X4_RGBA = 23,   
    PIXELFORMAT_COMPRESSED_ASTC_8X8_RGBA = 24, 
}

enum TextureFilter : int(int num) {
    TEXTURE_FILTER_POINT = 0,               
    TEXTURE_FILTER_BILINEAR = 1,               
    TEXTURE_FILTER_TRILINEAR = 2,             
    TEXTURE_FILTER_ANISOTROPIC_4X = 3,       
    TEXTURE_FILTER_ANISOTROPIC_8X = 4,      
    TEXTURE_FILTER_ANISOTROPIC_16X = 5, 
}
enum TextureWrap : int(int num) {
    TEXTURE_WRAP_REPEAT = 0,                
    TEXTURE_WRAP_CLAMP = 1,                     
    TEXTURE_WRAP_MIRROR_REPEAT = 2,             
    TEXTURE_WRAP_MIRROR_CLAMP = 3,
}

enum CubemapLayout : int(int num) {
    CUBEMAP_LAYOUT_AUTO_DETECT = 0,         
    CUBEMAP_LAYOUT_LINE_VERTICAL = 1,         
    CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2,        
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3,     
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4,
    CUBEMAP_LAYOUT_PANORAMA = 5,
}

enum FontType : int(int num) {
    FONT_DEFAULT = 0,             
    FONT_BITMAP = 1,               
    FONT_SDF = 2,                   
} 

enum BlendMode : int(int num) {
    BLEND_ALPHA = 0,              
    BLEND_ADDITIVE = 1,            
    BLEND_MULTIPLIED = 2,           
    BLEND_ADD_COLORS = 3,            
    BLEND_SUBTRACT_COLORS = 4,        
    BLEND_ALPHA_PREMULTIPLY = 5,       
    BLEND_CUSTOM = 6,                   
    BLEND_CUSTOM_SEPARATE = 7,
}

enum Gesture : int(int num) {
    GESTURE_NONE        = 0,        
    GESTURE_TAP         = 1,       
    GESTURE_DOUBLETAP   = 2,      
    GESTURE_HOLD        = 4,     
    GESTURE_DRAG        = 8,    
    GESTURE_SWIPE_RIGHT = 16,  
    GESTURE_SWIPE_LEFT  = 32,       
    GESTURE_SWIPE_UP    = 64,      
    GESTURE_SWIPE_DOWN  = 128,    
    GESTURE_PINCH_IN    = 256,   
    GESTURE_PINCH_OUT   = 512
}

enum CameraMode : int(int num) {
    CAMERA_CUSTOM = 0,              
    CAMERA_FREE = 1,                  
    CAMERA_ORBITAL = 2,                
    CAMERA_FIRST_PERSON = 3,            
    CAMERA_THIRD_PERSON = 4,  
}
enum CameraProjection : int(int num) {
    CAMERA_PERSPECTIVE = 0,         
    CAMERA_ORTHOGRAPHIC = 1,
}

enum NPathLayout: int(int num) {
    NPATCH_NINE_PATCH = 0,        
    NPATCH_THREE_PATCH_VERTICAL = 1,
    NPATCH_THREE_PATCH_HORIZONTAL = 2,
}

def Vector2 = float[<2>];
def Vector3 = float[<3>];
def Vector4 = float[<4>];
def Quaternion = Vector4;

def Color = char[<4>];

def Texture2D = Texture;
def TextureCubemap = Texture;
def RenderTexture2D = RenderTexture;

def Camera = Camera3D;

// TODO: TraceLogCallback // va_list?
def LoadFileDataCallback = fn char*(char *filename, int *dataSize);
def SaveFileDataCallback = fn bool(char *filename, void *data, int dataSize);
def LoadFileTextCallback = fn char*(char *fileName);            
def SaveFileTextCallback = fn bool(char *filename, char *text);

const int RAYLIB_VERSION_PATCH = 0;
const int RAYLIB_VERSION_MAJOR = 5;
const int RAYLIB_VERSION_MINOR = 5;
const char *RAYLIB_VERSION = "5.5-dev";
const DEG2RAD = PI/180.0f;
const float PI = 3.14159265358979323846f;
const float RAD2DEG = 180.0f/PI;
const Color LIGHTRAY = {200, 200, 200, 255};
const Color GRAY = {130, 130, 130, 255};
const Color DARKGRAY= {80, 80, 80, 255};
const Color YELLOW = {253, 249, 0, 255};
const Color GOLD = {255, 203, 0, 255};
const Color ORANGE = {255, 161, 0, 255};
const Color PINK = {255, 109, 194, 255};
const Color RED = {230, 41, 55, 255};
const Color MAROON = {190, 33, 55, 255};
const Color GREEN = {0, 228, 48, 255};
const Color LIME = {0, 158, 47, 255};
const Color DARKGREEN = {0, 117, 44, 255};
const Color SKYBLUE = {102, 191, 255, 255};
const Color BLUE = {0, 121, 241, 255};
const Color DARKBLUE = {0, 82, 172, 255};
const Color PURPLE = {200, 122, 255, 255};
const Color VIOLET = {135, 60, 190, 255};
const Color DARKPURPLE = {112, 31, 126, 255};
const Color BEIGE = {211, 176, 131, 255};
const Color BROWN = {127, 106, 79, 255};
const Color DARKBROWN = {76, 63, 47, 255};
const Color WHITE = {255, 255, 255, 255};
const Color BLACK = {0, 0, 0, 255};
const Color BLANK = {0, 0, 0, 0};
const Color MAGENTA = {255, 0, 255, 255};
const Color RAYWHITE = {245, 245, 245, 255};

const MouseButton MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;
const MouseButton MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;
const MouseButton MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;

const MaterialMapIndex MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
const MaterialMapIndex MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;

const ShaderLocationIndex SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
const ShaderLocationIndex SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;

extern fn void init_window(int width, int height, char *title) @extern("InitWindow");
extern fn void close_window() @extern("CloseWindow");
extern fn bool window_should_close() @extern("WindowShouldClose");
extern fn bool is_window_ready() @extern("IsWindowReady");
extern fn bool is_window_fullscreen() @extern("IsWindowFulLscreen");
extern fn bool is_window_hidden() @extern("IsWindowHidden");
extern fn bool is_window_minimized() @extern("IsWindowMinimized");
extern fn bool is_window_maximized() @extern("IsWindowMaximized");
extern fn bool is_window_focused() @extern("IsWindowFocused");
extern fn bool is_window_resized() @extern("IsWindowResized");
extern fn bool is_window_state(uint flags) @extern("IsWindowState");
extern fn void set_window_state(uint flags) @extern("SetWindowState");
extern fn void clear_window_state(uint flags) @extern("ClearWindowState");
extern fn void toggle_fullscreen() @extern("ToggleFullscreen");           
extern fn void toggle_borderless_windowed() @extern("ToggleBorderlessWindowed");  
extern fn void maximize_window() @extern("MaximizeWindow");           
extern fn void minimize_window() @extern("MinimizeWindow");          
extern fn void restore_window() @extern("RestoreWindow");          
extern fn void set_window_icon(Image image) @extern("SetWindowIcon");                            
extern fn void set_window_icons(Image *images, int count) @extern("SetWindowIcons");             
extern fn void set_window_title(char *title) @extern("SetWindowTitle");                   
extern fn void set_window_position(int x, int y) @extern("SetWindowPosition");                    
extern fn void set_window_monitor(int monitor) @extern("SetWindowMonitor");                     
extern fn void set_window_min_size(int width, int height) @extern("SetWindowMinSize");          
extern fn void set_window_max_size(int width, int height) @extern("SetWindowMaxSize");         
extern fn void set_window_size(int width, int height) @extern("SetWindowSize");
extern fn void set_window_opacity(float opacity) @extern("SetWindowOpacity");                       
extern fn void set_window_focused() @extern("SetWindowFocused");                                
extern fn void *get_window_handle() @extern("GetWindowHandle");                               
extern fn int get_screen_width() @extern("GetScreenWidth");                                 
extern fn int get_screen_height() @extern("GetScreenHeight");                               
extern fn int get_render_width() @extern("GetRenderWidth");                               
extern fn int get_render_height() @extern("GetRenderHeight");                             
extern fn int get_monitor_count() @extern("GetMonitorCount");                            
extern fn int get_current_monitor() @extern("GetCurrentMonitor");                         
extern fn Vector2 get_monitor_position(int monitor) @extern("GetMonitorPosition");            
extern fn int get_monitor_width(int monitor) @extern("GetMonitorWidth");                  
extern fn int get_monitor_height(int monitor) @extern("GetMonitorHeight");                
extern fn int get_monitor_physical_width(int monitor) @extern("GetMonitorPhysicalWidth");        
extern fn int get_monitor_physical_height(int monitor) @extern("GetMonitorPhysicalHeight"); 
extern fn int get_monitor_refresh_rate(int monitor) @extern("GetMonitorRefreshRate");                     
extern fn Vector2 get_window_position() @extern("GetWindowPosition");                           
extern fn Vector2 get_window_scale_dpi() @extern("GetWindowScaleDPI");                          
extern fn char *get_monitor_name(int monitor) @extern("GetMonitorName");                 
extern fn void set_clipboard_text(char *text) @extern("SetClipboardText");                
extern fn char *get_clipboard_text() @extern("GetClipboardText");                    
extern fn void enable_event_waiting() @extern("EnableEventWaiting");                        
extern fn void disable_event_waiting() @extern("DisableEventWaiting");

extern fn void show_cursor() @extern("ShowCursor");                                      
extern fn void hide_cursor() @extern("HideCursor");                                     
extern fn bool is_cursor_hidden() @extern("IsCursorHidden");                                
extern fn void enable_cursor() @extern("EnableCursor");                                 
extern fn void disable_cursor() @extern("DisableCursor");                               
extern fn bool is_cursor_on_screen() @extern("IsCursorOnSreen");

extern fn void clear_background(Color color) @extern("ClearBackground");                          
extern fn void begin_drawing() @extern("BeginDrawing");                                   
extern fn void end_drawing() @extern("EndDrawing");                                    
extern fn void begin_mode_2d(Camera2D camera) @extern("BeginMode2D");                       
extern fn void end_mode_2d() @extern("EndMode2D");                                   
extern fn void begin_mode_3d(Camera3D camera) @extern("BeginMode3D");                     
extern fn void end_mode_3d() @extern("EndMode3D");                                 
extern fn void begin_texture_mode(RenderTexture2D target) @extern("BeginTextureMode");       
extern fn void end_texture_mode() @extern("EndTextureMode");                          
extern fn void begin_shader_mode(Shader shader) @extern("BeginShaderMode");               
extern fn void end_shader_mode() @extern("EndShaderMode");                         
extern fn void begin_blend_mode(int mode) @extern("BeginBlendMode");                   
extern fn void end_blend_mode() @extern("EndBlendMode");                        
extern fn void begin_scissor_mode(int x, int y, int width, int height) @extern("BeginScissorMode");
extern fn void end_scissor_mode() @extern("EndScissorMode");                                  
extern fn void begin_vr_stereo_mode(VrStereoConfig config) @extern("BeginVrStereoMode");           
extern fn void end_vr_stereo_mode() @extern("EndVrStereoMode");   

extern fn VrStereoConfig load_vr_stereo_config(VrDeviceInfo device) @extern("LoadVrStereoConfig");   
extern fn void unload_vr_stereo_config(VrStereoConfig config) @extern("UnloadVrStereoConfig");         


extern fn Shader load_shader(char *vsFileName, char *fsFileName) @extern("LoadShader");
extern fn Shader load_shader_from_meomry(char *vsCode, char *fsCode) @extern("LoadShaderFromMemory");
extern fn bool is_shader_ready(Shader shader) @extern("IsShaderReady");
extern fn int get_shader_location(Shader shader,char *uniformName) @extern("GetShaderLocation");      
extern fn int get_shader_location_attrib(Shader shader, char *attribName) @extern("GetShaderLocationAttrib");
extern fn void set_shader_value(Shader shader, int locIndex, void *value, int uniformType) @extern("SetShaderValue");               
extern fn void set_shader_value_v(Shader shader, int locIndex, void *value, int uniformType, int count) @extern("SetShaderValueV");  
extern fn void set_shader_value_matrix(Shader shader, int locIndex, Matrix mat) @extern("SetShaderValueMatrix");
extern fn void set_shader_value_texture(Shader shader, int locIndex, Texture2D texture) @extern("SetShaderValueTexture");
extern fn void unload_shader(Shader shader) @extern("UnloadShader");

extern fn Ray get_mouse_ray(Vector2 mousePosition, Camera camera) @extern("GetMouseRay");      
extern fn Matrix get_camera_matrix(Camera camera) @extern("GetCameraMatrix");
extern fn Matrix get_camera_matrix_2d(Camera2D camera) @extern("GetCameraMatrix2D");
extern fn Vector2 get_world_to_screen(Vector3 position, Camera camera) @extern("GetWorldToScreen");
extern fn Vector2 get_screen_to_world_2d(Vector2 position, Camera2D camera) @extern("GetScreenToWorld2D"); 
extern fn Vector2 get_world_to_screen_ex(Vector3 position, Camera camera, int width, int height) @extern("GetWorldToScreenEx"); 
extern fn Vector2 get_world_to_screen_2d(Vector2 position, Camera2D camera) @extern("GetWorldToScreen2D");

extern fn void set_target_fps(int fps) @extern("SetTargetFPS");                                
extern fn float get_frame_time() @extern("GetFrameTime");                                 
extern fn double get_time() @extern("GetTime");
extern fn int get_fps() @extern("GetFPS");

extern fn void swap_screen_buffer() @extern("SwapScreenBuffer");                              
extern fn void poll_input_events() @extern("PollInputEvents");                                
extern fn void wait_time(double seconds) @extern("WaitTime");                              

extern fn void set_random_seed(uint seed) @extern("SetRandomSeed");                     
extern fn int get_random_value(int min, int max) @extern("GetRandomValue");                  
extern fn int *load_random_sequence(uint count, int min, int max) @extern("LoadRandomSequence");
extern fn void unload_random_sequence(int *sequence) @extern("UnloadRandomSequence");

extern fn void take_screenshot(char *fileName) @extern("TakeScreenshot");                
extern fn void set_config_flags(uint flags) @extern("SetConfigFlags");                   
extern fn void open_url(char *url) @extern("OpenURL");                              

extern fn void trace_log(int logLevel, char *text, ...) @extern("TraceLog");         
extern fn void set_trace_log_level(int logLevel) @extern("SetTraceLogLevel");               
extern fn void *mem_alloc(uint size) @extern("MemAlloc");                          
extern fn void *mem_realloc(void *ptr, uint size) @extern("MemRealloc");            
extern fn void mem_free(void *ptr) @extern("MemFree");                          

// extern fn void set_trace_log_callback(TraceLogCallback callback) @extern("SetTraceLogCallback"); // TODO: TraceLogCallback macro (124)
extern fn void set_load_file_data_callback(LoadFileDataCallback callback) @extern("SetLoadFileDataCallback"); 
extern fn void set_save_file_data_callback(SaveFileDataCallback callback) @extern("SetSaveFileDataCallback");
extern fn void set_load_file_text_callback(LoadFileTextCallback callback) @extern("SetLoadFileTextCallback");
extern fn void set_save_file_text_callback(SaveFileTextCallback callback) @extern("SetSaveFileTextCallback");

extern fn char *load_file_data(char *fileName, int *dataSize) @extern("LoadFileData");
extern fn void unload_file_data(char *data) @extern("UnloadFileData");                   
extern fn bool save_file_data(char *fileName, void *data, int dataSize) @extern("SaveFileData");
extern fn bool export_data_as_code(char *data, int dataSize, char *fileName) @extern("ExportDataAsCode"); 
extern fn char *load_file_text(char *fileName) @extern("LoadFileText");                 
extern fn void unload_file_text(char *text) @extern("UnloadFileText");                     
extern fn bool save_file_text(char *fileName, char *text) @extern("SaveFileText");        

extern fn bool file_exists(char *fileName) @extern("FileExists");
extern fn bool directory_exists(char *dirPath) @extern("DirectoryExists");
extern fn bool is_file_extension(char *fileName, char *ext) @extern("IsFileExtension");
extern fn int get_file_length(char *fileName) @extern("GetFileLength");
extern fn char *get_file_extension(char *fileName) @extern("GetFileExtension");       
extern fn char *get_file_name(char *filePath) @extern("GetFileName");           
extern fn char *get_filename_without_ext(char *filePath) @extern("GetFilenameWithoutExt");
extern fn char *get_directory_path(char *filePath) @extern("GetDirectoryPath");
extern fn char *get_prev_directory_path(char *dirPath) @extern("GetPrevDirectoryPath");  
extern fn char *get_working_directory() @extern("GetWorkingDirectory");                 
extern fn char *get_application_directory() @extern("GetApplicationDirectory");            
extern fn bool change_directory(char *dir) @extern("ChangeDirectory");               
extern fn bool is_path_file(char *path) @extern("IsPathFile");
extern fn FilePathList load_directory_files(char *dirPath) @extern("LoadDirectoryFiles");
extern fn FilePathList load_directory_files_ex(char *basePath, char *filter, bool scanSubdirs) @extern("LoadDirectoryFilesEx");
extern fn void unload_directory_files(FilePathList files) @extern("UnloadDirectoryFiles");          
extern fn bool is_file_dropped() @extern("IsFileDropped");                              
extern fn FilePathList load_dropped_files() @extern("LoadDroppedFiles");                  
extern fn void unload_dropped_files(FilePathList files) @extern("UnloadDroppedFiles");         
extern fn long get_file_mod_time(char *fileName) @extern("GetFileModTime");          

extern fn char *compress_data(char *data, int dataSize, int *compDataSize) @extern("CompressData");        
extern fn char *decompress_data(char *compData, int compDataSize, int *dataSize) @extern("DecompressData"); 
extern fn char *encode_database_64(char *data, int dataSize, int *outputSize) @extern("EncodeDatabase64");    
extern fn char *decode_database_64(char *data, int *outputSize) @extern("DecodeDatabase64");                 

extern fn AutomationEventList load_automation_event_list(char *fileName) @extern("LoadAutomationEventList");             
extern fn void unload_automation_event_list(AutomationEventList *list) @extern("UnloadAutomationEventList");                      
extern fn bool export_automation_event_list(AutomationEventList list, char *fileName) @extern("ExportAutomationEventList");  
extern fn void set_automation_event_list(AutomationEventList *list) @extern("SetAutomationEventList");                           
extern fn void set_automation_event_base_frame(int frame) @extern("SetAutomationEventBaseFrame");                                   
extern fn void start_automation_event_recording() @extern("StartAutomationEventRecording");                                       
extern fn void stop_automation_event_recording() @extern("StopAutomationEventRecording");                                         
extern fn void play_automation_event(AutomationEvent event) @extern("PlayAutomationEvent");                                  

extern fn bool is_key_pressed(int key) @extern("IsKeyPressed");                      
extern fn bool is_key_pressed_repeat(int key) @extern("IsKeyPressedRepeat");                 
extern fn bool is_key_down(int key) @extern("IsKeyDown");                           
extern fn bool is_key_released(int key) @extern("IsKeyReleased");                        
extern fn bool is_key_up(int key) @extern("IsKeyUp");                               
extern fn int get_key_pressed() @extern("GetKeyPressed");                              
extern fn int get_char_pressed() @extern("GetCharPressed");                              
extern fn void set_exit_key(int key) @extern("SetExitKey");                               

extern fn bool is_gamepad_available(int gamepad) @extern("IsGamepadAvailable");               
extern fn char *get_gamepad_name(int gamepad) @extern("GetGamepadName");             
extern fn bool is_gamepad_button_pressed(int gamepad, int button) @extern("IsGamepadButtonPressed");   
extern fn bool is_gamepad_button_down(int gamepad, int button) @extern("IsGamepadButtonDown");      
extern fn bool is_gamepad_button_released(int gamepad, int button) @extern("IsGamepadButtonReleased");  
extern fn bool is_gamepad_button_up(int gamepad, int button) @extern("IsGamepadButtonUp");        
extern fn int get_gamepad_button_pressed() @extern("GetGamepadButtonPressed");                    
extern fn int get_gamepad_axis_count(int gamepad) @extern("GetGamepadAxisCount");                   
extern fn float get_gamepad_axis_movement(int gamepad, int axis) @extern("GetGamepadAxisMovement");    
extern fn int set_gamepad_mappings(char *mappings) @extern("SetGamepadMappings");           

extern fn bool is_mouse_button_pressed(int button) @extern("IsMouseButtonPressed");                  
extern fn bool is_mouse_button_down(int button) @extern("IsMouseButtonDown");                    
extern fn bool is_mouse_button_released(int button) @extern("IsMouseButtonReleased");               
extern fn bool is_mouse_button_up(int button) @extern("IsMouseButtonUp");                    
extern fn int get_mouse_x() @extern("GetMouseX");                                
extern fn int get_mouse_y() @extern("GetMouseY");                               
extern fn Vector2 get_mouse_position() @extern("GetMousePosition");                   
extern fn Vector2 get_mouse_delta() @extern("GetMouseDelta");                     
extern fn void set_mouse_position(int x, int y) @extern("SetMousePosition");                    
extern fn void set_mouse_offset(int offsetX, int offsetY) @extern("SetMouseOffset");         
extern fn void set_mouse_scale(float scaleX, float scaleY) @extern("SetMouseScale");       
extern fn float get_mouse_wheel_move() @extern("GetMouseWheelMove");                       
extern fn Vector2 get_mouse_wheel_move_v() @extern("GetMouseWheelMoveV");                   
extern fn void set_mouse_cursor(int cursor) @extern("SetMouseCursor");                   

extern fn int get_touch_x() @extern("GetTouchX");                                
extern fn int get_touch_y() @extern("GetTouchY");                                 
extern fn Vector2 get_touch_position(int index) @extern("GetTouchPosition");                  
extern fn int get_touch_point_id(int index) @extern("GetTouchPointId");                        
extern fn int get_touch_point_count() @extern("GetTouchPointCount");                           

extern fn void set_gestures_enabled(uint flags) @extern("SetGesturesEnabled");  
extern fn bool is_gesture_detected(uint gesture) @extern("IsGestureDetected"); 
extern fn int get_gesture_detected() @extern("GetGestureDetected");
extern fn float get_gesture_hold_duration() @extern("GetGestureHoldDuration");           
extern fn Vector2 get_gesture_drag_vector() @extern("GetGestureDragVector");            
extern fn float get_gesture_drag_angle() @extern("GetGestureDragAngle");                
extern fn Vector2 get_gesture_pinch_vector() @extern("GetGesturePinchVector");             
extern fn float get_gesture_pinch_angle() @extern("GetGesturePinchAngle");                 

extern fn void update_camera(Camera *camera, int mode) @extern("UpdateCamera");      
extern fn void update_camera_pro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom) @extern("UpdateCameraPro"); 

extern fn void set_shapes_texture(Texture2D texture, Rectangle source) @extern("SetShapesTexture");       

extern fn void draw_pixel(int posX, int posY, Color color) @extern("DrawPixel");                                           
extern fn void draw_pixel_v(Vector2 position, Color color) @extern("DrawPixelV");                                             
extern fn void draw_line(int startPosX, int startPosY, int endPosX, int endPosY, Color color) @extern("DrawLine");          
extern fn void draw_line_v(Vector2 startPos, Vector2 endPos, Color color) @extern("DrawLineV");                                
extern fn void draw_line_ex(Vector2 startPos, Vector2 endPos, float thick, Color color) @extern("DrawLineEx");                   
extern fn void draw_line_strip(Vector2 *points, int pointCount, Color color) @extern("DrawLineStrip");                               
extern fn void draw_line_bezier(Vector2 startPos, Vector2 endPos, float thick, Color color) @extern("DrawLineBezier");                 
extern fn void draw_circle(int centerX, int centerY, float radius, Color color) @extern("DrawCircle");                             
extern fn void draw_circle_sector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color) @extern("DrawCircleSector");      
extern fn void draw_circle_sector_lines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color) @extern("DrawCircleSectorLines");
extern fn void draw_circle_gradient(int centerX, int centerY, float radius, Color color1, Color color2) @extern("DrawCircleGradient");       
extern fn void draw_circle_v(Vector2 center, float radius, Color color) @extern("DrawCircleV");                                 
extern fn void draw_circle_lines(int centerX, int centerY, float radius, Color color) @extern("DrawCircleLines");                    
extern fn void draw_circle_lines_v(Vector2 center, float radius, Color color) @extern("DrawCirclesLinesV");                              
extern fn void draw_ellipse(int centerX, int centerY, float radiusH, float radiusV, Color color) @extern("DrawEllipse");          
extern fn void draw_ellipse_lines(int centerX, int centerY, float radiusH, float radiusV, Color color) @extern("DrawEllipseLines");      
extern fn void draw_ring(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color); 
extern fn void draw_ring_lines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);    
extern fn void draw_rectangle(int posX, int posY, int width, int height, Color color) @extern("DrawRing");                     
extern fn void draw_rectangle_v(Vector2 position, Vector2 size, Color color) @extern("DrawRectangleV");                               
extern fn void draw_rectangle_rec(Rectangle rec, Color color) @extern("DrawRectangleRec");                                               
extern fn void draw_rectangle_pro(Rectangle rec, Vector2 origin, float rotation, Color color) @extern("DrawRectanglePro");                
extern fn void draw_rectangle_gradient_v(int posX, int posY, int width, int height, Color color1, Color color2) @extern("DrawRectangleGradientV");
extern fn void draw_rectangle_gradient_h(int posX, int posY, int width, int height, Color color1, Color color2) @extern("DrawRectangleGradientH");
extern fn void draw_rectangle_gradient_ex(Rectangle rec, Color col1, Color col2, Color col3, Color col4) @extern("DrawRectangleGradientEx");    
extern fn void draw_rectangle_lines(int posX, int posY, int width, int height, Color color) @extern("DrawRectangleLines");                 
extern fn void draw_rectangle_lines_ex(Rectangle rec, float lineThick, Color color) @extern("DrawRectangleLinesEx");                           
extern fn void draw_rectangle_rounded(Rectangle rec, float roundness, int segments, Color color) @extern("DrawRectangleRounded");              
extern fn void draw_rectangle_rounded_lines(Rectangle rec, float roundness, int segments, float lineThick, Color color) @extern("DrawRectangleRoundedLines"); 
extern fn void draw_triangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color) @extern("DrawTriangle");                           
extern fn void draw_triangle_lines(Vector2 v1, Vector2 v2, Vector2 v3, Color color) @extern("DrawTriangleLines");                       
extern fn void draw_triangle_fan(Vector2 *points, int pointCount, Color color) @extern("DrawTriangleFan");                             
extern fn void draw_triangle_strip(Vector2 *points, int pointCount, Color color) @extern("DrawTriangleStrip");                            
extern fn void draw_poly(Vector2 center, int sides, float radius, float rotation, Color color) @extern("DrawPoly");              
extern fn void draw_poly_lines(Vector2 center, int sides, float radius, float rotation, Color color) @extern("DrawPolyLines");          
extern fn void draw_poly_lines_ex(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color) @extern("DrawPolyLinesEx"); 

extern fn void draw_spline_linear(Vector2 *points, int pointCount, float thick, Color color) @extern("DrawSplineLinear");              
extern fn void draw_spline_basis(Vector2 *points, int pointCount, float thick, Color color) @extern("DrawSplineBasis");                
extern fn void draw_spline_catmull_rom(Vector2 *points, int pointCount, float thick, Color color) @extern("DrawSplineCatmullRom");           
extern fn void draw_spline_bezier_quadratic(Vector2 *points, int pointCount, float thick, Color color) @extern("DrawSplineBezierQuadratic");       
extern fn void draw_spline_bezier_cubic(Vector2 *points, int pointCount, float thick, Color color) @extern("DrawSplineBezierCubic");            
extern fn void draw_spline_segment_linear(Vector2 p1, Vector2 p2, float thick, Color color) @extern("DrawSplineSegmentLinear");                    
extern fn void draw_spline_segment_basis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) @extern("DrawSplineSegmentBasis"); 
extern fn void draw_spline_segment_catmull_rom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) @extern("DrawSplineSegmentCatmullRom"); 
extern fn void draw_spline_segment_bezier_quadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color) @extern("DrawSplineSegmentBezierQuadratic"); 
extern fn void draw_spline_segment_bezier_cubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color) @extern("DrawSplineSegmentBezierCubic"); 

extern fn Vector2 get_spline_point_linear(Vector2 startPos, Vector2 endPos, float t) @extern("GetSplinePointLinear");                           
extern fn Vector2 get_spline_point_basis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t) @extern("GetSplinePointBasis");             
extern fn Vector2 get_spline_point_catmull_rom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t) @extern("GetSplinePointCatmullRom");       
extern fn Vector2 get_spline_point_bezier_quad(Vector2 p1, Vector2 c2, Vector2 p3, float t) @extern("GetSplinePointBezierQuad");                  
extern fn Vector2 get_spline_point_bezier_cubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t) @extern("GetSplinePointBezierCubic");    

extern fn bool check_collision_recs(Rectangle rec1, Rectangle rec2) @extern("CheckCollisionRecs");                                   
extern fn bool check_collision_circles(Vector2 center1, float radius1, Vector2 center2, float radius2) @extern("CheckCollisionCircles"); 
extern fn bool check_collision_circle_rec(Vector2 center, float radius, Rectangle rec) @extern("CheckCollisionCircleRec");                   
extern fn bool check_collision_point_rec(Vector2 point, Rectangle rec) @extern("CheckCollisionPointRec");                                    
extern fn bool check_collision_point_circle(Vector2 point, Vector2 center, float radius) @extern("CheckCollisionPointCircle");                   
extern fn bool check_collision_point_triangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3) @extern("CheckCollisionPointTriangle");            
extern fn bool check_collision_point_poly(Vector2 point, Vector2 *points, int pointCount) @extern("CheckCollisionPointPoly");                    
extern fn bool check_collision_lines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint) @extern("CheckCollisionLines"); 
extern fn bool check_collision_point_line(Vector2 point, Vector2 p1, Vector2 p2, int threshold) @extern("CheckCollisionPointLine");               
extern fn Rectangle get_collision_rec(Rectangle rec1, Rectangle rec2) @extern("GetCollisionRec");                                         

extern fn Image load_image(char *fileName) @extern("LoadImage");                                                             
extern fn Image load_image_raw(char *fileName, int width, int height, int format, int headerSize) @extern("LoadImageRaw");      
extern fn Image load_image_svg(char *fileNameOrString, int width, int height) @extern("LoadImageSvg");                         
extern fn Image load_image_anim(char *fileName, int *frames) @extern("LoadImageAnim");                                         
extern fn Image load_image_from_memory(char *fileType, char *fileData, int dataSize) @extern("LoadImageFromMemory");      
extern fn Image load_image_from_texture(Texture2D texture) @extern("LoadImageFromTexture");                                                     
extern fn Image load_image_from_screen() @extern("LoadImageFromScreen");                                                                   
extern fn bool is_image_ready(Image image) @extern("IsImageReady");                                                               
extern fn void unload_image(Image image) @extern("UnloadImage");                                                               
extern fn bool export_image(Image image, char *fileName) @extern("ExportImage");                                              
extern fn char *export_image_to_memory(Image image, char *fileType, int *fileSize) @extern("ExportImageToMemory");            
extern fn bool export_image_as_code(Image image, char *fileName) @extern("ExportImageAsCode");                                      

extern fn Image gen_image_color(int width, int height, Color color) @extern("GenImageColor");                                       
extern fn Image gen_image_gradient_linear(int width, int height, int direction, Color start, Color end) @extern("GenImageGradientLinear");    
extern fn Image gen_image_gradient_radial(int width, int height, float density, Color inner, Color outer) @extern("GenImageGradientRadial");   
extern fn Image gen_image_gradient_square(int width, int height, float density, Color inner, Color outer) @extern("GenImageGradientSquare");    
extern fn Image gen_image_checked(int width, int height, int checksX, int checksY, Color col1, Color col2) @extern("GenImageChecked");    
extern fn Image gen_image_white_noise(int width, int height, float factor) @extern("GenImageWhiteNoise");                               
extern fn Image gen_image_perlin_noise(int width, int height, int offsetX, int offsetY, float scale) @extern("GenImagePerlinNoise");    
extern fn Image gen_image_cellular(int width, int height, int tileSize) @extern("GenImageCellular");                                
extern fn Image gen_image_text(int width, int height, char *text) @extern("GenImageText");                                     
