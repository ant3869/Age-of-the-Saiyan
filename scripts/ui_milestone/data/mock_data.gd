extends RefCounted
class_name MockData

static func create_fighter(name: String, level: int, hp: int, ki: int, stamina: int, role: String, status: String) -> FighterData:
	var fighter := FighterData.new()
	fighter.fighter_name = name
	fighter.level = level
	fighter.max_hp = hp
	fighter.hp = hp
	fighter.max_ki = ki
	fighter.ki = ki
	fighter.max_stamina = stamina
	fighter.stamina = stamina
	fighter.role = role
	fighter.status = status
	return fighter

static func create_squad() -> SquadData:
	var squad := SquadData.new()
	squad.squad_name = "SQUADRON"
	squad.members = [
		create_fighter("RADDOCK", 1, 388, 158, 50, "LEADER", "ACTIVE"),
		create_fighter("VEGETA", 2, 420, 200, 60, "ASSAULT", "ACTIVE"),
		create_fighter("NAPPA", 1, 450, 120, 55, "TANK", "ACTIVE"),
		create_fighter("TURLES", 1, 350, 140, 45, "SCOUT", "INACTIVE"),
		create_fighter("APPULE", 1, 300, 100, 40, "SUPPORT", "INACTIVE"),
	]
	squad.bonuses = {
		"Attack": 10,
		"Defense": 10,
		"Experience": 5,
	}
	return squad

static func create_enemy() -> FighterData:
	return create_fighter("PLANETARY ELITE SOLDIER", 1, 280, 80, 40, "ENEMY", "ACTIVE")

static func player_actions() -> Array[String]:
	return ["ATTACK", "KI BLAST", "DEFEND", "USE ITEM", "CHARGE KI", "TRANSFORM"]

static func enemy_actions() -> Array[String]:
	return ["ATTACK", "KI BLAST", "DEFEND", "ITEM", "FLEE"]
