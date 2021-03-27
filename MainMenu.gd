extends Control

func _ready():
	$Play.connect("pressed", self, "_on_play")
	$Link.connect("pressed", self, "_on_link")

func _on_play():
	get_tree().change_scene("res://Game.tscn")
	GlobalClick.play()

func _on_link():
	OS.shell_open("https://realcyguy.netlify.app")
	GlobalClick.play()
