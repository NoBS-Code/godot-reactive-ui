class_name Hero
extends Reactive

var name : ReactiveString = ReactiveString.new("", self)

var strength : ReactiveInt = ReactiveInt.new(0, self)
var wisdom : ReactiveInt = ReactiveInt.new(0, self)
var agility : ReactiveInt = ReactiveInt.new(0, self)
var luck : ReactiveInt = ReactiveInt.new(0, self)
var dexterity : ReactiveInt = ReactiveInt.new(0, self)
var vitality : ReactiveInt = ReactiveInt.new(0, self)

func _init() -> void:
    super._init()

func randomize_stats() -> void:
    strength.value = randi_range(1, 99)
    wisdom.value = randi_range(1, 99)
    agility.value = randi_range(1, 99)
    luck.value = randi_range(1, 99)
    dexterity.value = randi_range(1, 99)
    vitality.value = randi_range(1, 99)