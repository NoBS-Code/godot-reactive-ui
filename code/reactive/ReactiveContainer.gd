class_name ReactiveContainer
extends Reactive

#func _init() -> void:
#	var props = get_script().get_script_property_list()
#	for prop in props:
#		var attr_value = get(prop.name)
#		if attr_value is Reactive:
#			attr_value.reactive_changed.connect(func(_reactive): reactive_changed.emit(self))

# TODO: This is bad, because when a property's value is reassigned, the signal isn't removed from the old, or added to the new value.