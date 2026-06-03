extends Control

@onready var morrer: AudioStreamPlayer = $"WhatsAppVideo20260603At10_46_48(1)"


func _ready() -> void:
	morrer.play()



func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/Main.tscn")
