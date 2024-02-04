extends Node
var drop_scene : PackedScene
var score
var health
# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.hide()
	#pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
	




func _on_blood_timer_timeout():
	spawn_drop() # Replace with function body.
	
func spawn_drop():
	# Create a new instance of the waterdrop scene
	var drop_instance = drop_scene.instantiate()

	# Get the size of the visible viewport
	var viewport_size = get_viewport().get_visible_rect().size

	# Set random position along the top edge of the screen
	var x_position = randf_range(0, viewport_size.x)
	var y_position = 0  # Place above the visible screen
	drop_instance.position = Vector2(x_position, y_position)

	# Add the drop to the scene
	add_child(drop_instance)


func _on_health_timer_timeout():
	$HealthBar.value -= 5


func _on_player_hit():
	$HealthBar.value += 3


func _on_hud_start_game():
	$Player.start($StartPosition.position)
	drop_scene = preload("res://scenes/blood.tscn")
	$HealthBar.show()
	$HealthBar.value = 100
	$HealthTimer.start()
	$BloodTimer.start()


func _on_health_bar_value_changed(value):
	if value == 0:
		$HUD.show_game_over()
		$HealthBar.hide()
		$HealthTimer.stop()
		$BloodTimer.stop()
