extends Node
var trial = 1

func _ready():
	new_session()

func new_session():
	$StartTimer.start()
	$HUD.show_message("Session Start")
	next_trial(trial)

func end_session():
	$HUD.show_message("Session End")
	$Gabor.queue_free()

func _on_Gabor_hit():
	$HUD.show_message("Hit")
	trial += 1
	next_trial(trial)

func next_trial(trial_num):
	print("Trial Start: ",trial_num)
	match trial_num:
		1:
			$Gabor.start($LeftStartPosition.position)
			$Gabor.change_texture("res://gabor_11.jpg")
		2:
			$Gabor.start($RightStartPosition.position)
			$Gabor.change_texture("res://gabor_12.jpg")
		3:
			$Gabor.start($LeftStartPosition.position)
			$Gabor.change_texture("res://gabor_13.jpg")
		_:
			end_session()
