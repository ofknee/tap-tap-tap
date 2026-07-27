extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Global.score = 0
		#print("time_check = 1") - more, click to expand
		#get_tree().reload_current_scene.call_deferred()
		#Global.time_check = 1
		#get_tree().change_scene_to_file("res://scenes/important/start_screen.tscn")
		#Global.killed.emit()
