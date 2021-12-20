#include "main.h"

int lua_GetPID(lua_State* state)
{
	LUA->PushNumber(GETPID());

	return 1;
}

GMOD_MODULE_OPEN()
{
	LUA->PushSpecial(GarrysMod::Lua::SPECIAL_GLOB);
	LUA->GetField(-1, "system");

	LUA->PushCFunction(lua_GetPID);
	LUA->SetField(-2, "GetPID");
	LUA->Pop();

	return 0;
}

// Everything should be gc'd now, so we only really have to worry about killing mysql here and freeing our refs
GMOD_MODULE_CLOSE()
{
	return 0;
}