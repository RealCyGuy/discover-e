extends CanvasLayer

func _ready():
	$Fade/Retry.connect("pressed", self, "_on_retry")

func _on_retry():
	get_tree().reload_current_scene()
