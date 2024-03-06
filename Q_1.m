function y = Q_1()


 
pathA = 0;
pathB = 0;

for x = 0:1/100:0.99
    %Sub in first curve equation
    work1 = -11*(x+0.2).^3.6;
    ans1 = work1*0.01;
    pathA = pathA + ans1;
    %Sub in second curve equation
    work2 = -11*(x^3+0.2).^3.6;
    ans2 = work2*0.01;
    pathB = pathB+ans2;
end



pathA
pathB
end
