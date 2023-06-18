@tool
extends MarginContainer

@export var stat_name = "STAT" : set = set_stat_name
@export var stat_value = 0 : set = set_stat_value

func set_stat_name(p_set):
	stat_name = p_set
	if is_node_ready():
		_update_stat_name_string()

func _update_stat_value_string():
	$StatBackground.get_node("Stats/Name").text = stat_name

func set_stat_value(v_set):
	stat_value = v_set
	if is_node_ready():
		_update_stat_value_string()

func _update_stat_name_string():
	$StatBackground.get_node("Stats/Value").text = str(stat_value)

# Called when the node enters the scene tree for the first time.
func _ready():
	$StatBackground.get_node("MinButton").connect("pressed", MinButton_pressed)
	$StatBackground.get_node("PlusButton").connect("pressed", PlusButton_pressed)
	_update_stat_name_string()
	_update_stat_value_string()

func MinButton_pressed():
	stat_value -= 1
	_update_stat_value_string()

func PlusButton_pressed():
	stat_value += 1
	_update_stat_value_string()
