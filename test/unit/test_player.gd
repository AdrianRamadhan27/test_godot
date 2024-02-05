extends 'res://addons/gut/test.gd'

var Player = load("res://scripts/Player.gd")

func test_start():
	var _player = Player.new()
	var result = _player.some_method()
	
	assert_eq(result, "Something", "Result should be Something")
