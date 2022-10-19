function rot = quat2mr(quat)


lambda_1 = quat(2);  
lambda_2 = quat(3);
lambda_3 = quat(4);

lambda_tild = [0 -lambda_3 lambda_2 ; lambda_3 0 -lambda_1; -lambda_2 lambda_1 0];

rot = eye(3,3) + 2.*quat(1).*lambda_tild + 2.*lambda_tild^2;

end