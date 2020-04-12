extends Area2D



func _ready():
    connect("area_entered", self, "__on_area_entered")

func __on_area_entered(area):
    if area.is_in_group(Global.GROUP_NAMES.projectiles):
        area.queue_free()
    pass
