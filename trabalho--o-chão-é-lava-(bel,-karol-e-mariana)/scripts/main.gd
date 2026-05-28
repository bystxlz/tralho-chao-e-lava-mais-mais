extends Node2D

func _on_personagem_game_over() -> void:
	print("game over")
	get_tree().call_deferred("reload_current_scene")
