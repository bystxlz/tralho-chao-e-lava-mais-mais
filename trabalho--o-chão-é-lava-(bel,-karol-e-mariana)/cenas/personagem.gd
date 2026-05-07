extends CharacterBody2D

signal game_over
const SPEED = 500.0
const JUMP_VELOCITY = -600.0
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		_animated_sprite.play("pular")
	elif is_on_floor():
		_animated_sprite.play("direita")
		

	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h= direction <0
		_animated_sprite.play("direita")
		
	else:
		
		_animated_sprite.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	game_over.emit()
