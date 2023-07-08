extends Node2D

export (PackedScene) var bull
var enemy_array = []
var enemy
var ready = true

func _process(delta):
	if(enemy_array.size() != 0):
		select_enemy()
#		turn()
		
		if(ready):
			fire()
	else:
		enemy = null

func turn():
	look_at(enemy.position)


func fire():
	ready = false
	
	var b = bull.instance()
	add_child(b)
	var velo = self.global_position.direction_to(enemy.global_position).normalized()
#	print(velo)
	b.velocity = velo
	b.global_position=global_position
	yield(get_tree().create_timer(2), "timeout")
	ready = true


func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.global_position.distance_to(global_position))
		
	var min_offset = enemy_progress_array.min()
	
	
	var enemy_index = enemy_progress_array.find(min_offset)
	enemy = enemy_array[enemy_index]

func _on_Area2D_body_entered(body):
	if(body.is_in_group("unit")):
		enemy_array.append(body)


func _on_Area2D_body_exited(body):
	if(body.is_in_group("unit")):
		enemy_array.erase(body)
