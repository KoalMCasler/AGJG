extends Control
class_name End

var level : int = 1

func set_level(lvl: int):
	level = lvl
	if level == -1:
		var playAgainButton : Button = get_node("Score_Panel/Layout/Buttons/PlayAgain")
		playAgainButton.disabled = true

func _on_PlayAgain_pressed():
	var levelName = "res://Scenes/Level{0}.tscn".format([level])
	var nextLevel = load(levelName).instantiate()
	add_child(nextLevel)
	nextLevel.get_node("winZone").set_next_level.connect(get_node("../End").set_level)
	#if get_tree().change_scene_to_file(levelName) != OK:
			#print ("Error changing scene to Game")


func _on_BackToMenu_pressed():
	if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")
