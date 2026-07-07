extends PanelContainer
class_name UIStatCard

@onready var _name_label: Label = $Margin/VBox/Header/Name
@onready var _level_label: Label = $Margin/VBox/Header/Level
@onready var _portrait: TextureRect = $Margin/VBox/Portrait
@onready var _hp_bar: UIStatusBar = $Margin/VBox/HP
@onready var _ki_bar: UIStatusBar = $Margin/VBox/KI
@onready var _stamina_bar: UIStatusBar = $Margin/VBox/Stamina

func _ready() -> void:
	var panel_style := StyleBoxFlat.new()
	panel_style.bg_color = Color("#041f57")
	panel_style.border_color = Color("#2aa2ff")
	panel_style.set_border_width_all(2)
	panel_style.set_corner_radius_all(8)
	theme_override_styles.panel = panel_style
	_hp_bar.set_stat_name("HP")
	_hp_bar.set_bar_color(Color("#2aff5b"))
	_ki_bar.set_stat_name("KI")
	_ki_bar.set_bar_color(Color("#2ad8ff"))
	_stamina_bar.set_stat_name("STAMINA")
	_stamina_bar.set_bar_color(Color("#ffd833"))

func set_fighter_data(fighter: FighterData) -> void:
	_name_label.text = fighter.fighter_name
	_level_label.text = "LV %d" % fighter.level
	_hp_bar.set_values(fighter.hp, fighter.max_hp)
	_ki_bar.set_values(fighter.ki, fighter.max_ki)
	_stamina_bar.set_values(fighter.stamina, fighter.max_stamina)
	if fighter.portrait != null:
		_portrait.texture = fighter.portrait
	else:
		_portrait.modulate = Color("#3d6db5")
