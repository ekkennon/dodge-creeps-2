extends CanvasLayer

# TODO: add kepmapping options
# TODO: add option to turn off music
# TODO: add option to turn off sound effects

signal col_changed(color)
signal speed_changed(speed)
signal opt_saved

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# this should default the Color Picker to the current background color
	pass

func _on_ColorPickerButton_color_changed(color):
	emit_signal("col_changed", color)

func _on_Save_pressed():
	$BackPickLabel.hide()
	$BackPick.hide()
	$SpeedOpt.hide()
	$SpeedLabel.hide()
	$SpeedMid.hide()
	$SpeedSlow.hide()
	$SpeedFast.hide()
	$Save.hide()
	emit_signal("opt_saved")

func _on_SpeedSlow_pressed():
	$SpeedOpt.value = 0

func _on_SpeedMid_pressed():
	$SpeedOpt.value = 1

func _on_SpeedFast_pressed():
	$SpeedOpt.value = 2

func _on_SpeedOpt_changed():
	emit_signal("speed_changed", $SpeedOpt.value)
