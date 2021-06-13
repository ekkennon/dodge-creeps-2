extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var Enemy
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$Music.stop()
	$DeathSound.play()
	$ScoreTimer.stop()
	$EnemyTimer.stop()
	$HUD.show_game_over()
	get_tree().call_group("mob", "queue_free")

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_StartTimer_timeout():
	$EnemyTimer.start()
	$ScoreTimer.start()

func _on_EnemyTimer_timeout():
	$EnemyPath/EnemySpawnLocation.offset = randi()  # choose a random location on Path2D (EnemyPath)
	var enemy = Enemy.instance()
	add_child(enemy)
	
	var direction = $EnemyPath/EnemySpawnLocation.rotation + PI / 2
	enemy.position = $EnemyPath/EnemySpawnLocation.position
	direction += rand_range(-PI / 4, PI / 4)
	enemy.rotation = direction
	
	# velocity is speed and direction
	enemy.linear_velocity = Vector2(rand_range(enemy.min_speed, enemy.max_speed), 0)
	enemy.linear_velocity = enemy.linear_velocity.rotated(direction)

func new_player_settings(options):
	if options.has("color"):
		$Background.color = options["color"]
	
