extends Resource
class_name SquadData

@export var squad_name: String = "Squadron"
@export var members: Array[FighterData] = []
@export var bonuses := {
	"Attack": 0,
	"Defense": 0,
	"Experience": 0,
}

func total_power_level() -> int:
	var total := 0
	for member in members:
		total += member.display_power()
	return total
