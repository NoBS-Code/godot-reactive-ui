class_name ReactiveObject
extends Reactive

func _init(initial_value : Object, initial_owner : Reactive = null) -> void:
    super._init(initial_owner)
    value = initial_value

var value : Object:
    set(v):
        if value != null and value is Reactive:
            value.reactive_changed.disconnect(_propagate)
        value = v
        if value != null and value is Reactive:
            value.reactive_changed.connect(_propagate)
        reactive_changed.emit(self)
        return value