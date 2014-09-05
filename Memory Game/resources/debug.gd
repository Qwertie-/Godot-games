extends Node2D

var debug = false
var debug_toggle_pressed = false


func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("debug"):
		if !debug_toggle_pressed:
			if !debug:
				show()
				debug = true
			else:
				hide()
				debug = false
			debug_toggle_pressed = true
			
	else:
		debug_toggle_pressed = false

	get_node("users_turn").set_text(str(get_parent().users_turn))
	get_node("game_running").set_text(str(get_parent().game_running))
	get_node("display_move").set_text(str(get_parent().display_move))
	get_node("user_move").set_text(str(get_parent().user_move))
	get_node("moves").set_text(str(get_parent().moves))
	get_node("move_checked").set_text(str(get_parent().move_checked))






