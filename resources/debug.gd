extends Node2D

var debug = true


func _ready():
	set_process(true)
	
func _process(delta):
	if debug:
		get_node("users_turn").set_text(str(get_parent().users_turn))
		get_node("game_running").set_text(str(get_parent().game_running))
		get_node("display_move").set_text(str(get_parent().display_move))
		get_node("user_move").set_text(str(get_parent().user_move))
		get_node("moves").set_text(str(get_parent().moves))
		get_node("move_checked").set_text(str(get_parent().move_checked))






