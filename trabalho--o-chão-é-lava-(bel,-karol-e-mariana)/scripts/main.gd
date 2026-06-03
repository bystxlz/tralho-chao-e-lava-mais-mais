extends Node2D

func _on_personagem_game_over() -> void:
	print("game over")
	get_tree().change_scene_to_file("res://cenas/telaDemorte.tscn")
