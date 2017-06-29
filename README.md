# Collisionhook VoiDED

https://forums.alliedmods.net/showthread.php?t=197815

This extension provides a straightforward and easy way to hook and modify collision rules between entities.

You might say "but sdkhooks provides this functionality already!", and you would be partly right. However, I wasn't happy with how sdkhooks ShouldCollide works, and here's why:

If you're familiar with sdkhooks, this code won't be new:


    // somewhere in your code
    SDKHook( someEntity, SDKHook_ShouldCollide, ShouldCollide );

    public bool:ShouldCollide( entity, collisiongroup, contentsmask, bool:result )
    {
        // modify collision rules
    }

As you can see, the hook doesn't provide much information about exactly which entities are colliding; only the collision group and contents mask of the other entity are given to the plugin developer.

To solve this limitation, I wrote CollisionHook.

CollisionHook provides 2 forwards to plugins, both of which can modify the collision rules of certain types of collisions.

PHP Code:
forward Action:CH_ShouldCollide( ent1, ent2, &bool:result ); 
CH_ShouldCollide is called when vphysics is determining whether two vphysics objects (and their associated entities) should collide. Examples of these kinds of collisions include projectiles colliding with the world entity.

PHP Code:
forward Action:CH_PassFilter( ent1, ent2, &bool:result ); 
CH_PassFilter is called when the game is performing a ray/hull trace and is making use of an entity filter. Examples of these kinds of collisions include player-player collisions.

To modify the behavior of the collision check, simply set result to true if you wish for the entities to collide; otherwise false, and return Plugin_Handled or Plugin_Stop in the forward. If you want the game to use default collision rules, simply return Plugin_Continue in the forward.


The benefits of both of these forwards is that you can strictly control which entities can collide, instead of just a specific type of entity.

Installation

    Grab the latest release from here.
    Drag & Drop.


Source
The source code is available here.


Limitations / Known Issues / Notes

    Some collisions are not handled by this extension, those include collisions that are checked with traces that don't use an entity filter. Many of these can be handled by sdkhooks' Touch hook.
    Modifying collisions that are also performed on the client will lead to prediction errors. This is no different from other server-only methods of overriding collisions.
    This extension should work for any OB-based mod (TF2 CS:S, DoD:S), but it's only been tested on TF2.


Thanks

    AzuiSleet, for suggesting PassServerEntityFilter for trace based collisions.
    psychonic, for providing the linux build, makefile, and generally being the most helpful person on the planet.
