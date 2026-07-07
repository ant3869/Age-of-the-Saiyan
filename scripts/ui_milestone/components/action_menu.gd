extends PanelContainer
class_name UIActionMenu

signal action_selected(action_name: String)

@export var menu_title := "COMMANDS"

@onready var _title: Label = $Margin/VBox/Title
@onready var _buttons: VBoxContainer = $Margin/VBox/Buttons

func _ready() -> void:
	var panel_style := StyleBoxFlat.new()
	panel_style.bg_color = Color("#041f57")
	panel_style.border_color = Color("#2aa2ff")
	panel_style.set_border_width_all(2)
	panel_style.set_corner_radius_all(8)
	theme_override_styles.panel = panel_style
	set_menu_title(menu_title)

func set_menu_title(value: String) -> void:
	menu_title = value
	if is_node_ready():
		_title.text = menu_title

func set_actions(actions: Array[String]) -> void:
	for child in _buttons.get_children():
		child.queue_free()
	for action_name in actions:
		var button := Button.new()
		button.text = action_name
		button.custom_minimum_size = Vector2(0, 34)
		button.pressed.connect(func() -> void:
			action_selected.emit(action_name)
		)
		_buttons.add_child(button)
