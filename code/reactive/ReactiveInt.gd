class_name ReactiveInt
extends Reactive

func _init(initial_value : int, initial_owner : Reactive = null) -> void:
    super._init(initial_owner)
    value = initial_value

var value : int:
    set(v):
        value = v
        reactive_changed.emit(self)
        return value