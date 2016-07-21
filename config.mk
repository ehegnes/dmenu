# dmenu version
VERSION = 4.6

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/include/X11
X11LIB = /usr/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
# OpenBSD (uncomment)
#FREETYPEINC = ${X11INC}/freetype2

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS}

# optimizations
LTOFLAGS      = -flto=jobserver -fuse-linker-plugin -fno-trapping-math -fno-signed-zeros
GRAPHITEFLAGS = -ftree-vectorize -floop-interchange -floop-strip-mine -floop-block
RELEASEFLAGS  = -march=native -mtune=native -Ofast -pipe -g0 -funroll-loops

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS} ${LTOFLAGS} ${GRAPHITEFLAGS} ${RELEASEFLAGS}
LDFLAGS  = -s ${LIBS}

# use gold linker
LDFLAGS += -fuse-ld=gold

# compiler and linker
CC = cc
