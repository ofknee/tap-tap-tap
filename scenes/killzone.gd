extends Area2D

@onready var die_sound = $"../../../../../../kill_sound"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		die_sound.play(0.02)
		await get_tree().create_timer(0.4).timeout
		Global.score = 0
		print("2d kill")
		SignalBus.restart_game.emit()
