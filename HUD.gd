extends CanvasLayer

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func _on_MessageTimer_timeout():
	$Message.hide()
