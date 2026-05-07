extends Node2D



func _on_personagem_game_over() -> void:
	get_tree().call_deferred("reload_current_scene")
