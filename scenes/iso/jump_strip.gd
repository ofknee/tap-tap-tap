extends TileMapLayer
var speed : float = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var filled_tiles := get_used_cells() 
	for tile: Vector2i in filled_tiles:
		var neighbor_tiles := get_surrounding_cells(tile)
		for neighbor: Vector2i in neighbor_tiles: 
			if get_cell_source_id(neighbor) == -1: # -1 = empty
				set_cell(neighbor, 0, Vector2i(9,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position -= Vector2(speed*2, -speed)
	for tile in get_used_cells():
		var world_pos = to_global(map_to_local(tile))
		if world_pos.x < 62:
			erase_cell(tile)

#no red red
#delete block at end, spawn
