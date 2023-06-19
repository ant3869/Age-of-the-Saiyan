@tool
extends MarginContainer

@export var stat_name = "STAT" : set = set_stat_name
@export var stat_value = 0 : set = set_stat_value
@onready var minbutton = $StatBackground.get_node("MinButton")
@onready var plusbutton = $StatBackground.get_node("PlusButton")
@onready var namelabel = $StatBackground.get_node("Stats/Name")
@onready var valuelabel = $StatBackground.get_node("Stats/Value")
@onready var mintimer : Timer = minbutton.get_node("minTimer")
@onready var plustimer : Timer = plusbutton.get_node("plusTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	plusbutton.connect("button_down", _on_plusbutton_button_down)
	plusbutton.connect("button_up", _on_plusbutton_released)
	minbutton.connect("button_down", _on_minbutton_button_down)
	minbutton.connect("button_up", _on_minbutton_released)
	_update_stat_name_string()
	_update_stat_value_string()

func _on_minheld_timer_timeout():
	decrease_value()

func _on_plusheld_timer_timeout():
	increase_value()

func _on_minbutton_released():
	mintimer.stop()

func _on_plusbutton_released():
	plustimer.stop()

func _on_minbutton_button_down():
	decrease_value()
	mintimer.start()

func _on_plusbutton_button_down():
	increase_value()
	plustimer.start()

func set_stat_name(p_set):
	stat_name = p_set
	if is_node_ready():
		_update_stat_name_string()

func set_stat_value(v_set):
	stat_value = v_set
	if is_node_ready():
		_update_stat_value_string()

func _update_stat_name_string():
	namelabel.text = stat_name

func _update_stat_value_string():
	valuelabel.text = str(stat_value)

func increase_value():
	stat_value += 1
	_update_stat_value_string()

func decrease_value():
	stat_value -= 1
	_update_stat_value_string()
