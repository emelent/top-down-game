extends Node

enum PlayerInput {
	KEYBOARD = 0,
	JOYSTICK_1,
	JOYSTICK_2
}

const PLAYER_ACTIONS = {
	"move_left": "move_left",
	"move_right": "move_right",
	"move_up": "move_up",
	"move_down": "move_down",
	"fire": "fire"
}

const GROUP_NAMES = {
	"players": "players",
	"projectiles": "projectiles",
	"walls": "walls",
	"enemies": "enemies",
	"collectables": "collectables",
	"objects": "objects",
	"foreground": "foreground",
	"hitboxes": "hitboxes",
	"hurtboxes": "hurtboxes"
}
