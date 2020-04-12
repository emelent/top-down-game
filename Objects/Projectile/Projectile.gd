extends Area2D
class_name Projectile

export(float) var radius = 20
export(float) var initial_speed = 400

var damage = 10
onready var velocity = Vector2.UP.rotated(rotation) * initial_speed

func _physics_process(delta):
    # move
    position = position + (velocity * delta)
    pass
