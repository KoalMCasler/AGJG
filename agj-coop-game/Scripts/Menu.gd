extends Control
class_name Menu

func _on_Start_Button_button_down():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 
								linear_to_db($Audio_Panel/Audio_Controls/Volume.value))
	var level1 : Node = load("res://Scenes/Level1.tscn").instantiate()
	get_tree().root.add_child(level1)
	level1.get_node("winZone").set_next_level.connect(get_node("../End").set_level)
	visible = false
	


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),
								linear_to_db(value))



func _on_TextureButton_pressed():
	$Audio_Panel/Audio_Controls/Sound_Test_Button/AudioStreamPlayer.play()


func _on_quit_button_button_down() -> void:
	get_tree().quit()
