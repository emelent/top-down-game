extends Actor
class_name Player

export(Global.PlayerInput) var player_input = Global.PlayerInput.KEYBOARD setget set_player_input

onready var animated_sprite: AnimatedSprite = $AnimatedSprite
onready var state_machine: StateMachine = $StateMachine
onready var label: Label = $Label

var input_name = "input_%d__"  % (player_input)
var player_name = ""

func _ready():
    # just for now, we'll sort this later when we have controls
    set_player_input(player_input)
    pass
func set_player_input(new_value):
    player_input = new_value
    input_name = "input_%d__"  % (new_value)
    GameManager.add_player(new_value)
    player_name = GameManager.get_player_name(new_value)
    label.text = player_name
