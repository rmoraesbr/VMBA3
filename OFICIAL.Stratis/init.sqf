if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

//PARAMS
PARAMEDITMODE = false;
PARAMSHOWINTRO = false;
// Init Groo Framework Scripts
call compile preprocessFileLineNumbers "groo\groo_init.sqf";
[format["INFO: Starting %1 version %2 init Script",_missionName,_missionVersion],"green"] spawn groo_fnc_consoleMSG;

if (PARAMEDITMODE) then {
	player allowDamage false; 
	sleep 2;
	onMapSingleClick "player setpos _pos";
	hint 'left click on the map to teleport, you are in ghost mode';
	// Not needed for convoy scripts
	[]execVM "NORRN_cam\start_cam.sqf";
};

// MILSIM LoadOut Script
player addAction ["<t color='#0000FF'>" + "MILSIM LoadOut Menu" + "</t>","MILSIM\dialog\LoadOutMenu.sqf",[],10,false,false,"","_this distance MILSIMBox < 20"];

// Group Maneagement Script
[player] execVM "scripts\groupsMenu\initGroups.sqf";

//Init UPSMON scritp (must be run on all clients)
call compile preprocessFile "scripts\UPSMON\!R\markerAlpha.sqf";
call compile preprocessFileLineNumbers "scripts\fhqtt.sqf";
call compile preprocessFileLineNumbers "scripts\functions\GrooInit.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	
call compile preprocessFileLineNumbers "=BTC=_Logistic\=BTC=_logistic_Init.sqf";
call compile preprocessFile "=BTC=_revive\=BTC=_revive_init.sqf";

//Ocupation
#include "mission\occupation.hpp";
// DEBUG CONSOLE
if PARAMCONSOLE then {
	if isServer then {
		//define macros
		#define KK_conred(MSG) "debug_console" callExtension (MSG + "#1000")
		#define KK_congreen(MSG) "debug_console" callExtension (MSG + "#0100")
		#define KK_conblue(MSG) "debug_console" callExtension (MSG + "#0010")
		#define KK_conblue(MSG) "debug_console" callExtension (MSG + "#0110")
	};
};

//Finish world initialization before mission is launched. 
finishMissionInit;

KK_congreen("Operation Socrates Mission Starting");





