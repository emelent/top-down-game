extends StateMachine


onready var player:Player  = get_parent()


func _ready():

    add_state("walk")
    add_state("idle")
    call_deferred("set_state", states.idle)

func __get_next_state(delta):
    match state:
        states.idle:
            if player.is_moving():
                return states.walk

        states.walk:
            if not player.is_moving():
                return states.idle

    return null

func __enter_state(new_state, old_state):
    player.animated_sprite.animation = get_state_name(new_state)
    match new_state:
        states.idle:
            pass
        states.walk:
            pass


func __exit_state(old_state, new_state):
    match old_state:
        states.idle:
            pass
        states.walk:
            pass
    pass


func _process(delta):
    match state:
        states.idle:
            __handle_movement_input()

        states.walk:
            __handle_movement_input()

    var next_state = __get_next_state(delta)
    if next_state != null:
        set_state(next_state)


func __handle_movement_input():
    player.motion = Vector2.ZERO

    # horizontal motion
    if Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_left):
        player.motion.x = -1
        player.pivot.scale.x = -1
    elif Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_right):
        player.motion.x = 1
        player.pivot.scale.x = 1
    # vertical motion
    if Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_up):
        player.motion.y = -1
    elif Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_down):
        player.motion.y = 1

