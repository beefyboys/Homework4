module minDistance

greet() = print("Hello Loser!")


function findClosestNode(Master,sampleAsHomogenous)

	#nodeList should be a N x 3 list of points in 3space, sample should be a single point in 3space

	nodeListLength = size(Master,1)
	rollingMin = 1
	closestNode = [0 0 0]
	minRow = 5000
    sample = transpose(sampleAsHomogenous[1:3,4])

	for i in 1:nodeListLength
		currentDistance = sqrt((sample[1,1]-Master[i][1][1,4])^2 + (sample[1,2]-Master[i][1][2,4])^2 + (sample[1,3]-Master[i][1][3,4])^2)

		if i == 1
			rollingMin = currentDistance
			closestNode = Master[i,:]
			minRow = 1
		end
	
		if currentDistance < rollingMin
			rollingMin = currentDistance
			closestNode = Master[i,:]
			minRow = i
		end

	end 

	#println("The minimum distance is ", rollingMin)
	#println("To the point ", closestNode)
	#println("This point is row ", minRow," in the Node List")
return minRow

end



end # module
