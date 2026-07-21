extends TileMapLayer
var speed : float = Global.wait
var spawnpoint = Vector2i(5,-1)
var good_tile = {"type" : "good", "id" : 1, "atlas_coords" : Vector2i(1,0), }
var bad_tile = {"type" : "bad", "id" : 1,"atlas_coords" : Vector2i(5,0),}
var tiles : Array = [good_tile, bad_tile]
var last_tile
var generation = Global.generation

func _ready() -> void:
	for i in range(15):
		if generation[-1] == 0:
				generation.append(randi_range(0,1))
		else:
			generation.append(0) 
		set_cell(spawnpoint, tiles[generation[i]]["id"], tiles[generation[i]]["atlas_coords"])
		spawnpoint += Vector2i(1,0)
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
			# no back to back reds
			if generation[-1] == 0:
				generation.append(randi_range(0,1))
			else:
				generation.append(0) 
			spawn_new(generation[-1])

func spawn_new(tile : int) -> void:
	set_cell(spawnpoint, tiles[tile]["id"], tiles[tile]["atlas_coords"])
	spawnpoint += Vector2i(1,0)
	print(spawnpoint)

#no red red
#delete block at end, spawn
