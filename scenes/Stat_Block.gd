extends Control

@onready var block_int = find_child("INT")
@onready var block_str = find_child("STR")
@onready var block_dex = find_child("DEX")
@onready var block_stm = find_child("STM")
@onready var block_spd = find_child("SPD")

var _character_stats = load("res://stats/character_stats.gd").new()

signal finished_character(p_character)

func set_character_stats(p_character_stats):
	_character_stats = p_character_stats
	_update_controls()

func _update_controls():
	block_int.stat_value = _character_stats.ine
	block_str.stat_value = _character_stats.str
	block_dex.stat_value = _character_stats.dex
	block_stm.stat_value = _character_stats.sta
	block_spd.stat_value = _character_stats.spd

func _save_resource():
	pass

func _on_done_pressed():
	finished_character.emit(_character_stats)
	_delete()

func _delete():
	visible = false
	queue_free()
