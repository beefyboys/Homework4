function collide(O,q)
        rows_O,columns_O = size(O);
        for i=1:rows_O

            if O[i,5] == 0 #obstacle is a sphere

                if sqrt( (O[i,1]-q[1])^2 + (O[i,2]-q[2])^2 + (O[i,3]-q[3])^2 ) <= O[i,4] + 1
                  # distance between centers of spheres   <=  obstacle radius + robot radius
                    return true #collision!
                   
                end
                #ends if statement
            
            else #obstacle is a cylinder
            
                if q[3]-1 <= O[i,3] #robot is not completely above cylinder height
                    
                    if sqrt( (O[i,1]-q[1])^2 + (O[i,2]-q[2])^2 ) <= O[i,4] + 1
                # distance between center of sphere and center line of cylinder <= obstacle radius + robot radius
                    return true #collision!
                    
                    end
                    #ends if statement
                end
                #ends if statement
            
                
            end
            #ends if statament

        end
        #ends for loop
        return false #passes every collision check, no collision!
    
end
#ends function