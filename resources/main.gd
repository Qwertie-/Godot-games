extends Node2D

var moves         = []
var cubes         = []
var pressed
var enter_pressed  

func _ready():
	cubes.push_back("Red")
	cubes.push_back("Blue")
	cubes.push_back("Green")
	cubes.push_back("Yellow")
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


func start():
	print ("Game started")
	var i = 0
	print (moves.size())
	while i < moves.size():
		if moves[i] == "Red":
			print ("Move " + str(i) + " " + "is red")
			
		elif moves[i] == "Blue":
			print ("Move " + str(i) + " " + "is blue")
			
		elif moves[i] == "Green":
			print ("Move " + str(i) + " " + "is Green")
			
		elif moves[i] == "Yellow":
			print ("Move " + str(i) + " " + "is Yellow")
			
		i += 1



func new_move():
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
