extends Node2D
var body         = preload("res://body.xml")
var direction    = Vector2(1,0)
var rotation     = 90
var snake        = ["Body1"]
var body_count   = 2
var last         = 0
var turn_pressed = false

func _ready():
	set_process(true)
	set_process_input(true)
	get_node("Timer").start()
	

func _input(event):
	if event.is_action("ui_left")  && event.is_pressed() && !event.is_echo():
		rotation = get_node("Head").get_rot()
		get_node("Head").set_rot(rotation + deg2rad(90))
		turn_pressed = true
		if int(rad2deg(get_node("Head").get_rot())) > 270:
			get_node("Head").set_rot(0)
			
	if event.is_action("ui_right") && event.is_pressed() && !event.is_echo():
		rotation = get_node("Head").get_rot()
		get_node("Head").set_rot(rotation + deg2rad(-90))
		turn_pressed = true


func _on_Timer_timeout():
	#Check direction
	if int(rad2deg(get_node("Head").get_rot())) == 0:
		direction = Vector2(1,0)
	elif int(rad2deg(get_node("Head").get_rot())) == 90:
		direction = Vector2(0,-1)
	elif int(rad2deg(get_node("Head").get_rot())) == 180:
		direction = Vector2(-1,0)	
	elif int(rad2deg(get_node("Head").get_rot())) == 270:
		direction = Vector2(0,1)	
	print (int(rad2deg(get_node("Head").get_rot())))


	#Move head forward
	var head_pos = get_node("Head").get_pos()
	var new_head_pos = head_pos + (direction * 30)
	get_node("Head").set_pos(new_head_pos)
	#Create new body part
	var body_instance = body.instance()
	body_instance.set_name("Body"+str(body_count))
	add_child(body_instance)
	snake.push_back("Body"+str(body_count))
	body_instance.set_pos(head_pos)
	body_count +=1
	#Remove last body part
	remove_and_delete_child(get_node(snake[last]))
	last += 1
