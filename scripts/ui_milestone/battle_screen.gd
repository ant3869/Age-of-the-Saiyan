extends VBoxContainer
class_name BattleScreen

@onready var _frame: UIFramedPanel = $BattleFrame
@onready var _title_label: Label = $BattleFrame/Margin/VBox/Content/Header/BattleTitle
@onready var _player_card: UIStatCard = $BattleFrame/Margin/VBox/Content/MainRow/PlayerCard
@onready var _enemy_card: UIStatCard = $BattleFrame/Margin/VBox/Content/MainRow/EnemyCard
@onready var _log: RichTextLabel = $BattleFrame/Margin/VBox/Content/MainRow/CombatLog/Margin/Log
@onready var _player_actions: UIActionMenu = $BattleFrame/Margin/VBox/Content/Footer/PlayerMenu
@onready var _enemy_actions: UIActionMenu = $BattleFrame/Margin/VBox/Content/Footer/EnemyMenu

var _battle_state := BattleState.new()

func _ready() -> void:
	_frame.set_title("BATTLE")
	_player_actions.action_selected.connect(_on_player_action)
	_enemy_actions.action_selected.connect(_on_enemy_action)

func setup_battle(player: FighterData, enemy: FighterData, player_actions: Array[String], enemy_actions: Array[String]) -> void:
	_battle_state.setup(player, enemy)
	_title_label.text = "BATTLE: %s VS %s" % [player.fighter_name, enemy.fighter_name]
	_player_card.set_fighter_data(player)
	_enemy_card.set_fighter_data(enemy)
	_player_actions.set_menu_title("COMMANDS")
	_player_actions.set_actions(player_actions)
	_enemy_actions.set_menu_title("ENEMY ACTIONS")
	_enemy_actions.set_actions(enemy_actions)
	append_log("%s clenches his fist." % player.fighter_name)
	append_log("It is %s's turn." % player.fighter_name)

func append_log(line: String) -> void:
	_battle_state.add_log_line(line)
	_log.append_text(line + "\n")
	_log.scroll_to_line(_log.get_line_count())

func _on_player_action(action_name: String) -> void:
	append_log("[color=#9bd5ff]%s uses %s![/color]" % [_battle_state.player.fighter_name, action_name])
	_battle_state.toggle_turn()

func _on_enemy_action(action_name: String) -> void:
	append_log("[color=#ffb0b0]%s selects %s.[/color]" % [_battle_state.enemy.fighter_name, action_name])
	_battle_state.toggle_turn()
