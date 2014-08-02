extends Node2D

var moves         = []
var cubes         = ["Red","Blue","Green","Yellow"]
var user_turn     = false
var user_move     = []
var user_turns    = 0
var pressed
var enter_pressed



func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("space"):
		if pressed == false:
			new_move()
			pressed = true
	else:
		pressed = false
		
	if Input.is_action_pressed("ui_accept"):
		if enter_pressed == false:
			start()
			enter_pressed = true
	else:
		enter_pressed = false
	
	if user_turns == moves.size():
		user_turn = false
	
	
	if user_turn: #Gets user input after animation plays
		if Input.is_action_pressed("red"):
			user_move.push_back("Red")
			user_turns += 1
			print (user_move)
		if Input.is_action_pressed("blue"):
			user_move.push_back("Blue")
			user_turns += 1
			print (user_move)
		if Input.is_action_pressed("green"):
			user_move.push_back("Green")
			user_turns += 1
			print (user_move)
		if Input.is_action_pressed("yellow"):
			user_move.push_back("Yellow")
			user_turns += 1
			print (user_move)

func start():  #Plays animations to show the patern
	print ("Game started")
	var i = 0
	print (moves.size())
	while i < moves.size():
		if moves[i] == "Red":
			print ("Move " + str(i) + " " + "is red")
			get_node("AnimationPlayer").queue("Blink_red")
		elif moves[i] == "Blue":
			print ("Move " + str(i) + " " + "is blue")
			get_node("AnimationPlayer").queue("Blink_blue")
		elif moves[i] == "Green":
			print ("Move " + str(i) + " " + "is Green")
			get_node("AnimationPlayer").queue("Blink_green")
		elif moves[i] == "Yellow":
			print ("Move " + str(i) + " " + "is Yellow")
			get_node("AnimationPlayer").queue("Blink_yellow")
		i += 1
	user_turn = true
	
	

func turn_end():
	if moves == user_turns:
		new_move()
		start()


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
