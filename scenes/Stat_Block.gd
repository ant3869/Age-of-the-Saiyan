extends Control

@onready var block_int = find_child("Intellegence")
@onready var block_str = find_child("Strength")
@onready var block_stm = find_child("Stamina")
@onready var block_dex = find_child("Dexterity")
@onready var block_spd = find_child("Speed")
@onready var block_wis = find_child("Wisdom")
@onready var block_cha = find_child("Charisma")

var _character_stats = load("res://stats/character_stats.gd").new()

signal finished_character(p_character)

func set_character_stats(p_character_stats):
	_character_stats = p_character_stats
	_update_controls()

func _update_controls():
	block_int.stat_value = _character_stats.intellegence
	block_str.stat_value = _character_stats.strength
	block_stm.stat_value = _character_stats.stamina
	block_dex.stat_value = _character_stats.dexterity
	block_spd.stat_value = _character_stats.speed
	block_wis.stat_value = _character_stats.wisdom
	block_cha.stat_value = _character_stats.charisma

func _save_resource():
	pass

func _on_done_pressed():
	finished_character.emit(_character_stats)
	_delete()

func _delete():
	visible = false
	queue_free()
