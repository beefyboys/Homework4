module beefyboys

using LinearAlgebra

function world(s, g, O)

O_1 = O[:,1];
O_2 = O[:,2];
O_3 = O[:,3];

s_1 = s[1,4];
s_2 = s[2,4];
s_3 = s[3,4];

g_1 = g[1,4];
g_2 = g[2,4];
g_3 = g[3,4];

x_a = [O_1; s_1; g_1];
y_a = [O_2; s_2; g_2];
z_a = [O_3; s_3; g_3];

xmin = minimum(x_a) - 2; 
xmax = maximum(x_a) + 2;
ymin = minimum(y_a) - 2;
ymax = maximum(y_a) + 2;
zmin = 0;
zmax = maximum(z_a) + 2;
        

return [xmin xmax; ymin ymax; zmin zmax]
end # function

function random(b)


random_x = rand(b[1,1]:b[1,2]);
random_y = rand(b[2,1]:b[2,2]);
random_z = rand(b[3,1]:b[3,2]);
(random_thetax,random_thetay,random_thetaz) = rand(3)*2*pi;

Rx = [1 0 0;0 cos(random_thetax) -sin(random_thetax);0 sin(random_thetax) cos(random_thetax)];
Ry = [cos(random_thetay) 0 -sin(random_thetay);0 1 0;sin(random_thetay) 0 cos(random_thetay)];
Rz = [cos(random_thetaz) -sin(random_thetaz) 0;sin(random_thetaz) cos(random_thetaz) 0;0 0 1];
    R = Rx*Ry*Rz;
    H=zeros(4,4);
    H[1:3,1:3]=R; H[1:4,4]=[random_x;random_y;random_z;1];
    
return H

end

function test(x,y,z,theta)
    f1=Matrix{Float64}(I, 4, 4);
    
    #(random_thetax,random_thetay,random_thetaz) = rand(3)*2*pi
    Rx = [1 0 0;0 cos(theta) -sin(theta);0 sin(theta) cos(theta)];
    #Ry = [cos(random_thetay) 0 -sin(random_thetay);0 1 0;sin(random_thetay) 0 cos(random_thetay)];
    #Rz = [cos(random_thetaz) -sin(random_thetaz) 0;sin(random_thetaz) cos(random_thetaz) 0;0 0 1];
    R = Rx;
    f2=zeros(4,4);
    f2[1:3,1:3]=R; f2[1:3,4]=[x;y;z;1];
    return (f1,f2)
end

function dist(f1, f2)

r_1 = f1[1:3,1:3];
r_2 = f2[1:3,1:3];

x_1 = f1[1,4];
x_2 = f1[2,4];
x_3 = f1[3,4];

y_1 = f2[1,4];
y_2 = f2[2,4];
y_3 = f2[3,4];

R = r_1*transpose(r_2);
theta = acos((tr(R)-1)/2);

dlinear = sqrt((y_1-x_1)^2 + (y_2-x_2)^2 + (y_3-x_3)^2);

return theta*dlinear

end 

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


function prm(s,g,O)
    limits=world(s,g,O) #max and mins of objects in our world
    step = .5*minimum([O[:,4];1]); #set step to half the minimum radius
    dis=step+1; #set distance to goal greater than step
    Master = Any[]; #Master node list, including each node's 'parent'
    start_node = Any[]; #start node info, including parent node
    push!(start_node,s); #add s to start_node
    push!(start_node,0); #sets parent node to 0 (start)
    push!(Master, start_node); #adds start node 
  
    #-------------------------------------------------------------
    while dis>step
        sample=random(limits);
        
        end #while
end

end # module
