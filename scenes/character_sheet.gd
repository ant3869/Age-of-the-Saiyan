extends Control

@onready var pointslabel = $Margin.get_node("HBoxContainer/VBoxContainer/HBoxContainer/MainStats/PointsContainer/Label")
@onready var pointsvalue = $Margin.get_node("HBoxContainer/VBoxContainer/HBoxContainer/MainStats/PointsContainer/Points")
@onready var confirmbutton = $Margin.get_node("HBoxContainer/VBoxContainer/HBoxContainer/MainStats/ConfirmContainer/Margin/ConfirmButton")
var stats_path = "Margin/HBoxContainer/VBoxContainer/HBoxContainer/MainStats/AttributeBlock/Margin/Container"

var availablepoints = 7
var int_add = 0
var str_add = 0
var dex_add = 0
var stm_add = 0
var spd_add = 0
var cha_add = 0

func _ready():
	pointsvalue.set_text(str(availablepoints))
	if availablepoints == 0:
		for buttons in get_tree().get_nodes_in_group("PlusButtons"):
			buttons.visible = false
	else:
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
			button.visible = true
	for button in get_tree().get_nodes_in_group("PlusButtons"):
		button.connect("pressed", IncreaseStat)
	for button in get_tree().get_nodes_in_group("MinusButtons"):
		button.connect("pressed", DecreaseStat)

func IncreaseStat():
#	set(stat + "_add", get(stat + "_add") + 1)
#	get_node(stats_path + stat + "/StatBackgroun/MinButton").set_disabled(false)
#	get_node(stats_path + stat + "/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	availablepoints -= 1
	pointsvalue.set_text(str(availablepoints))
	if availablepoints == 0:
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)
			button.visible = false

func DecreaseStat():
	pass

func EnablePlusButtons():
	for button in get_tree().get_nodes_in_group("PlusButtons"):
		button.set_disabled(false)
		button.visible = true

func EnableMinButtons():
	for button in get_tree().get_nodes_in_group("PlusButtons"):
		button.set_disabled(false)
		button.visible = true

func CheckColor():
	if int_add > 0:
		get_node(stats_path + "INT/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	else:
		get_node(stats_path + "INT/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 0, 0))
	if str_add > 0:
		get_node(stats_path + "STR/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	else:
		get_node(stats_path + "STR/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 0, 0))
	if dex_add > 0:
		get_node(stats_path + "DEX/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	else:
		get_node(stats_path + "DEX/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 0, 0))
	if stm_add > 0:
		get_node(stats_path + "STM/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	else:
		get_node(stats_path + "STM/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 0, 0))
	if spd_add > 0:
		get_node(stats_path + "SPD/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	else:
		get_node(stats_path + "SPD/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 0, 0))
	if cha_add > 0:
		get_node(stats_path + "CHA/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 1, 0))
	else:
		get_node(stats_path + "CHA/StatBackgroun/Stats/Value").font.set_modulate(Color(0, 0, 0))
