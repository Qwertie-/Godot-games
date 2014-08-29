
extends Node2D


func _ready():
	set_process(true)
	
func _process(delta):
	get_node("users_turn").set_text(str(get_parent().users_turn))
	get_node("game_running").set_text(str(get_parent().game_running))
	get_node("display_move").set_text(str(get_parent().display_move))
	get_node("user_move").set_text(str(get_parent().user_move))


