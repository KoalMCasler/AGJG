extends Sprite2D
class_name InGameButton

@export_range(0,2) var buttonStyle : int
@export var buttonOptionsUp : Array[Texture2D]
@export var buttonOptionsDown : Array[Texture2D]
@export var pairedButton : InGameButton
@export var targetObject : Gate

signal activate

var isActivated : bool

func _ready():
	isActivated = false

func _process(delta: float):
	if(isActivated):
		self.texture = buttonOptionsDown[buttonStyle]
	else:
		self.texture = buttonOptionsUp[buttonStyle]
	if (pairedButton != null):
		if(isActivated and pairedButton.isActivated and !targetObject.gateIsOpen):
			targetObject.open_gate()
	else:
		if(isActivated and !targetObject.gateIsOpen):
			targetObject.open_gate()


func _on_area_2d_body_entered(body: PlayerController):
	isActivated = true
