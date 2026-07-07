extends RefCounted
class_name BattleState

var player: FighterData
var enemy: FighterData
var combat_log: Array[String] = []
var is_player_turn := true

func setup(p_player: FighterData, p_enemy: FighterData) -> void:
	player = p_player
	enemy = p_enemy
	combat_log.clear()
	is_player_turn = true

func add_log_line(line: String) -> void:
	combat_log.append(line)

func toggle_turn() -> void:
	is_player_turn = !is_player_turn
