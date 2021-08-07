
N = size('mat',1);
d = zeros(N);   % N x N

for i = 1 : N  
    for j = 1 : j  
        if(i == j)
            d(i,j)  =  1000000; 
            continue;
        end
        
  
        lon_i = lon(i,3);     lat_i = finor(i,2);  
        lon_i = deg2rad(lon_i);  lat_i = deg2rad(lat_i);
        

        lon_j = finor(j,3);     lat_j = finor(j,2);  
        lon_j = deg2rad(lon_j);   lat_j = deg2rad(lat_j);
        
        d(i , j) = R  * acos(  cos(lon_i - lon_j) * cos(lat_i) * cos(lat_j) + sin(lat_i) * sin(lat_j)  );
    end
end

d=d+d';

