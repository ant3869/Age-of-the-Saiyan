extends PanelContainer
class_name UICharacterRow

@onready var _portrait: TextureRect = $Margin/Columns/Portrait
@onready var _name_label: Label = $Margin/Columns/Name
@onready var _level_label: Label = $Margin/Columns/Level
@onready var _hp_label: Label = $Margin/Columns/HP
@onready var _ki_label: Label = $Margin/Columns/KI
@onready var _role_label: Label = $Margin/Columns/Role
@onready var _status_label: Label = $Margin/Columns/Status

func _ready() -> void:
	var panel_style := StyleBoxFlat.new()
	panel_style.bg_color = Color("#072a6c")
	panel_style.border_color = Color("#2aa2ff")
	panel_style.set_border_width_all(1)
	panel_style.set_corner_radius_all(6)
	theme_override_styles.panel = panel_style

func set_fighter_data(fighter: FighterData) -> void:
	_name_label.text = fighter.fighter_name
	_level_label.text = str(fighter.level)
	_hp_label.text = str(fighter.hp)
	_ki_label.text = str(fighter.ki)
	_role_label.text = fighter.role
	_status_label.text = fighter.status
	_status_label.modulate = Color("#33ff66") if fighter.status == "ACTIVE" else Color("#ff4141")
	if fighter.portrait != null:
		_portrait.texture = fighter.portrait
	else:
		_portrait.modulate = Color("#4d84d9")
