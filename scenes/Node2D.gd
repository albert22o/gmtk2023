extends Node2D

var wall
var wall_color1: Color = Color(0, 0, 0)
var wall_color2: Color = Color(1, 1, 1)
var wall_zone
var collision_zone
var state:bool = false
var mouse_position
var press = false
var orig_position

func _ready():
	wall = $"../../Wall"
	collision_zone = $"../../Colision_zone"
	orig_position = wall.global_position

func _process(delta):
	if press:
		mouse_position = get_global_mouse_position()
		wall.global_position = mouse_position
		if wall.intersect(collision_zone):
			wall.self_modulate = Color.chartreuse
			state = true
		else:
			state = false
			wall.self_modulate = Color.orangered

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and state:
			var loadedNode = preload("res://scenes/StateWall.tscn")
			var make = loadedNode.instance()
			make.global_position = mouse_position
			add_child(make)
			press = false
			wall.global_position = orig_position
			



func _on_Spawn_button_down():
	press = true
