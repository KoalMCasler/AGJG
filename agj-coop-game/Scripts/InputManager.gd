extends AnimatedSprite2D
class_name InputManager

var perfect = false
var good = false
var okay = false
var current_note = null
@export_range(1,2) var playerNum = 0
## movement signals
signal moveP1Up
signal moveP1Down
signal moveP1Left
signal moveP1Right
signal moveP2Up
signal moveP2Down
signal moveP2Left
signal moveP2Right

func _unhandled_input(event):
	if playerNum == 1:
		if event.is_action("P1up"):
			var input = "P1up"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP1Up")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP1Up")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP1Up")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		if event.is_action("P1down"):
			var input = "P1down"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP1Down")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP1Down")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP1Down")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		if event.is_action("P1left"):
			var input = "P1left"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP1Left")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP1Left")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP1Left")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		if event.is_action("P1right"):
			var input = "P1right"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP1Right")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP1Right")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP1Right")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
	if playerNum == 2:
		if event.is_action("P2down"):
			var input = "P2down"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP2Down")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP2Down")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP2Down")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		if event.is_action("P2up"):
			var input = "P2up"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP2Up")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP2Up")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP2Up")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		if event.is_action("P2left"):
			var input = "P2left"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP2Left")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP2Left")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP2Left")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		if event.is_action("P2right"):
			var input = "P2right"
			if event.is_action_pressed(input, false):
				if current_note != null:
					if perfect:
						emit_signal("moveP2Right")
						current_note.destroy(3)
					elif good:
						emit_signal("moveP2Right")
						current_note.destroy(2)
					elif okay:
						emit_signal("moveP2Right")
						current_note.destroy(2)
					_reset()
			if event.is_action_pressed(input):
				frame = 3
			elif event.is_action_released(input):
				$PushTimer.start()
		


func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note"):
		perfect = true


func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note"):
		perfect = false


func _on_GoodArea_area_entered(area):
	if area.is_in_group("note"):
		good = true


func _on_GoodArea_area_exited(area):
	if area.is_in_group("note"):
		good = false


func _on_OkayArea_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area


func _on_OkayArea_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		current_note = null


func _on_PushTimer_timeout():
	frame = 2


func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false
