extends Area2D

@export var next_level : int
signal set_next_level(level: int)
var gameManager : GameManager

var playerCount: int

func _process(delta):
	if (playerCount == 2):
		#get_tree().change_scene_to_packed(nextScene)
		emit_signal("set_next_level", next_level)
		$"../End".visible = true

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerCount += 1

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerCount -= 1 # Replace with function body.
