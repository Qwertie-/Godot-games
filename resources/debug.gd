
extends Node2D


func _ready():
	set_process(true)
	
func _process(delta):
	print(get_parent().get_node("Game").users_turn)


