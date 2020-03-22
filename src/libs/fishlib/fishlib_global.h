#ifndef FISHLIB_GLOBAL_H
#define FISHLIB_GLOBAL_H

#if defined(_WIN32) || defined(WIN32)
#    define FISH_DECL_EXPORT __declspec(dllexport)
#    define FISH_DECL_IMPORT __declspec(dllimport)
#else
#    define FISH_DECL_EXPORT __attribute__((visibility("default")))
#    define FISH_DECL_IMPORT __attribute__((visibility("default")))
#  endif

#if defined(FISH_STATIC_LIBRARY)
#  define FISHLIB_EXPORT
#else
#  if defined(FISH_LIBRARY)
#    define FISHLIB_EXPORT FISH_DECL_EXPORT
#  else
#    define FISHLIB_EXPORT FISH_DECL_IMPORT
#  endif
#endif

#endif // FISHLIB_GLOBAL_H
