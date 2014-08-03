extends Node2D

var moves         = []
var cubes         = ["Red","Blue","Green","Yellow"]
var game_running  = false
var display_move  = 0
var pressed
var enter_pressed



func _ready():
	set_process(true)


func _process(delta):
	start()
	if Input.is_action_pressed("space"):
		if pressed == false:
			new_move()
			pressed = true
	else:
		pressed = false
		
	if Input.is_action_pressed("ui_accept"):
		if enter_pressed == false:
			display_move = 0
			game_running = true
			enter_pressed = true
	else:
		enter_pressed = false


func start():  #Plays animations to show the patern
	if game_running:
		print ("Game started")
		get_node("Timer").start()
		game_running = false


func new_move(): #adds a new move to the pattern
	randomize()
	var next_cube = int(rand_range(1,5))
	print (next_cube)
	
	if next_cube == 1:
		moves.push_back("Red")
	elif next_cube == 2:
		moves.push_back("Blue")
	elif next_cube == 3:
		moves.push_back("Green")
	if next_cube == 4:
		moves.push_back("Yellow")
	
	print (moves)


func _on_Timer_timeout():
	if display_move < moves.size():
		if moves[display_move] == "Red":
			print ("Move " + str(display_move) + " " + "is red")
			get_node("AnimationPlayer").queue("Blink_red")
		elif moves[display_move] == "Blue":
			print ("Move " + str(display_move) + " " + "is blue")
			get_node("AnimationPlayer").queue("Blink_blue")
		elif moves[display_move] == "Green":
			print ("Move " + str(display_move) + " " + "is Green")
			get_node("AnimationPlayer").queue("Blink_green")
		elif moves[display_move] == "Yellow":
			print ("Move " + str(display_move) + " " + "is Yellow")
			get_node("AnimationPlayer").queue("Blink_yellow")
		display_move += 1
