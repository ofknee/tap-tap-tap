extends TileMapLayer
#var speed : float = Global.speed
var spawnpoint = Vector2i(5,-1)
var tile = {"id" : 1, "atlas_coords" : Vector2i(1,0), }
var tileless = {"id" : 1, "atlas_coords" : Vector2i(2,0), }
var last_tile
var generation = Global.generation

func _ready() -> void:
	SignalBus.spawn_new.connect(spawn_tile)
	for i in generation:
		SignalBus.spawn_new.emit(i)
		

	## collision shapes around map
	#var filled_tiles := get_used_cells() 
	#for tile: Vector2i in filled_tiles:
		#var neighbor_tiles := get_surrounding_cells(tile)
		#for neighbor: Vector2i in neighbor_tiles: 
			#if get_cell_source_id(neighbor) == -1: # -1 = empty
				#set_cell(neighbor, 0, Vector2i(9,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position -= Vector2(Global.speed*2, -Global.speed)
	for tile in get_used_cells():
		var world_pos = to_global(map_to_local(tile))
		if world_pos.x < -32:
			erase_cell(tile)
			# no back to back reds
			if generation[-1] == 0:
				generation.append(randi_range(0,1))
			else:
				generation.append(0) 
			
			SignalBus.spawn_new.emit(generation[-1])

func spawn_tile(type:int) -> void:
	if type == 0:
		set_cell(spawnpoint, tile["id"], tile["atlas_coords"])
	elif type == 1:
		set_cell(spawnpoint, tileless["id"], tileless["atlas_coords"])
	spawnpoint += Vector2i(1,0)
#no red red
#delete block at end, spawn
