
extends Node2D


func _ready():
	set_process(true)
	
func _process(delta):
	get_node("users_turn").set_text(str(get_parent().users_turn))

