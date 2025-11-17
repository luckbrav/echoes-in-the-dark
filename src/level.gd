extends Node3D

@onready var player = $GridMap/Player
@onready var orb_container = $GridMap/OrbContainer

#@export var win_scene: Control = null

var collected_orbs = 0
var total_orb_count = 0

func _ready() -> void:
	total_orb_count = orb_container.get_child_count()
	
	player.orb_collected.connect(on_orb_collected)
	
func on_orb_collected():
	collected_orbs += 1
	
	# Adicionei um print para ajudar a testar
	print("Orb coletado! Total: ", collected_orbs, "/", total_orb_count)
	
	if collected_orbs >= total_orb_count:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://Menu/ending.tscn")
