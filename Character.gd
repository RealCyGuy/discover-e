extends Button

signal e
const COMFORTAA_BOLD = preload("res://Fonts/ComfortaaBold.tres")
onready var game = get_parent().get_parent()


func _pressed():
	if self.text == "e" and !game.stop:
		emit_signal("e")
		remove_from_group("unclicked_e")
		bold()
		$Audio.play()


func bold():
	set("custom_fonts/font", COMFORTAA_BOLD)
	set("custom_colors/font_color", "#2d2d2d")
	set("custom_colors/font_color_hover", "#2d2d2d")
	set("custom_colors/font_color_pressed", "#2d2d2d")
