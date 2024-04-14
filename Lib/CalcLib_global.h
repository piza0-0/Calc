#ifndef CALCLIB_GLOBAL_H
#define CALCLIB_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(CALCLIB_LIBRARY)
#  define CALCLIB_EXPORT Q_DECL_EXPORT
#else
#  define CALCLIB_EXPORT Q_DECL_IMPORT
#endif

#endif // CALCLIB_GLOBAL_H
