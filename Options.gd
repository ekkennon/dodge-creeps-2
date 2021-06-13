extends CanvasLayer

signal col_changed(color)
signal subtitles_changed(sub_state)
signal opt_saved

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# this should default the Color Picker to the current background color
	$SubtitlesOpt.show()
	$BackPick.show()
	$BackPickLabel.show()

func _on_ColorPickerButton_color_changed(color):
	emit_signal("col_changed", color)

func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		$SubtitlesOpt.text = "Subtitles On"
	else:
		$SubtitlesOpt.text = "Subtitles Off"
	
	emit_signal("subtitles_changed", button_pressed)

func _on_Save_pressed():
	$SubtitlesOpt.hide()
	$BackPickLabel.hide()
	$BackPick.hide()
	$Save.hide()
	emit_signal("opt_saved")
