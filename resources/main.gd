extends Node2D

var moves         = []                                #The moves genorated by code
var cubes         = ["Red","Blue","Green","Yellow"]   #Array of posible moves
var game_running  = false                             #Shows if animation is running
var display_move  = -1                                #Shows the current move in the animation                           
var users_turn    = true                              #Shows if the user can input a move
var user_move     = []                                #Array of moves picked by user
var user_turns    = 0                                 #Amount of moves taken by user
var move_checked  = true                      #Shows if the user move has been matched to the moves


var red_pressed    = false
var blue_pressed   = false
var green_pressed  = false
var yellow_pressed = false
var start_pressed  = false  
var space_pressed  = false



func _ready():
	set_process(true)


func _process(delta):
	user_move()
	
	if Input.is_action_pressed("start"): #Starts the game
		if !start_pressed && !game_running :
			get_node("Node2D/message").set_text("")
			start()
	else:
		start_pressed = false
		
	if Input.is_action_pressed("space"): #checks if moves match
		if !space_pressed:
			move_check()
			space_pressed = true

	else:
		space_pressed = false

		
	if display_move == moves.size() + 1:
		game_running = false


func start():  #Plays animations to show the patern
	move_checked = false
	print ("Game started")
	get_node("Timer").start()
	new_move()
	display_move = 0
	game_running = true
	user_move = []
	user_turns    = 0 
	start_pressed = true
	


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

	elif display_move == moves.size():
		display_move += 1
		
	if display_move == moves.size() +1 && !users_turn && user_turns == 0:
		print ("start user turn")
		users_turn = true


func move_check(): #check to see if user got moves correct
	if !users_turn && !game_running:
		if (comp(moves,user_move)):
			print ("match")
			move_checked = true
			start()
		else:
			print ("Fail")
			move_checked = true
		

func user_move():
	if user_turns == moves.size():
		users_turn = false

	if !move_checked:
		move_check()
	
	if users_turn:
		if Input.is_action_pressed("red"):
			if !red_pressed:
				user_move.push_back("Red")
				user_turns += 1
				print (user_move)
				red_pressed = true
		else:
			red_pressed = false
		
		if Input.is_action_pressed("blue"):
			if !blue_pressed:
				user_move.push_back("Blue")
				user_turns += 1
				print (user_move)
				blue_pressed = true
		else:
			blue_pressed = false
			
		if Input.is_action_pressed("green"):
			if !green_pressed:
				user_move.push_back("Green")
				user_turns += 1
				print (user_move)
				green_pressed = true
		else:
			green_pressed = false
		
		if Input.is_action_pressed("yellow"):
			if !yellow_pressed:
				user_move.push_back("Yellow")
				user_turns += 1
				print (user_move)
				yellow_pressed = true
		else:
			yellow_pressed = false
			
func comp(arr1,arr2):
   if (arr1.size() == arr2.size()):
      for i in range(arr1.size()):
         if (arr1[i] != arr2[i]):
            return false
      return true
   else:
      return false