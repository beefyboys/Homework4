module beefyboys

using LinearAlgebra

function prm(s,g,O)
    limits=world(s,g,O)
    step = .5*minimum([O[:,4];1]);
    dis=step+1;
    Master = Any[];
    start_node = Any[];
    push!(start_node,s);
    push!(start_node,0);
    push!(Master, start_node);
  
    #-------------------------------------------------------------
    while dis>step
        sample=random(limits);
        
        end #while
end

    



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
    H[1:3,1:3]=R; H[1:3,4]=[random_x;random_y;random_z];
    
return H
        
        [random_x; random_y; random_z; random_thetax; random_thetay; random_thetaz]

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


end # module
