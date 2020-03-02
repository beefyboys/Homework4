module minDistance

greet() = print("Hello Loser!")


function findMin(nodeList,sample)

	#nodeList should be a N x 3 list of points in 3space, sample should be a single point in 3space

	nodeListLength = size(nodeList,1)
	rollingMin = 1
	closestNode = [0 0 0]
	minRow = 5000

	for i in 1:nodeListLength
		currentDistance = sqrt((sample[1,1]-nodeList[i,1])^2 + (sample[1,2]-nodeList[i,2])^2 + (sample[1,3]-nodeList[i,3])^2)

		if i == 1
			rollingMin = currentDistance
			closestNode = nodeList[i,:]
			minRow = 1
		end
	
		if currentDistance < rollingMin
			rollingMin = currentDistance
			closestNode = nodeList[i,:]
			minRow = i
		end

	end 

	println("The minimum distance is ", rollingMin)
	println("To the point ", closestNode)
	println("This point is row ", minRow," in the Node List")


end



end # module
