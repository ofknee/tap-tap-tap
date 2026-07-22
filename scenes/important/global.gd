extends Node
signal generation_updated(new_generation: Array)
var generation: Array = [0,0,0,0,0]: ##starting money
	set(new_generation):
		generation = new_generation
		generation_updated.emit(generation)

var speed : float = 1.0
var score = 0
var high_score = 0
