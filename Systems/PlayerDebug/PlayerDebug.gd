extends Node2D


export(float) var hpDelta = 10
export(bool) var display = true setget set_display

onready var player: Player = get_parent()
onready var player_name_label: Label = $PlayerName
onready var player_state_label: Label = $PlayerState

func _ready():
    call_deferred("__setup")
    pass

func _input(event):
    if Input.is_action_just_pressed("debug_damage"):
        player.health.damage(hpDelta)
    if Input.is_action_just_pressed("debug_heal"):
        player.health.heal(hpDelta)

func __setup():
    player_name_label.text = "%s (%d)" % [player.player_name, player.health.hp]
    player.state_machine.connect("state_changed", self, "__on_state_changed")
    player.health.connect("hp_changed", self, "__on_hp_changed")

func __on_state_changed(new_state):
    if !display: return
    if new_state == null: return
    player_state_label.text = new_state

func __on_hp_changed(new_hp):
    if !display: return
    player_name_label.text = "%s (%d)" % [player.player_name, new_hp]


func set_display(new_display):
    display = new_display
    if !display:
        player_name_label.hide()
        player_state_label.hide()
    else:
        player_name_label.show()
        player_state_label.show()
