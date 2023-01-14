# little endian on my Mac
# first byte: less significant byte	
	
	.data
	.byte 4 0 0 0	# 4 less significant byte
	.byte 0 0 0 4	# 4 most significant byte
