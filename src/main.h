#pragma once

#define GMOD_ALLOW_DEPRECATED

#if defined(_WIN32) || defined(WIN32)

#include <process.h>
#define GETPID _getpid

#else

#include <unistd.h>
#define GETPID getpid

#endif

#include <condition_variable>

#include "Lua/Interface.h"