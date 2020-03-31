extends Node2D


export(Global.PlayerInput) var player_input = Global.PlayerInput.KEYBOARD setget __set_player_input

onready var player:Actor  = get_parent()

var input_name = "input_%d__"  % (player_input)


func _process(delta):
    player.motion = Vector2.ZERO

    # horizontal motion
    if Input.is_action_pressed(input_name + Global.PLAYER_ACTIONS.move_left):
        player.motion.x = -1
    elif Input.is_action_pressed(input_name + Global.PLAYER_ACTIONS.move_right):
        player.motion.x = 1

    # vertical motion
    if Input.is_action_pressed(input_name + Global.PLAYER_ACTIONS.move_up):
        player.motion.y = -1
    elif Input.is_action_pressed(input_name + Global.PLAYER_ACTIONS.move_down):
        player.motion.y = 1

func __set_player_input(new_value):
    player_input = new_value
    input_name = "input_%d__"  % (new_value)
