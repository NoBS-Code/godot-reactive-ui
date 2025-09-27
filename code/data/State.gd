extends Node

var available_heroes : ReactiveArray = ReactiveArray.new()
var hired_heroes : ReactiveArray = ReactiveArray.new()

func create_hero(hero_name : String) -> Hero:
    var tmp = Hero.new()
    tmp.name.value = hero_name
    tmp.randomize_stats()
    return tmp

func _init() -> void:
    # Setting up some heroes for testing purposes...
    available_heroes.append(create_hero("Arthur"))
    available_heroes.append(create_hero("Bernard"))
    available_heroes.append(create_hero("Charlie"))