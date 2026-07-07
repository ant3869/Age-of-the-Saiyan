extends Control
class_name SquadronBattleMainScreen

@onready var _squadron_screen: SquadronScreen = $Margin/RootLayout/SquadronScreen
@onready var _battle_screen: BattleScreen = $Margin/RootLayout/BattleScreen

func _ready() -> void:
	_apply_backdrop()
	var squad := MockData.create_squad()
	var player := squad.members[0]
	var enemy := MockData.create_enemy()
	_squadron_screen.populate_squad(squad)
	_squadron_screen.squad_action_requested.connect(_on_squad_action)
	_battle_screen.setup_battle(player, enemy, MockData.player_actions(), MockData.enemy_actions())

func _on_squad_action(action_name: String) -> void:
	_battle_screen.append_log("[color=#79ffad]%s selected from squad panel.[/color]" % action_name)

func _apply_backdrop() -> void:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#010a20")
	style.draw_center = true
	$Backdrop.add_theme_stylebox_override("panel", style)
