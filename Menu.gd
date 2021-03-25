extends CanvasLayer

func _ready():
	$Fade/Quit.connect("pressed", self, "_on_quit")
	$Fade/Retry.connect("pressed", self, "_on_retry")

func _on_quit():
	GlobalClick.play()

func _on_retry():
	get_tree().reload_current_scene()
	GlobalClick.play()
