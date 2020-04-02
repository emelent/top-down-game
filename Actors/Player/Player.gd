extends Actor
class_name Player

export(Global.PlayerInput) var player_input = Global.PlayerInput.KEYBOARD setget set_player_input
export(Color) var player_color = Color.blueviolet

onready var pivot = $Pivot
onready var animated_sprite: AnimatedSprite = $Pivot/AnimatedSprite
onready var state_machine: StateMachine = $StateMachine
onready var name_label = $NameLabel
onready var state_label = $StateLabel

var input_name = "input_%d__"  % (player_input)
var player_name = ""

func _ready():
    # just for now, we'll sort this later when we have controls
    set_player_input(player_input)
    state_machine.connect("state_changed", self, "__on_state_changed")
    animated_sprite.self_modulate = player_color
    pass

func set_player_input(new_value):
    player_input = new_value
    input_name = "input_%d__"  % (new_value)
    GameManager.add_player(new_value)
    player_name = GameManager.get_player_name(new_value)
    name_label.text = player_name

func __on_state_changed(new_state):
    if new_state == null: return
    state_label.text = new_state
