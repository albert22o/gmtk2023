extends KinematicBody2D

onready var navig = $NavigationAgent2D
export var speed = 100

func _ready():
	Find_paht()
	pass

func _physics_process(delta):
	Walk_to_target()
	pass


func Find_paht():
	var mas = get_tree().get_nodes_in_group("exit")
	var target = mas[0]
	navig.set_target_location(target.global_position)


func Walk_to_target():
	var direction = global_position.direction_to(navig.get_next_location())
	var velocity = direction*speed
	move_and_slide(velocity)
	pass

func Destroy():
	self.queue_free()
