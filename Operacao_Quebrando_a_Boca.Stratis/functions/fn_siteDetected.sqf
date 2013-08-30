//Params
private "_logic";
_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Validate logic object
if (isNull _logic) exitWith {
	"Logic object must not be null" call BIS_fnc_error;
};

//Site related variables
private ["_id", "_statement", "_center"];
_id 		= _logic getVariable "BIS_id";
_statement 	= _logic getVariable "BIS_detectedStatement";
_center 	= _logic getVariable "BIS_center";

//Flag
_logic setVariable ["BIS_detected", true];

//Execute statement
_logic call _statement;

//Alarm sound
if (_alarm) then {
	[_logic] execVM "scripts\alarm.sqf";
};

//Fire flare
[_center, position player] call BIS_fnc_sn_flare;

//All enemy sites, we need a new array
private "_sites";
_sites = [];

//Copy&paste elements from main list
{ _sites set [count _sites, _x]; } forEach BIS_sites;

//Remove current site from list
_sites = _sites - [_logic];

//Valid sites
private "_validSites";
_validSites = [];

//All the enemy sites that have not detected and been cleared yet
{
	//Site has been cleared?
	if (isNil { _x getvariable "BIS_detected" } && isNil { _x getvariable "BIS_cleared" }) then {
		_validSites set [count _validSites, _x];
	};
} forEach _sites;

//Make sure we have sites left
if (count _validSites > 0) then {
	//Sort by nearest site
	private "_sortByNearest";
	_sortByNearest = [_validSites, [], { _logic distance _x }, "ASCEND"] call BIS_fnc_sortBy;
	
	//The nearest enemy site
	private "_nearestSite";
	_nearestSite = _sortByNearest select 0;
	
	//Make sure player is no where near the nearest site
	if (player distance _nearestSite > 150) then {
		//Spawn enemy group that will investigate the current site
		private "_group";
		_group = [position _nearestSite, EAST, configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry"] call BIS_fnc_spawnGroup;
		
		//Init group
		[_group] call BIS_fnc_sn_initGroup;
		
		//Send the enemy group to the site where player has been detected
		private "_wp";
		_wp = _group addWaypoint [position _logic, 50];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointBehaviour "AWARE";
		
		//Log
		[
			"Enemy group sent from %2 to investigate site %1",
			_logic,
			_nearestSite
		] call BIS_fnc_logFormat;
	};
};

//Log
[
	"%1 as detected player",
	_id
] call BIS_fnc_logFormat;

//Return value
true;
