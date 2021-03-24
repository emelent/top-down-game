extends KinematicBody2D


export(int) var num_points = 10

var points = PoolVector2Array()
var speed = 400

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2.RIGHT * speed * delta)
	elif Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2.LEFT * speed * delta)
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2.UP * speed * delta)
	elif Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2.DOWN * speed * delta)
