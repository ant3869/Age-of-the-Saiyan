extends VBoxContainer
class_name LoginScreen

signal navigate_to_create_account
signal login_requested(commander_id: String, password: String)
signal forgot_password_requested

@onready var _frame: UIFramedPanel = $LoginFrame
@onready var _id_field: UILabeledField = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/CommanderIDField
@onready var _pw_field: UILabeledField = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/PasswordField
@onready var _remember_check: CheckBox = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/RememberRow/RememberMe
@onready var _login_btn: Button = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/LoginButton
@onready var _forgot_link: Button = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/LinksRow/ForgotLink
@onready var _create_link: Button = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/LinksRow/CreateLink
@onready var _logo_area: Panel = $LoginFrame/Margin/VBox/Content/FormRow/LogoArea
@onready var _error_label: Label = $LoginFrame/Margin/VBox/Content/FormRow/FormFields/ErrorLabel

func _ready() -> void:
	_frame.set_title("LOGIN")
	_id_field.set_label_text("COMMANDER ID")
	_id_field.set_placeholder("Enter Commander ID")
	_pw_field.set_label_text("PASSWORD")
	_pw_field.set_placeholder("Enter Password")
	_pw_field.set_secret(true)
	_error_label.hide()
	_apply_logo_style()
	_apply_primary_button_style(_login_btn)
	_apply_link_style(_forgot_link)
	_apply_link_style(_create_link)
	_apply_checkbox_style(_remember_check)
	_login_btn.pressed.connect(_on_login_pressed)
	_forgot_link.pressed.connect(forgot_password_requested.emit)
	_create_link.pressed.connect(navigate_to_create_account.emit)

func _apply_logo_style() -> void:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#020d2a")
	style.border_color = Color("#1a4a88")
	style.set_border_width_all(2)
	style.set_corner_radius_all(8)
	_logo_area.add_theme_stylebox_override("panel", style)
	var logo_label: Label = _logo_area.get_node("LogoLabel")
	logo_label.add_theme_color_override("font_color", Color("#cc2a2a"))
	logo_label.add_theme_font_size_override("font_size", 36)

func _apply_primary_button_style(btn: Button) -> void:
	var normal := StyleBoxFlat.new()
	normal.bg_color = Color("#0a4fff")
	normal.border_color = Color("#38aaff")
	normal.set_border_width_all(2)
	normal.set_corner_radius_all(6)
	normal.shadow_color = Color(0.0, 0.4, 1.0, 0.5)
	normal.shadow_size = 6
	btn.add_theme_stylebox_override("normal", normal)

	var hover := StyleBoxFlat.new()
	hover.bg_color = Color("#1a6fff")
	hover.border_color = Color("#70ccff")
	hover.set_border_width_all(2)
	hover.set_corner_radius_all(6)
	hover.shadow_color = Color(0.0, 0.5, 1.0, 0.7)
	hover.shadow_size = 8
	btn.add_theme_stylebox_override("hover", hover)

	var pressed_style := StyleBoxFlat.new()
	pressed_style.bg_color = Color("#0830cc")
	pressed_style.border_color = Color("#38aaff")
	pressed_style.set_border_width_all(2)
	pressed_style.set_corner_radius_all(6)
	btn.add_theme_stylebox_override("pressed", pressed_style)

	btn.add_theme_color_override("font_color", Color("#ffffff"))
	btn.add_theme_font_size_override("font_size", 18)

func _apply_link_style(btn: Button) -> void:
	btn.flat = true
	btn.add_theme_color_override("font_color", Color("#2a9aff"))
	btn.add_theme_color_override("font_hover_color", Color("#70ccff"))
	btn.add_theme_color_override("font_pressed_color", Color("#ffffff"))
	btn.add_theme_font_size_override("font_size", 13)

func _apply_checkbox_style(cb: CheckBox) -> void:
	cb.add_theme_color_override("font_color", Color("#c8e8ff"))
	cb.add_theme_font_size_override("font_size", 14)

func _on_login_pressed() -> void:
	var id := _id_field.get_value().strip_edges()
	var pw := _pw_field.get_value()
	if not _validate(id, pw):
		return
	login_requested.emit(id, pw)

func _validate(id: String, pw: String) -> bool:
	if id.is_empty():
		_show_error("Commander ID is required.")
		return false
	if pw.is_empty():
		_show_error("Password is required.")
		return false
	_error_label.hide()
	return true

func _show_error(msg: String) -> void:
	_error_label.text = msg
	_error_label.show()

func get_remember_me() -> bool:
	return _remember_check.button_pressed

func clear_fields() -> void:
	_id_field.clear()
	_pw_field.clear()
	_error_label.hide()
