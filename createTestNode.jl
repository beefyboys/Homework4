module createTestNode

function findTestNode(closestNode, sample, stepSize)

       vectorBetween = sample - closestNode

       norm = sqrt(vectorBetween[1,1]^2 + vectorBetween[1,2]^2 + vectorBetween[1,3]^2)

       testNode = (vectorBetween/norm) * stepSize

       end

end # module