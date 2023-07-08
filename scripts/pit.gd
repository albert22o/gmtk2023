extends Node2D

var is_on = false

func _ready():
	pass 

func Change_state():
	
	if is_on==false:
		is_on=true
		$MeshInstance2D.self_modulate = Color.red
		$Area2D/CollisionShape2D.disabled=false
	else:
		print(676767)
		is_on=false
		$MeshInstance2D.self_modulate = Color.oldlace
		$Area2D/CollisionShape2D.disabled=true
