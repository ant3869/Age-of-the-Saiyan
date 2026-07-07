extends Resource
class_name FighterData

@export var fighter_name: String = ""
@export var level: int = 1
@export var role: String = ""
@export var status: String = "ACTIVE"
@export var hp: int = 100
@export var max_hp: int = 100
@export var ki: int = 50
@export var max_ki: int = 50
@export var stamina: int = 40
@export var max_stamina: int = 40
@export var portrait: Texture2D

func display_power() -> int:
	return (level * 100) + hp + ki + stamina
