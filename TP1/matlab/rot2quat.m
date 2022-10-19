function quat = rot2quat(a,theta)
quat=[0 0 0 0] ;
quat(1)=cosd(theta/2);


for i=2:4 
    quat(i)=a(i-1)/norm(a)*sind(theta/2);
end