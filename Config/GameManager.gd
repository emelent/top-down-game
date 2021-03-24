extends Node

const MAX_PLAYERS = 4

var player_inputs = {}
var player_ids = [0, 1, 2, 3]

func _ready():
#    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _input(event):
	if event.is_action_pressed("quit") and OS.is_debug_build():
		get_tree().quit()

func add_player(input):
	if not player_inputs.has(input) and player_inputs.size() < MAX_PLAYERS:
		player_inputs[input] = player_ids.pop_front()

func remove_player(input):
	player_ids.push_back(player_inputs[input])
	player_inputs.erase(input)
	player_ids.sort()

func get_player_id(input):
	return player_inputs[input]

func get_player_name(input):
	return "Player %d" % get_player_number(input)

func get_player_number(input):
	return (player_inputs[input] + 1)

func num_players():
	return player_inputs.size()
