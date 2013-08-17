waitUntil {!isNull player};

_unit = _this select 1;

removeAllItems _unit;
removeVest _unit;
removeUniform _unit; 
removeAllWeapons _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeAllAssignedItems _unit;
removeallcontainers _unit;

_unit addUniform "MILSIM_BlackTGBDU";
_unit addvest "GOLDTEAM_BLACKVEST";
_unit addHeadgear "GoldTeam_BlackHelmet"; 
_unit addbackpack "GoldTeam_BlackBP_EOD_base";

_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addWeapon "AR_GoldTeam";
_unit addWeapon "hgun_P07_F";
_unit addPrimaryWeaponItem "PEQ15_A3_Top";
_unit addItem "Muzzle_MK18_L";
_unit addHandgunItem "muzzle_snds_L";

_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "30rnd_556x45_Stanag";
_unit addmagazine "16Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";
_unit addmagazine "16Rnd_9x21_Mag";

_unit addWeapon "Binocular";

_unit addmagazine "SatchelCharge_Remote_Mag";
_unit addmagazine "SatchelCharge_Remote_Mag";
_unit addmagazine "DemoCharge_Remote_Mag";
_unit addmagazine "DemoCharge_Remote_Mag";
_unit addmagazine "HandGrenade";

_unit addmagazine "HandGrenade";
_unit addmagazine "HandGrenade";
_unit addmagazine "HandGrenade";
_unit addmagazine "HandGrenade";
_unit addmagazine "HandGrenade";
_unit addmagazine "SmokeShell";
_unit addmagazine "SmokeShell";
_unit addmagazine "SmokeShell";

_unit additem "NVGoggles";
_unit assignItem "NVGoggles";
_unit additem "ItemMap";
_unit assignItem "ItemMap";
_unit additem "ItemGPS";
_unit assignItem "ItemGPS";
_unit additem "ItemCompass";
_unit assignItem "ItemCompass";
_unit additem "ItemWatch";
_unit assignItem "ItemWatch";
_unit addItem "ACRE_PRC343_ID_13";
_unit assignItem "ACRE_PRC343_ID_13";

_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";
_unit addItem "FirstAidKit";

_unit addGoggles "G_Combat";
_unit addItem "ToolKit";
_unit addItem "MineDetector";
_unit addGoggles "G_Tactical_Clear";

if(true) exitWith{};