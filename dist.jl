using LinearAlgebra

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

println("d =")
return theta*dlinear

end 