extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Global.score = 0
		print("2d kill")
		SignalBus.restart_game.emit()
