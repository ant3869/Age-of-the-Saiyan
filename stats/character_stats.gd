extends Resource
class_name CharacterStats

@export_category("Character")
@export var portrait : Texture = null
@export var name = ""
@export var rank: Ranks = Ranks.NOVICE

@export_category("Attributes")
@export var strength = 0
@export var dex = 0
@export var ine = 0
@export var spd = 0
@export var sta = 0

@export_category("Pools")
@export var hp = 0
@export var ki = 0
@export var xp = 0

var power_level = 0 : get = get_power_level

enum Ranks {
	NOVICE,
	VETERAN,
	ELITE
}

func get_power_level()->int:
	return (hp + ki) / (spd+strength+dex)
