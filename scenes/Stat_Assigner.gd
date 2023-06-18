@tool
extends HBoxContainer

@export var stat_name = "" : set = set_stat_name
@export var stat_value = 0 : set = set_stat_value

func set_stat_name(p_set):
	stat_name = p_set
	if is_node_ready():
		_update_stat_value_string()

func _update_stat_value_string():
	$StatName.text = stat_name

func set_stat_value(v_set):
	stat_value = v_set
	if is_node_ready():
		_update_stat_string()

func _update_stat_string():
	$StatValue.text = str(stat_value)

# Called when the node enters the scene tree for the first time.
func _ready():
	$DecreaseButton.connect("pressed", DecreaseButton_pressed)
	$IncreaseButton.connect("pressed", IncreaseButton_pressed)
	_update_stat_value_string()
	_update_stat_string()

func DecreaseButton_pressed():
	stat_value -= 1

func IncreaseButton_pressed():
	stat_value += 1
