extends CharacterBody2D

signal game_over
const SPEED = 350.0
const JUMP_VELOCITY = -600.0

@onready var _animated_sprite = $AnimatedSprite2D

@onready var som_andando = $"../personagem andando" 

@export var hud_do_jogo : CanvasLayer
var total_moedas : int = 0

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		_animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	atualizar_visuais_e_sons(direction)


func atualizar_visuais_e_sons(direction: float) -> void:
	

	if direction != 0 and is_on_floor():
		_animated_sprite.play("direita")
		
		if not som_andando.playing:
			som_andando.play()
	else:
		som_andando.stop()
		
		if not is_on_floor():
			_animated_sprite.play("pular")
		else:
			_animated_sprite.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)

func adicionar_moeda(quantidade: int) -> void:
	total_moedas += quantidade
	print("Moedas coletadas: ", total_moedas)
	if hud_do_jogo:
		hud_do_jogo.atualizar_pontos(total_moedas)

func _on_area_2d_body_entered(body: Node2D) -> void:
	game_over.emit()
