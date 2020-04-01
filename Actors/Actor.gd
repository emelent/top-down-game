extends KinematicBody2D
class_name Actor


export(float) var speed = 100

var motion = Vector2.ZERO

func _physics_process(delta):
    move_and_collide(motion * speed * delta)

func is_moving():
    return motion.length() != 0
