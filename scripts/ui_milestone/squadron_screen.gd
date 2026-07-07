extends VBoxContainer
class_name SquadronScreen

signal squad_action_requested(action_name: String)

const CHARACTER_ROW_SCENE := preload("res://scenes/ui_milestone/components/CharacterRow.tscn")

@onready var _frame: UIFramedPanel = $SquadronFrame
@onready var _power_label: Label = $SquadronFrame/Margin/VBox/Content/Header/PowerLevel
@onready var _roster_rows: VBoxContainer = $SquadronFrame/Margin/VBox/Content/MainContent/RosterPanel/RowsHolder/Rows
@onready var _attack_bonus: Label = $SquadronFrame/Margin/VBox/Content/MainContent/SidePanel/Bonuses/Attack
@onready var _defense_bonus: Label = $SquadronFrame/Margin/VBox/Content/MainContent/SidePanel/Bonuses/Defense
@onready var _exp_bonus: Label = $SquadronFrame/Margin/VBox/Content/MainContent/SidePanel/Bonuses/Experience

func _ready() -> void:
	_frame.set_title("SQUADRON")
	$SquadronFrame/Margin/VBox/Content/MainContent/SidePanel/Actions/Recruit.pressed.connect(_emit_action.bind("RECRUIT WARRIOR"))
	$SquadronFrame/Margin/VBox/Content/MainContent/SidePanel/Actions/Training.pressed.connect(_emit_action.bind("TRAINING ROOM"))
	$SquadronFrame/Margin/VBox/Content/MainContent/SidePanel/Actions/Formations.pressed.connect(_emit_action.bind("SQUAD FORMATIONS"))

func populate_squad(squad: SquadData) -> void:
	_power_label.text = "POWER LEVEL: %s" % squad.total_power_level()
	for row in _roster_rows.get_children():
		row.queue_free()
	for fighter in squad.members:
		var row := CHARACTER_ROW_SCENE.instantiate() as UICharacterRow
		row.set_fighter_data(fighter)
		_roster_rows.add_child(row)
	_attack_bonus.text = "ATTACK        +%d%%" % int(squad.bonuses.get("Attack", 0))
	_defense_bonus.text = "DEFENSE      +%d%%" % int(squad.bonuses.get("Defense", 0))
	_exp_bonus.text = "EXPERIENCE   +%d%%" % int(squad.bonuses.get("Experience", 0))

func _emit_action(action_name: String) -> void:
	squad_action_requested.emit(action_name)
