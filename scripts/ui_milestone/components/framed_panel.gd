extends PanelContainer
class_name UIFramedPanel

@export var title: String = "PANEL" : set = set_title

@onready var _title_label: Label = $Margin/VBox/TitleLabel

func _ready() -> void:
	_apply_style()
	set_title(title)

func set_title(value: String) -> void:
	title = value
	if is_node_ready():
		_title_label.text = value

func content_root() -> VBoxContainer:
	return $Margin/VBox/Content

func _apply_style() -> void:
	var panel_style := StyleBoxFlat.new()
	panel_style.bg_color = Color("#041f57")
	panel_style.border_color = Color("#2aa2ff")
	panel_style.set_border_width_all(2)
	panel_style.set_corner_radius_all(8)
	panel_style.shadow_color = Color("#000a2f")
	panel_style.shadow_size = 4
	theme_override_styles.panel = panel_style
