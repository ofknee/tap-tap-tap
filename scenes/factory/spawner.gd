extends Node3D

@export var large_box : Node3D
@export var small_box : Node3D
@export var button : Node3D
@onready var spawnpoint =  $Spawnpoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.spawn_new.connect(spawn_new)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_new(type : int):
	pass
