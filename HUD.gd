extends CanvasLayer

# TODO: add health bar starting at 10 health
# TODO: health decreases by 1 with each hit by enemy laser

signal start_game
signal show_options
signal options_changed(options)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var options = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Options/BackPick.hide()
	$Options/BackPickLabel.hide()
	$Options/Save.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	var end_msg = "Game Over"
	
	show_message(end_msg)
	yield($MessageTimer, "timeout")  # wait until the MessageTimer has counted down
	
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	$OptionsBtn.show()
	$InstructionsBtn.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	$OptionsBtn.hide()
	$InstructionsBtn.hide()
	emit_signal("start_game")

func _on_Options_pressed():
	$StartButton.hide()
	$OptionsBtn.hide()
	$Message.hide()
	$ScoreLabel.hide()
	$InstructionsBtn.hide()
	$Options/BackPickLabel.show()
	$Options/BackPick.show()
	$Options/Save.show()
	$Options/SpeedOpt.show()
	$Options/SpeedLabel.show()
	$Options/SpeedMid.show()
	$Options/SpeedSlow.show()
	$Options/SpeedFast.show()

func opt_changed_color(color):
	options["color"] = color
	
func return_to_game():
	$Message.show()
	$ScoreLabel.show()
	$StartButton.show()
	$OptionsBtn.show()
	$InstructionsBtn.show()
	
	if options.has("color"):
		emit_signal("options_changed", options)
	if options.has("speed"):
		emit_signal("options_changed", options)

func _on_InstructionsBtn_pressed():
	$StartButton.hide()
	$OptionsBtn.hide()
	$Message.hide()
	$ScoreLabel.hide()
	$InstructionsBtn.hide()
	$Instructions/RichTextLabel.show()
	$Instructions/Return.show()

func opt_changed_speed(speed):
	options["speed"] = speed
