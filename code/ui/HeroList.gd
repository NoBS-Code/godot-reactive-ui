class_name HeroList
extends VBoxContainer

class Item extends MarginContainer:
	var label : Label
	var hero : ReactiveObject = ReactiveObject.new(null)

	func _init(initial_hero : Hero):
		add_theme_constant_override("margin_left", 2)
		add_theme_constant_override("margin_right", 2)
		add_theme_constant_override("margin_top", 2)
		add_theme_constant_override("margin_bottom", 2)
		size_flags_horizontal = Control.SIZE_EXPAND_FILL
		mouse_filter = Control.MOUSE_FILTER_STOP
		
		label = Label.new()
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		add_child(label)
		
		hero.reactive_changed.connect(func(reactive): label.text = reactive.value.name.value if reactive.value != null else "")
		hero.value = initial_hero

	func _gui_input(event: InputEvent) -> void:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if get_parent() is HeroList:
				get_parent().selection.value = hero.value

	func _draw() -> void:
		var list = get_parent()
		if list is HeroList and list.selection != null and list.selection.value == hero.value:
			draw_rect(Rect2(0, 0, size.x, size.y), Color(0.85, 0.79, 0.64), false, 1, false)

var selection : ReactiveObject = null:
	set(value):
		if selection != null:
			selection.reactive_changed.disconnect(on_selection_changed)
		if value != null:
			value.reactive_changed.connect(on_selection_changed)
		selection = value
		return selection

func on_selection_changed(_reactive):
	for child in get_children():
		child.queue_redraw()

func rebuild_from_list(heroes : Array, select_hero : Hero) -> void:
	var children = get_children()
	for c in children:
		c.queue_free()

	for hero in heroes:
		var item : Item = Item.new(hero)
		add_child(item)
		if item.hero.value == select_hero:
			selection.value = item.hero.value