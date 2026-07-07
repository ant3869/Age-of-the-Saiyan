extends HBoxContainer
class_name UIStatusBar

@export var stat_name := "HP"
@export var current_value := 100
@export var max_value := 100
@export var bar_color := Color("#3bff6e")

@onready var _name_label: Label = $Name
@onready var _bar: ProgressBar = $Bar
@onready var _value_label: Label = $Value

func _ready() -> void:
	set_stat_name(stat_name)
	_apply_bar_style()
	set_values(current_value, max_value)

func set_stat_name(value: String) -> void:
	stat_name = value
	if is_node_ready():
		_name_label.text = stat_name

func set_values(current: int, max_stat: int) -> void:
	current_value = current
	max_value = max(1, max_stat)
	_bar.max_value = max_value
	_bar.value = clamp(current_value, 0, max_value)
	_value_label.text = "%d / %d" % [current_value, max_value]

func set_bar_color(color: Color) -> void:
	bar_color = color
	if is_node_ready():
		_apply_bar_style()

func _apply_bar_style() -> void:
	var bg := StyleBoxFlat.new()
	bg.bg_color = Color("#061633")
	bg.set_corner_radius_all(4)
	var fill := StyleBoxFlat.new()
	fill.bg_color = bar_color
	fill.set_corner_radius_all(4)
	_bar.add_theme_stylebox_override("background", bg)
	_bar.add_theme_stylebox_override("fill", fill)
