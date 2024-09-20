extends Control

var lastInputDevice = -1
var isMouseOnPad = false

func _input(event: InputEvent) -> void:
	if event.device == 0:
		if event.device == lastInputDevice:
			if not isMouseOnPad:
				$Control.hide()
		else:
			$Control.show()
	else:
		$Control.show()
	lastInputDevice=event.device
func _on_left_buttons_mouse_entered() -> void:
	isMouseOnPad=true
	pass # Replace with function body.


func _on_left_buttons_mouse_exited() -> void:
	isMouseOnPad=false
	pass # Replace with function body.
