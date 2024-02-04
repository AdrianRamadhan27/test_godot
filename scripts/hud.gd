extends CanvasLayer

signal start_game

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$LeftButton.hide()
	$RightButton.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreLabel.text = str(score)


func _on_play_button_pressed():
	show_message("Get the bloods!")
	score = 0
	$ScoreTimer.start()
	$Title.hide()
	$PlayButton.hide()
	$LeftButton.show()
	$RightButton.show()
	start_game.emit()


func _on_score_timer_timeout():
	score += 1
	
func show_game_over():
	$ScoreTimer.stop()
	
	$Message.text = "Game Over!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$Title.show()
	$PlayButton.show()
	$LeftButton.hide()
	$RightButton.hide()
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	


func _on_message_timer_timeout():
	$Message.hide()
