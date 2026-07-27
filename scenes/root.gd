extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.restart_game.connect(restart)

func restart() -> void:
	Global.generation = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,] ##starting money
	get_tree().reload_current_scene.call_deferred()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
