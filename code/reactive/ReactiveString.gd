class_name ReactiveString
extends Reactive

func _init(initial_value : String, initial_owner : Reactive = null) -> void:
    super._init(initial_owner)
    value = initial_value

var value : String:
    set(v):
        value = v
        reactive_changed.emit(self)
        return value