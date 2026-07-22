extends Node3D
@export var drop : PackedScene
@onready var spawnpoint : Marker3D = $Spawnpoint
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event : InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		spawn_drop()

func spawn_drop() -> void:
	var inst = drop.instantiate()
	add_child(inst)
	inst.global_position = spawnpoint.global_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
