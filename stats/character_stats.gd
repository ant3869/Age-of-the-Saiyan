extends Resource
class_name CharacterStats

@export_category("Character")
@export var portrait : Texture = null
@export var name = ""
@export var rank: Ranks = Ranks.NOVICE

@export_category("Attributes")
@export var intelligence = 6
@export var strength = 12
@export var stamina = 12
@export var dexterity = 10
@export var speed = 10
@export var wisdom = 8
@export var charisma = 5

@export_category("Pools")
@export var hp = 0
@export var lp = 0
@export var ki = 0
@export var sp = 0
@export var xp = 0

var power_level = 0 : get = get_power_level

enum Ranks {
	NOVICE,
	VETERAN,
	ELITE
}

func get_power_level()->int:
	return ((hp + ki) * (speed+strength+dexterity)) * 500

func get_base_hp()->int:
	return ((stamina * 3) + stamina)

func get_base_ki()->int:
	return ((wisdom * 3) + wisdom)

func get_base_sp()->int:
	return ((stamina * 2) + (stamina / 3))
