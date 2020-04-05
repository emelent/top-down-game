extends Actor
class_name Player

export(Global.PlayerInput) var player_input = Global.PlayerInput.KEYBOARD setget set_player_input
export(Color) var player_color = Color.blueviolet

onready var pivot = $Pivot
onready var animated_sprite: AnimatedSprite = $Pivot/AnimatedSprite
onready var hurtbox: Area2D = $Pivot/Hurtbox
onready var state_machine: StateMachine = $StateMachine
onready var health: HealthSystem = $HealthSystem
onready var name_label = $NameLabel
onready var state_label = $StateLabel


var input_name = "input_%d__"  % (player_input)
var player_name = ""

signal player_damaged
signal player_healed
signal player_died


func _ready():
    # just for now, we'll sort this later when we have controls
    set_player_input(player_input)
    animated_sprite.self_modulate = player_color

    # connect hurtbox signals
    hurtbox.connect("area_entered", self, "__on_hurtbox_area_entered")

    pass

func set_player_input(new_value):
    player_input = new_value
    input_name = "input_%d__"  % (new_value)
    GameManager.add_player(new_value)
    player_name = GameManager.get_player_name(new_value)


# -----------------------
# Signals
# -----------------------

func __on_hurtbox_area_entered(area):
    if area.is_in_group(Global.GROUP_NAMES.projectiles):
        health.damage(area.damage)
        area.queue_free()
        # trigger damage effect
    pass


