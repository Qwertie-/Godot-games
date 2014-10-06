extends Node2D
var pipe       =  preload("res://pipe.xml")
var pipe_num   =  0
var pipe_array =  [] 

func _ready():
	pipe_spawn()
	
	
	
func _fixed_process(delta):
	for pipe in pipe_array:
		get_node(pipe).move(Vector2(-150 * delta ,0))
		if get_node(pipe).is_colliding():
			if str(get_node(pipe).get_collider()) == "[KinematicBody2D:503]":
				set_fixed_process(false)

	if get_node("player").is_colliding():
		set_fixed_process(false)
	
	
	if Input.is_action_pressed("spacebar"):
		get_node("player").move(Vector2(0,-200 * delta))
	else:
		get_node("player").move(Vector2(0,200 * delta))
	Control.FOCUS_NONE
		
	
func pipe_spawn():
	var pipe_instance = pipe.instance()
	pipe_instance.set_name("pipe"+str(pipe_num))
	add_child(pipe_instance)
	var pipe_pos = get_node("pipe"+str(pipe_num))
	pipe_pos = Vector2(900,300 + rand_range(-150, 150))
	get_node("pipe"+str(pipe_num)).set_pos(pipe_pos)
	pipe_array.push_back("pipe"+str(pipe_num))
	pipe_num += 1
	

func _on_Timer_timeout():
	print("Timeout")
	pipe_spawn()

func _on_Button_pressed():
	set_fixed_process(true)
	get_node("Menu/Button").set_focus_mode(Control.FOCUS_NONE)
	get_node("Timer").start()
	print("Pressed")
