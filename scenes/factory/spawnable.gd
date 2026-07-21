extends Node3D

var speed = Global.speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x -= speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
