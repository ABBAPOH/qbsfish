#ifndef FISHLIB_GLOBAL_H
#define FISHLIB_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(FISHLIB_LIBRARY)
#  define FISHLIB_EXPORT Q_DECL_EXPORT
#else
#  define FISHLIB_EXPORT Q_DECL_IMPORT
#endif

#endif // FISHLIB_GLOBAL_H
