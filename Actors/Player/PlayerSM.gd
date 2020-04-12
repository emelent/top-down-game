extends StateMachine


onready var player:Player  = get_parent()


func _ready():
    add_state("fire")
    add_state("walk")
    add_state("idle")
    call_deferred("set_state", states.idle)

    # connect mech fire_cooldown_timer
    call_deferred("__setup")

func __setup():
    player.mech.fire_cooldown_timer.connect("timeout", self, "__fire_cooldown_timeout")


func _input(event):
    if Input.is_action_just_pressed(player.input_name + Global.PLAYER_ACTIONS.fire):
        if player.mech.fire():
            set_state(states.fire)
            player.motion = Vector2.ZERO



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
    player.mech.sprite.animation = get_state_name(new_state)
    match new_state:
        states.idle:
            pass
        states.walk:
            pass
        states.fire:
            player.motion = Vector2.ZERO
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
        player.mech.rotation_degrees = -90
    elif Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_right):
        player.motion.x = 1
        player.mech.rotation_degrees = 90

    # vertical motion
    elif Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_up):
        player.motion.y = -1
        player.mech.rotation_degrees = 0

    elif Input.is_action_pressed(player.input_name + Global.PLAYER_ACTIONS.move_down):
        player.motion.y = 1
        player.mech.rotation_degrees = 180

func __fire_cooldown_timeout():
    set_state(states.idle)
