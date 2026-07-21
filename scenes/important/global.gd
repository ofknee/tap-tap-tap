extends Node

var generation : Array = [0,0,0,0,0]
var wait : float = 1.0
var score = 0

func add_point():
	score += 1
	print(score)
