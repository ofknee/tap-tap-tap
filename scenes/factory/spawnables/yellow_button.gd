extends RigidBody3D

var speed = Global.speed/110
@onready var top : CollisionShape3D = $Top

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= speed
	print(position.x)
	
	if position.x <= 0:
		print("die time")


func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	var owner_id = shape_find_owner(local_shape_index)
	var shape_node = shape_owner_get_owner(owner_id)
	if shape_node == top:
		if "is_stuck" in body and not body.is_stuck:
			body.is_stuck = true
			call_deferred("stick_to_button", body)
func stick_to_button(body: Node) -> void:
	if body.get_parent() == self:
		return # already stuck
	var world_transform = body.global_transform

	if body.get_parent():
		body.get_parent().remove_child(body)
	add_child(body)
	body.global_transform = world_transform

	if body is RigidBody3D:
		body.freeze = true
		body.freeze_mode = RigidBody3D.FREEZE_MODE_KINEMATIC
		body.linear_velocity = Vector3.ZERO
		body.angular_velocity = Vector3.ZERO

	if body.has_method("emit_stuck_signal"):
		body.emit_stuck_signal()
		
	print("estoy stuck, ", name, " to ", body.name)
