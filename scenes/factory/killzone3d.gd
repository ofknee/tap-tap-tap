extends Area3D




<<<<<<< Updated upstream
func _on_body_entered(body: RigidBody3D) -> void:
	print(name)
	if !body.name.contains("Cone"):
		print("Cone found: " + name)
=======
func _on_body_entered(body) ->  void:
	#print(body.name)
	#if body.name.contains("Cone"):
	if "is_stuck" in body:
		print("stickied")
>>>>>>> Stashed changes
	
