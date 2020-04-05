tool
extends Node2D

export var width = 100
export var height = 100
export(float) var fire_rate = 1
export (PackedScene) var projectile_scene = preload('res://Objects/Projectile/Projectile.tscn')

onready var fire_point = $FirePoint
onready var fire_timer = $FireTimer
onready var projectiles = $Projectiles


var target


func _ready():
    fire_timer.wait_time = fire_rate
    fire_timer.connect("timeout", self, "fire")
    fire_timer.start()

func _draw():
#    if Engine.editor_hint:
    draw_circle(fire_point.position, 5, Color.red)

func fire():
    var projectile: Projectile = projectile_scene.instance()
    projectile.position = fire_point.position

#    projectiles.add_child(projectile)
    add_child(projectile)
