extends Actor
class_name Player

export(Global.PlayerInput) var player_input = Global.PlayerInput.KEYBOARD setget set_player_input
export(Color) var player_color = Color.blueviolet
export var max_crosshairs_dist = 120


onready var state_machine: StateMachine = $StateMachine
onready var health: HealthSystem = $HealthSystem
onready var name_label = $NameLabel
onready var state_label = $StateLabel
onready var mech: BasicMech = $BasicMech
onready var crosshairs = $CrossHairs


var input_name = "input_%d__"  % (player_input)
var player_name = ""

signal player_damaged
signal player_healed
signal player_died


func _ready():
	# just for now, we'll sort this later when we have controls
	set_player_input(player_input)
	mech.color = player_color

	# connect hurtbox signals
	mech.hurtbox.connect("area_entered", self, "__on_hurtbox_area_entered")


func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var crosshairs_pos = (mouse_pos - global_position).normalized() * max_crosshairs_dist

	crosshairs.rotation = Vector2.RIGHT.angle_to(mouse_pos) * 2
	crosshairs.position = crosshairs_pos

# ----------------------
# custom methods
# ----------------------

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


