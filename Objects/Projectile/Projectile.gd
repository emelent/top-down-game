extends Area2D
class_name Projectile

export(float) var radius = 20
export(float) var initial_speed = 200

var damage = 10
onready var velocity = Vector2.UP * initial_speed

func _process(delta):
    # move
    position = position + (velocity * delta)
    # check if offscreen
    var rect = Rect2(global_position - Vector2(radius, radius), Vector2(radius, radius))
    if Utils.is_offscreen(rect):
        queue_free()
    pass
