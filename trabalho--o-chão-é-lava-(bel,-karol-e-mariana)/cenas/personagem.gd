extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -700.0
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		_animated_sprite.play("default")
		velocity.x = direction * SPEED
	else:
		_animated_sprite.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
