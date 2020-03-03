module minDistance

greet() = print("Hello Loser!")


function findClosestNode(Master,sampleAsHomogenous)

	# Master is an Nx2 array. Col. 1 is 4x4 nodes, Col. 2 is node's row in 'Master'

	nodeListLength = size(Master,1)
	rollingMin = 1
	#closestNode = [0 0 0]
	minRow = 5000
    sample = transpose(sampleAsHomogenous[1:3,4])

	for i in 1:nodeListLength
		
	currentDistance=dist(sampleAsHomogenous, Master[i][1])	
		
		
	#currentDistance = sqrt((sample[1,1]-Master[i][1][1,4])^2 + (sample[1,2]-Master[i][1][2,4])^2 + (sample[1,3]-Master[i][1][3,4])^2)
	#only linear distance	
		
		if i == 1
			rollingMin = currentDistance
			#closestNode = Master[i,:]
			minRow = 1
		end
	
		if currentDistance < rollingMin
			rollingMin = currentDistance
			#closestNode = Master[i,:]
			minRow = i
		end

	end 

	#println("The minimum distance is ", rollingMin)
	#println("To the point ", closestNode)
	#println("This point is row ", minRow," in the Node List")
return minRow

end



end # module
