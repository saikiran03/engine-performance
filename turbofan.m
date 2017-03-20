clear all;
clc;

g = 1.4;
alpha = 4.0;
Tt4Ta = 5.78;
Ma = 0.75;
PiF = 0.7:0.05:3.35;
PiC = 5:0.5:30;
TtaTa = 1 + (g-1)*Ma*Ma/2;

ita = 1;
for pif = PiF
    tf = pif ^ (1 - 1/g);
    itb = 1;
    for pic = PiC
        tc = pic ^ (1 - 1/g);
        
        A = Tt4Ta/(TtaTa*tc);
        Aa = (TtaTa * tc * (1- (TtaTa/Tt4Ta*((tc-1) + alpha*(tf-1))))- 1);
        A = Ma * (sqrt((A*Aa)/(TtaTa-1)) - 1);
        B = alpha * Ma * (sqrt((TtaTa*tf - 1)/(TtaTa-1)) - 1);
        ndthrust(ita, itb) = (A + B);
        
        itb = itb + 1;
    end
    ita = ita + 1;
end

surf(PiC, PiF, ndthrust);
xlabel('Compressor Pressure Ratio')
ylabel('Fan Pressure Ratio')
zlabel('Non-dimensinal Thrust')