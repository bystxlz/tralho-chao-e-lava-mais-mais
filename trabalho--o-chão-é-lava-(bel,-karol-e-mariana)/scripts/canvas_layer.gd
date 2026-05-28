extends CanvasLayer

# Referência direta ao texto do contador
@onready var contador_texto: Label = $Label

# Função que atualiza o texto na tela
func atualizar_pontos(quantidade: int) -> void:
	contador_texto.text = "Moedas: " + str(quantidade)
