#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <collisionhook>

public Action CH_ShouldCollide(int ent1, int ent2, bool &result)
{
	PrintToChatAll("CH_ShouldCollide: ent1: %d, ent2: %d", ent1, ent2);
	
	return Plugin_Continue;
}

public Action CH_PassFilter(int ent1, int ent2, bool &result)
{
	PrintToChatAll("CH_PassFilter: ent1: %d, ent2: %d", ent1, ent2);
	
	return Plugin_Continue;
}
