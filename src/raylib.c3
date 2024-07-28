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
