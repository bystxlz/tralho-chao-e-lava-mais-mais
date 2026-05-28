extends Area2D


func _on_body_entered(body: Node2D) -> void:
	$"../../../som jogo".play()
	get_tree().call_deferred("reload_current_scene")
