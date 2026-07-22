extends CharacterBody2D


#@onready var SPEED = Global.player_speed
@onready var JUMP_VELOCITY = Global.jump_vel
@onready var ray = $RayCast2D
@onready var shadow = $Shadow
@onready var score_label = $"../Timer/HBoxContainer/score"
@onready var hs_label = $"../Timer/HBoxContainer2/highScore"

func _physics_process(delta: float) -> void:
	
	hs_label.text = " High Score: " + str(Global.high_score)
		
	if ray.is_colliding():
		shadow.show()
			
		var hit = ray.get_collision_point()
		shadow.global_position = Vector2(global_position.x, hit.y + 6)
		
	else:
		shadow.hide()
	# Add the gravity.
	if not is_on_floor():
		#if Global.accel_count > 1:
			#velocity += get_gravity() * delta * 1.1 * (1*Global.accel_count)
		#else:
		velocity += get_gravity() * delta * 1.1
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
 
func add_point():
	Global.score += 1
	if Global.score > Global.high_score:
			Global.high_score = Global.score
			hs_label.text = " High Score: " + str(Global.high_score)
	score_label.text = " Score: " + str(Global.score)

func _on_timer_timeout() -> void:
	add_point()
	
func _input(event : InputEvent) -> void:
	if Input.is_action_just_pressed("SWITCH"):
		get_tree().change_scene_to_file("res://scenes/factory/factory.tscn")
	#if Global.high_score%100 == 0:
		#Global.speed = Global.speed*1.1
		#Global.player_speed = Global.player_speed*1.1
		#Global.jump_vel = Global.jump_vel*1.1
		#Global.accel_count += 1
