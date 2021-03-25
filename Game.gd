extends Control

const CHARACTER = preload("res://Character.tscn")
const LINE = preload("res://Line.tscn")
onready var WORD_LIST = WordList.list
export var speed = 10
var time = 0
var stop = false
var last_word = ""


func _ready():
	randomize()
	create_line()
	$AnimationPlayer.play("start")


func _process(delta):
	if ! stop:
		speed += delta
		time += delta
		$Menu/Fade/Time.text = str(round(time))


func _on_e():
	print(1)


func _on_lose():
	stop = true
	$AnimationPlayer.play("end")


func create_line():
	var line = LINE.instance()
	add_child(line)
	var pos = 5
	while pos < rect_size.x:
		var letters = WORD_LIST[randi() % WORD_LIST.size()] + " "
		var bold = false
		if stop:
			if last_word == "game ":
				letters = "over "
				bold = true
			elif stop and randf() < 0.3 and last_word != "over ":
				letters = "game "
				bold = true
			elif letters == "game " or letters == "over ":
				bold = true
		last_word = letters
		var prev_letters = ""
		for letter in letters:
			if letter == "e" or letter == " ":
				for thing in [prev_letters, letter]:
					if thing:
						var character = CHARACTER.instance()
						character.margin_left = pos
						character.text = thing
						if thing == "e" and ! stop:
							character.add_to_group("unclicked_e")
							character.mouse_default_cursor_shape = CURSOR_POINTING_HAND
							character.set("custom_colors/font_color_hover", "#4f4f4f")
						if bold:
							character.bold()
						line.add_child(character)
						character.connect("e", self, "_on_e")
						pos += character.rect_size.x
				prev_letters = ""
			else:
				prev_letters += letter
	if last_word == "game ":
		last_word = ""
	elif last_word == "over ":
		last_word = "game "
	line.get_child(line.get_child_count() - 1).free()
	var letter_content = ""
	while letter_content != " ":
		var letter = line.get_child(line.get_child_count() - 1)
		letter_content = letter.text
		letter.free()
	line.connect("lose", self, "_on_lose")
