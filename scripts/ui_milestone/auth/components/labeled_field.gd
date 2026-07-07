extends VBoxContainer
class_name UILabeledField

@export var label_text: String = "FIELD" : set = set_label_text
@export var placeholder: String = "" : set = set_placeholder
@export var secret: bool = false : set = set_secret

@onready var _label: Label = $FieldLabel
@onready var _input: LineEdit = $Input

func _ready() -> void:
	_apply_styles()
	set_label_text(label_text)
	set_placeholder(placeholder)
	set_secret(secret)

func set_label_text(value: String) -> void:
	label_text = value
	if is_node_ready():
		_label.text = value

func set_placeholder(value: String) -> void:
	placeholder = value
	if is_node_ready():
		_input.placeholder_text = value

func set_secret(value: bool) -> void:
	secret = value
	if is_node_ready():
		_input.secret = value

func get_value() -> String:
	return _input.text

func clear() -> void:
	_input.clear()

func _apply_styles() -> void:
	_label.add_theme_color_override("font_color", Color("#38c8ff"))
	_label.add_theme_font_size_override("font_size", 13)

	var normal := StyleBoxFlat.new()
	normal.bg_color = Color("#02153a")
	normal.border_color = Color("#1a5aaa")
	normal.set_border_width_all(1)
	normal.set_corner_radius_all(4)
	normal.content_margin_left = 8.0
	normal.content_margin_top = 6.0
	normal.content_margin_right = 8.0
	normal.content_margin_bottom = 6.0
	_input.add_theme_stylebox_override("normal", normal)

	var focus := StyleBoxFlat.new()
	focus.bg_color = Color("#031e54")
	focus.border_color = Color("#38aaff")
	focus.set_border_width_all(2)
	focus.set_corner_radius_all(4)
	focus.content_margin_left = 8.0
	focus.content_margin_top = 6.0
	focus.content_margin_right = 8.0
	focus.content_margin_bottom = 6.0
	_input.add_theme_stylebox_override("focus", focus)

	_input.add_theme_color_override("font_color", Color("#c8e8ff"))
	_input.add_theme_color_override("font_placeholder_color", Color("#3a6a99"))
	_input.add_theme_font_size_override("font_size", 15)
