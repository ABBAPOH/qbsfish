#ifndef FISHLIB_GLOBAL_H
#define FISHLIB_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(FISH_STATIC_LIBRARY)
#  define FISHLIB_EXPORT
#else
#  if defined(FISH_LIBRARY)
#    define FISHLIB_EXPORT Q_DECL_EXPORT
#  else
#    define FISHLIB_EXPORT Q_DECL_IMPORT
#  endif
#endif

#endif // FISHLIB_GLOBAL_H
