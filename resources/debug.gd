
extends Node2D


func _ready():
	set_process(true)
	
func _process(delta):
	var debug1 = get_parent().users_turn
	get_node("users_turn").set_text(str(debug1))

