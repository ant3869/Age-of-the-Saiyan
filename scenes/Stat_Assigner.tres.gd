@tool
extends HBoxContainer

@export var stat_name = "" : set = set_stat_name

func set_stat_name(p_set):
	stat_name = p_set
	$StatName.text = p_set

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
