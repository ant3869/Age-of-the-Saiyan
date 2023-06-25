extends Control

@onready var pointslabel = $Margin.get_node("HBoxContainer/VBoxContainer/HBoxContainer/MainStats/PointsContainer/Label")
@onready var pointsvalue = $Margin.get_node("HBoxContainer/VBoxContainer/HBoxContainer/MainStats/PointsContainer/Points")

var availablepoint = 7

func _ready():
	pointsvalue.set_text(str(availablepoint))
	if availablepoint == 0:
		pass
	else:
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
