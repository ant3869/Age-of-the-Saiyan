extends VBoxContainer
class_name CreateAccountScreen

signal navigate_to_login
signal create_account_requested(commander_id: String, password: String, email: String)

@onready var _frame: UIFramedPanel = $CreateFrame
@onready var _id_input: LineEdit = $CreateFrame/Margin/VBox/Content/Fields/CommanderIDRow/Input
@onready var _pw_input: LineEdit = $CreateFrame/Margin/VBox/Content/Fields/PasswordRow/Input
@onready var _confirm_input: LineEdit = $CreateFrame/Margin/VBox/Content/Fields/ConfirmRow/Input
@onready var _email_input: LineEdit = $CreateFrame/Margin/VBox/Content/Fields/EmailRow/Input
@onready var _back_btn: Button = $CreateFrame/Margin/VBox/Content/FooterRow/BackButton
@onready var _create_btn: Button = $CreateFrame/Margin/VBox/Content/FooterRow/CreateButton
@onready var _error_label: Label = $CreateFrame/Margin/VBox/Content/ErrorLabel

func _ready() -> void:
	_frame.set_title("CREATE ACCOUNT")
	_error_label.hide()
	_apply_field_styles()
	_apply_back_button_style(_back_btn)
	_apply_primary_button_style(_create_btn)
	_back_btn.pressed.connect(navigate_to_login.emit)
	_create_btn.pressed.connect(_on_create_pressed)

func _apply_field_styles() -> void:
	var row_nodes := [
		$CreateFrame/Margin/VBox/Content/Fields/CommanderIDRow,
		$CreateFrame/Margin/VBox/Content/Fields/PasswordRow,
		$CreateFrame/Margin/VBox/Content/Fields/ConfirmRow,
		$CreateFrame/Margin/VBox/Content/Fields/EmailRow,
	]
	for i in row_nodes.size():
		var row: HBoxContainer = row_nodes[i]
		var lbl: Label = row.get_node("RowLabel")
		var inp: LineEdit = row.get_node("Input")
		lbl.add_theme_color_override("font_color", Color("#38c8ff"))
		lbl.add_theme_font_size_override("font_size", 13)

		var normal := StyleBoxFlat.new()
		normal.bg_color = Color("#02153a")
		normal.border_color = Color("#1a5aaa")
		normal.set_border_width_all(1)
		normal.set_corner_radius_all(4)
		normal.content_margin_left = 8.0
		normal.content_margin_top = 6.0
		normal.content_margin_right = 8.0
		normal.content_margin_bottom = 6.0
		inp.add_theme_stylebox_override("normal", normal)

		var focus := StyleBoxFlat.new()
		focus.bg_color = Color("#031e54")
		focus.border_color = Color("#38aaff")
		focus.set_border_width_all(2)
		focus.set_corner_radius_all(4)
		focus.content_margin_left = 8.0
		focus.content_margin_top = 6.0
		focus.content_margin_right = 8.0
		focus.content_margin_bottom = 6.0
		inp.add_theme_stylebox_override("focus", focus)

		inp.add_theme_color_override("font_color", Color("#c8e8ff"))
		inp.add_theme_color_override("font_placeholder_color", Color("#3a6a99"))
		inp.add_theme_font_size_override("font_size", 15)

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
	btn.add_theme_font_size_override("font_size", 16)

func _apply_back_button_style(btn: Button) -> void:
	var normal := StyleBoxFlat.new()
	normal.bg_color = Color("#041f57")
	normal.border_color = Color("#2aa2ff")
	normal.set_border_width_all(2)
	normal.set_corner_radius_all(6)
	btn.add_theme_stylebox_override("normal", normal)

	var hover := StyleBoxFlat.new()
	hover.bg_color = Color("#0a3070")
	hover.border_color = Color("#38c8ff")
	hover.set_border_width_all(2)
	hover.set_corner_radius_all(6)
	btn.add_theme_stylebox_override("hover", hover)

	var pressed_style := StyleBoxFlat.new()
	pressed_style.bg_color = Color("#021030")
	pressed_style.border_color = Color("#38aaff")
	pressed_style.set_border_width_all(2)
	pressed_style.set_corner_radius_all(6)
	btn.add_theme_stylebox_override("pressed", pressed_style)

	btn.add_theme_color_override("font_color", Color("#c8e8ff"))
	btn.add_theme_font_size_override("font_size", 16)

func _on_create_pressed() -> void:
	var id := _id_input.text.strip_edges()
	var pw := _pw_input.text
	var confirm := _confirm_input.text
	var email := _email_input.text.strip_edges()
	if not _validate(id, pw, confirm, email):
		return
	create_account_requested.emit(id, pw, email)

func _validate(id: String, pw: String, confirm: String, email: String) -> bool:
	if id.is_empty():
		_show_error("Commander ID is required.")
		return false
	if pw.is_empty():
		_show_error("Password is required.")
		return false
	if pw != confirm:
		_show_error("Passwords do not match.")
		return false
	if email.is_empty():
		_show_error("Email address is required.")
		return false
	if not _is_valid_email(email):
		_show_error("Enter a valid email address.")
		return false
	_error_label.hide()
	return true

func _is_valid_email(email: String) -> bool:
	var at_pos := email.find("@")
	if at_pos < 1:
		return false
	var domain := email.substr(at_pos + 1)
	return domain.contains(".") and not domain.ends_with(".")

func _show_error(msg: String) -> void:
	_error_label.text = msg
	_error_label.show()

func clear_fields() -> void:
	_id_input.clear()
	_pw_input.clear()
	_confirm_input.clear()
	_email_input.clear()
	_error_label.hide()
