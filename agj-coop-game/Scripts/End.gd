extends Control
class_name End

var level : int = 1

@export var winZone : Node2D

func _ready():
	if winZone != null:
		winZone.connect("set_next_level", set_level)

func set_level(lvl: int):
	level = lvl
	if level == -1:
		var playAgainButton : Button = get_node("Score_Panel/Layout/Buttons/PlayAgain")
		playAgainButton.disabled = true

func _on_PlayAgain_pressed():
	var levelName = "res://Scenes/Level{0}.tscn".format([level])
	if get_tree().change_scene_to_file(levelName) != OK:
			print ("Error changing scene to {0}".format(levelName))


func _on_BackToMenu_pressed():
	if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")
