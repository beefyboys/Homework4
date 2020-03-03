module createTestNode

function findTestNode(closestNode, sample1, stepSize)
       travel = zeros(3,1)
       testNode = zeros(4,4)
       travel = sample1[1:3,4] - closestNode[1:3,4]
       norm = sqrt((sample1[1,4]-closestNode[1,4])^2 + (sample1[1,4]-closestNode[1,4])^2 + (sample1[1,4]-closestNode[1,4])^2)
       
       normWithStep = (travel/norm) * stepSize
       
       testNode[1:3,4] = testNode[1:3,4] + normWithStep
       
       testNode[1:3,1:3] = sample1[1:3,1:3]
     
       testNode[4,4] = 1
       

end # module
