extends Area2D

@export var nextScene: PackedScene

var playerCount: int
func _ready():
	pass

func _process(delta):
	if (playerCount == 2):
		get_tree().change_scene_to_packed(nextScene)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerCount += 1

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerCount -= 1 # Replace with function body.
