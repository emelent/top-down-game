extends Node2D
class_name BasicMech


export(float) var fire_rate = 5  setget set_fire_rate
export(float) var projectile_speed = 500
export (PackedScene) var projectile_scene = preload('res://Objects/BasicBullet/BasicBullet.tscn')
export(Color) var color = Color.white setget set_color

onready var sprite: AnimatedSprite = $Sprite
onready var fire_cooldown_timer: Timer = $FireCooldownTimer
onready var fire_point: Position2D = $FirePoint
onready var hurtbox: Area2D = $HurtBox

var can_fire = true


func _ready():
	# connect fire cooldown timer
	fire_cooldown_timer.wait_time =  1 / fire_rate
	fire_cooldown_timer.connect("timeout", self, "__fire_cooldown_timeout")


func __fire_cooldown_timeout():
	can_fire = true


func fire():
	if not can_fire: return false

	can_fire = false
	fire_cooldown_timer.start()
	# spawn projectile
	var projectile: Projectile = projectile_scene.instance()
	projectile.global_position = fire_point.global_position
	projectile.rotation = rotation
	projectile.initial_speed = projectile_speed
#    projectile.velocity = projectile_speed
	get_viewport().add_child(projectile)
	return true

func set_fire_rate(new_fire_rate):
	fire_rate = new_fire_rate
	if fire_cooldown_timer  != null:
		fire_cooldown_timer.wait_time =  1 / fire_rate

func set_color(new_color):
	color = new_color
	sprite.modulate = color
