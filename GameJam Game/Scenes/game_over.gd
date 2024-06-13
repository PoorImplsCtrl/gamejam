extends CanvasLayer

signal hardmode
signal easymode
signal restart

func _on_easy_button_pressed():
	easymode.emit()
	restart.emit()

func _on_hard_button_pressed():
	hardmode.emit()
	restart.emit()
