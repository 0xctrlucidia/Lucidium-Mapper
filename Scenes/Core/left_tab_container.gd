extends Control
### This script is used to keep the Right Tab Container from resizing this one
### This is Very, Very hacky
### It shouldn't be required but I can't figure out for the life of me 
### how the editor manages 3 fucking horizontal controls 
### THERE IS 2 BUILT IN. AND 2 ALONE. WHAT THE FUCK
### WHY THE HELL DO I HAVE TO HACK THIS? 
### WHY IS HACK YELLOW
### WHAT THE FUCKKKKKKKKKKK

### Required because the UI minimum size gets fucked by this hack
@export var real_minimum_size : int = 160

func _on_h_split_container_dragged(_offset: int) -> void:
	# Update the minimum size to be the current size to make sure the right tab container doesn't fuck us and resize us
	set_custom_minimum_size(Vector2(size.x, get_minimum_size().y))


func _on_h_split_container_dragged_parent(offset: int) -> void:
	# Update the minimum size to be the current size minus the absolute value of the offset to make sure the 
	# control doesn't be a bitch and refuse to resize
	# Clamp our new value between the real minimum size and the current size plus the absolute value of the offset
	set_custom_minimum_size(Vector2(clamp(size.x, real_minimum_size, size.x + abs(offset)) - abs(offset), get_minimum_size().y))
