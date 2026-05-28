extends Area2D



@export var valor_da_moeda : int = 1

func _on_body_entered(body: Node2D) -> void:
	$"../som da moedinha".play()
	if body.has_method("adicionar_moeda"):
		body.adicionar_moeda(valor_da_moeda) 
		print("pegou")
		queue_free() 
