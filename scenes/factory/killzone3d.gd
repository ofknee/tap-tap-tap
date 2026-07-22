extends Area3D




func _on_body_entered(body) ->  void:
	#print(body.name)
	#if body.name.contains("Cone"):
	if body is StaticBody3D:
		return
	else:
		if "is_stuck" in body:
			print("stickied")
		elif !"is_stuck" in body:
			print("3d kill")
			get_tree().reload_current_scene()
