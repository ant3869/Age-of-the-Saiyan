@tool
extends Control

@export var type_text = "TYPE" : set = set_type_text
@export var title_text = "TITLE" : set = set_title_text
@export var descript_text = "DESCRIPTION" : set = set_descript_text
@onready var typelabel = $Rect.get_node("Margin2/HBoxContainer/Type")
@onready var titlelabel = $Rect.get_node("Margin2/HBoxContainer/Title")
@onready var descriptlabel = $Rect.get_node("Margin/Desccription")

func set_type_text(p_set):
	type_text = p_set
	if is_node_ready():
		_update_type_string()

func set_title_text(p_set):
	title_text = p_set
	if is_node_ready():
		_update_title_string()

func set_descript_text(p_set):
	descript_text = p_set
	if is_node_ready():
		_update_descript_string()

func _update_type_string():
	typelabel.text = type_text

func _update_title_string():
	titlelabel.text = title_text

func _update_descript_string():
	descriptlabel.text = descript_text
