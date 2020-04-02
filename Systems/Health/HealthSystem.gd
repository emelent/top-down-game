extends Node
class_name HealthSystem

export(float) var max_hp = 100

export(float) var hp = 100


signal on_damaged
signal on_healed
signal on_hp_zero
signal on_hp_changed

func _ready():
    hp = min(max_hp, hp)

func damage(points):
	points = -abs(points)
	if points == 0:
		return
	hp = min(hp + points, 0)
	emit_signal("on_hp_changed", hp)
	emit_signal("on_damaged", points)
	if hp == 0:
		emit_signal("on_hp_zero")

func heal(points):
	points = abs(points)
	if points == 0:
		return
	hp = min(hp + points, max_hp)
	emit_signal("on_hp_changed", hp)
	emit_signal("on_healed", points)

func get_hp_percentage():
    return hp / max_hp
