extends Control
class_name AuthMainScreen

@onready var _login_wrapper: CenterContainer = $LoginWrapper
@onready var _create_wrapper: CenterContainer = $CreateWrapper
@onready var _login_screen: LoginScreen = $LoginWrapper/LoginScreen
@onready var _create_screen: CreateAccountScreen = $CreateWrapper/CreateAccountScreen

func _ready() -> void:
	_apply_backdrop()
	_login_screen.navigate_to_create_account.connect(_show_create_account)
	_login_screen.login_requested.connect(_on_login_requested)
	_login_screen.forgot_password_requested.connect(_on_forgot_password)
	_create_screen.navigate_to_login.connect(_show_login)
	_create_screen.create_account_requested.connect(_on_create_account_requested)
	_show_login()

func _show_login() -> void:
	_login_wrapper.show()
	_create_wrapper.hide()

func _show_create_account() -> void:
	_login_wrapper.hide()
	_create_wrapper.show()

func _on_login_requested(commander_id: String, password: String) -> void:
	# TODO: Connect to authentication backend
	# For now, any non-empty credentials are accepted and the player proceeds to the game.
	print("[Auth] Login attempt for: %s" % commander_id)
	get_tree().change_scene_to_file("res://scenes/ui_milestone/MainSquadBattle.tscn")

func _on_forgot_password() -> void:
	# TODO: Navigate to password reset flow
	print("[Auth] Forgot password requested.")

func _on_create_account_requested(commander_id: String, password: String, email: String) -> void:
	# TODO: Connect to account creation backend
	print("[Auth] Create account: %s / %s" % [commander_id, email])

func _apply_backdrop() -> void:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#010a20")
	$Backdrop.add_theme_stylebox_override("panel", style)
