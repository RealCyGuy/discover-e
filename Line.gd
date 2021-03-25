extends Control

signal lose
var passed_spawn = false
var passed_end = false

func _physics_process(delta):
	rect_position.y -= get_parent().speed * delta
	if rect_position.y < 510 and !passed_spawn:
		passed_spawn = true
		get_parent().create_line()
	if rect_position.y < -81 and !passed_end:
		passed_end = true
		for unclicked_e in get_tree().get_nodes_in_group("unclicked_e"):
			if unclicked_e in get_children():
				emit_signal("lose")
		queue_free()
