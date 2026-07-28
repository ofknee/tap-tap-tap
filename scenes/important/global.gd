extends Node
signal generation_updated(new_generation: Array)
#signal killed
var generation: Array = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,]: ##starting money
	set(new_generation):
		generation = new_generation
		generation_updated.emit(generation)

var speed : float = 1
var score = 0
var high_score = 0
var jump_vel = -380

var floor_check : bool = false
var time_check = 0

#func reload_now():
#	get_tree().reload_current_scene()
