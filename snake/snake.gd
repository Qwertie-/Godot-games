extends Node2D
var body = preload("res://body.xml")
var direction = Vector2(1,0)
var snake = ["Body1","Body2"]
var body_count = 3
var last = 0

func _ready():
	set_process(true)
	get_node("Timer").start()

func _on_Timer_timeout():
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
