extends Node2D

var speed: float = 200.0

func _physics_process(delta: float) -> void:
	position.x += 5
