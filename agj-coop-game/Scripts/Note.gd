extends Area2D

var SPAWN = Vector2(0,0)

var playerNum = 0

var speed = 0
var hit = false
var screenLimit = 0

var GameVar

func _ready():
	GameVar = $"."
	pass


func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > screenLimit + 30:
			queue_free()
	else:
		$Node2D.position.y -= speed * delta


func initialize(num, game):
	playerNum = num
	GameVar = game
	var DIST_TO_TARGET = 0.0
	if playerNum == 1:
		SPAWN = GameVar.p1BSpawn.position
		DIST_TO_TARGET = GameVar.p1Tracker.position.y - SPAWN.y
		screenLimit = GameVar.p1Tracker.position.y
	elif playerNum == 2:
		SPAWN = GameVar.p2Bspawn.position
		DIST_TO_TARGET = GameVar.p2Tracker.position.y - SPAWN.y
		screenLimit = GameVar.p2Tracker.position.y
	$AnimatedSprite2D.frame = 1
	position = SPAWN
	speed = DIST_TO_TARGET / 2.0


func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "GREAT"
		$Node2D/Label.modulate = Color("f6d6bd")
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		$Node2D/Label.modulate = Color("c3a38a")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$Node2D/Label.modulate = Color("997577")


func _on_Timer_timeout():
	queue_free()
