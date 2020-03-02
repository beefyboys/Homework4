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

xmin = minimum(x_a) - 1; 
xmax = maximum(x_a) + 1;
ymin = minimum(y_a) - 1;
ymax = maximum(y_a) + 1;
zmin = minimum(z_a) - 1;
zmax = maximum(z_a) + 1;

Boundary = [xmin xmax; ymin ymax; zmin zmax]
end # function

function random(s, g, O)

b = world(s, g, O);
random_x = rand(b[1,1]:b[1,2]);
random_y = rand(b[2,1]:b[2,2]);
random_z = rand(b[3,1]:b[3,2]);

random_sample = [random_x; random_y; random_z]
end

function test(x,y,z,theta);
  f1 = I4
  end #function "test"

end # module
