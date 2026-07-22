extends Node3D

var speed = Global.speed/70

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= speed


func _on_rigid_body_3d_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
		print("i got hit by", body.name)
