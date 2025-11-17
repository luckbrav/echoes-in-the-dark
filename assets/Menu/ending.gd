extends Control


@onready var start_button = $VBoxContainer/CenterContainer/VBoxContainer/StartButton
@onready var quit_button = $VBoxContainer/CenterContainer/VBoxContainer/QuitButton

@export var game_scene: PackedScene = null

func _ready() -> void:
	start_button.pressed.connect(on_start_pressed)
	quit_button.pressed.connect(on_quit_pressed)

func on_start_pressed():
	if game_scene != null:
		get_tree().change_scene_to_packed(game_scene)
	else:
		print("ERRO: A cena do jogo (Game Scene) não foi definida no Inspetor!")

func on_quit_pressed():
	get_tree().quit()
