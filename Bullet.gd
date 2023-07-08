extends KinematicBody2D

export (int) var speed = 50000

var velocity = Vector2()
var angle

func _physics_process(delta):
	
	move_and_slide(velocity * speed * delta)


func _on_Area2D_body_entered(body):
	if(body.is_in_group("unit")):
		body.Destroy()
		self.queue_free()
