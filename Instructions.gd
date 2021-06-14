extends CanvasLayer

signal return_to_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = "Move out of the way of the enemies. You lose as soon as you are hit. Your score represents how long you lasted before you died."


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Return_pressed():
	$RichTextLabel.hide()
	$Return.hide()
	emit_signal("return_to_game")
