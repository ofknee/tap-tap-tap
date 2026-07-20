extends TileMapLayer
var speed : float = 1
var spawnpoint = Vector2i(15,-1)
var good_tile = {"type" : "good", "id" : 1, "atlas_coords" : Vector2i(1,0), }
var bad_tile = {"type" : "bad", "id" : 1,"atlas_coords" : Vector2i(5,0),}
var tiles : Array = [good_tile, bad_tile]
var spawn_pick
var last_tile

func _ready() -> void:
	pass
	## collision shapes around map
	#var filled_tiles := get_used_cells() 
	#for tile: Vector2i in filled_tiles:
		#var neighbor_tiles := get_surrounding_cells(tile)
		#for neighbor: Vector2i in neighbor_tiles: 
			#if get_cell_source_id(neighbor) == -1: # -1 = empty
				#set_cell(neighbor, 0, Vector2i(9,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position -= Vector2(speed*2, -speed)
	for tile in get_used_cells():
		var world_pos = to_global(map_to_local(tile))
		if world_pos.x < -32:
			erase_cell(tile)
			spawn_pick = tiles.pick_random()
			spawn_new(spawn_pick)

func spawn_new(tile : Dictionary) -> void:
	set_cell(spawnpoint, tile["id"], tile["atlas_coords"])
	spawnpoint += Vector2i(1,0)
	print(spawnpoint)

#no red red
#delete block at end, spawn
