extends Node

var coins = 100
var sponges = 3
var first_aid = 3
var high_score = 0

func add_coin(x):
	coins += x
	
func spend_coin(x):
	coins -= x
	
func add_sponge():
	sponges += 1
	
func add_first_aid():
	first_aid += 1
	
func get_coins():
	return coins
	
func get_sponges():
	return sponges
	
func get_first_aid():
	return first_aid

