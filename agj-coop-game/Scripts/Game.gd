extends Control
class_name GameManager

@export var player1Input: InputManager
@export var player2Input: InputManager
@export var player1:PlayerController
@export var player2:PlayerController

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = 115

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 1
var spawn_2_beat = 1
var spawn_3_beat = 1
var spawn_4_beat = 1

var lane = 0
var rand = 0
var note = load("res://Scenes/Note.tscn")
var instance1
var instance2

@onready var endScreen = $End

@export var p1BSpawn:Node2D
@export var p2Bspawn:Node2D


func _ready():
	randomize()
	$Conductor.play_with_beat_offset(6)


func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")
	if event.is_action("reloadLevel"):
		get_tree().reload_current_scene()

func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats > 36:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 404:
		if get_tree().change_scene_to_file("res://Scenes/End.tscn") != OK:
			print ("Error changing scene to End")



func _spawn_notes(to_spawn):
	if to_spawn > 0:
		instance1 = note.instantiate()
		instance1.initialize(1,self)
		add_child(instance1)
		instance2 = note.instantiate()
		instance2.initialize(2,self)
		add_child(instance2)
