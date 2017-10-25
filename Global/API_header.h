#ifdef __WIN32

#define LoadLib(path) LoadLibrary(path)
#define LoadFunc(lib_handle,function) GetProcAddress(lib_handle, function)
#define UnloadLib(lib_handle) FreeLibrary(lib_handle)

#define API_HIDE 
#define API_SHOW __attribute__ ((dllexport))

#define API_HIDE_var 
#define API_SHOW_var __attribute__ ((dllexport))

#else

#define LoadLib(path) dlopen(path,RTLD_LAZY)
#define LoadFunc(lib_handle,function) dlsym(lib_handle, function)
#define UnloadLib(lib_handle) FreeLibrary(lib_handle)

#define API_HIDE __attribute__ ((visibility ("hidden")))
#define API_SHOW __attribute__ ((visibility ("default")))

#define API_HIDE_var
#define API_SHOW_var

#endif