extends Area3D




func _on_body_entered(body: RigidBody3D) -> void:
	print(name)
	if !body.name.contains("Cone"):
		print("Cone found: " + name)
	
