extends Node3D

@export var large_box : PackedScene
@export var small_box : PackedScene
@export var yellow_button : PackedScene
@onready var spawnpoint =  $Spawnpoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.spawn_new.connect(spawn_new)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_new(type : int):

	var inst : Node3D
	match type:
		0:
			pass
			#if randi_range(0,1) == 0:
				#inst = large_box.instantiate()
			#else:
				#inst = small_box.instantiate()
			#inst.rotation.y = deg_to_rad(randf_range(0.0, 360.0))
		1:
			inst = yellow_button.instantiate()
	
	add_child(inst)
	inst.global_position = spawnpoint.global_position


func _input(event : InputEvent) -> void:
	if Input.is_action_just_pressed("RIGHT"):
		spawn_new(0)
	if Input.is_action_just_pressed("LEFT"):
		spawn_new(1)
