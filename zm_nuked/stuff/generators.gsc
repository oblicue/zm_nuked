#include maps\mp\_utility;
#include maps\mp\_visionset_mgr;
#include maps\mp\_music;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\gametypes_zm\_gv_actions;
#include maps\mp\gametypes_zm\_damagefeedback;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_audio;
#include maps\mp\animscripts\zm_combat;
#include maps\mp\animscripts\zm_utility;
#include maps\mp\animscripts\utility;
#include maps\mp\animscripts\shared;
#include maps\mp\zombies\_zm_game_module;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\zombies\_zm_sidequests;
#include maps\mp\zombies\_zm_tombstone;
#include maps\mp\zombies\_zm_chugabud;
#include maps\mp\zombies\_zm_perk_electric_cherry;
#include maps\mp\zm_nuked_perks;

gen_init() {
    pos = (-640.201, 241.014, -58.2143);
    trigger = spawn("trigger_radius", pos, 1, 30, 30);
    
    trigger setvisibletoall();

    wait(1);

    for(;;)
    {   
        trigger waittill("trigger", player);
        printf("collision");
        if (player meleebuttonpressed() || player AttackButtonPressed()) {
            setdvar("power", "1");
            level thread maps\mp\zm_nuked_perks::turn_perks_on();
            printf("UseButton");
            iprintln("Power enabled!");
            self notify("collect_item");
            self PlaySound("zmb_poweron");
            trigger delete();
        }
        wait 0.05;
    }
}

SpawnHint( origin, width, height, cursorhint, string )
{
    hint = spawn( "trigger_radius", origin, 1, width, height );
    hint setcursorhint( cursorhint, hint );
    hint sethintstring( string );
    hint setvisibletoall();
    wait 0.05;
    hint delete();
}