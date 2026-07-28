extends RigidBody3D

signal stuck_to_button

var is_stuck: bool = false

func emit_stuck_signal() -> void:
	stuck_to_button.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y <= -1: #fall trhough floor
		print('oopsies i fall')
		queue_free()
	if position.x <= -4:
		queue_free() #if not stuck on box and pushed anyway
		print("special kill")
 
