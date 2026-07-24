extends CanvasLayer

@onready var score_label = $Timer/MarginContainer/MarginContainer2/VBoxContainer/score
@onready var hs_label = $Timer/MarginContainer/MarginContainer2/VBoxContainer/highScore
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	hs_label.text = " High Score: " + str(Global.high_score)

	if Global.score > Global.high_score:
		Global.high_score = Global.score
		hs_label.text = " High Score: " + str(Global.high_score)
	score_label.text = " Score: " + str(Global.score)
