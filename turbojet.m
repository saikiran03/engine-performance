clear;
clc;

g = 1.4;
Ma = 0.75;
hv = 150;
PIc = 5:0.25:25;
Tt4Ta = 6;
TtaTa = 1 + 0.5*(g-1)*Ma^2;

it = 1;
for pc=PIc
    tc = pc^((g-1)/g);
    
    A = TtaTa/(TtaTa-1) * (Tt4Ta/(TtaTa*tc) - 1) * (tc-1) + (Tt4Ta/(TtaTa*tc));
    ndthrust(it) = Ma * (sqrt(A) - 1);
    
    num = (Tt4Ta - TtaTa*tc)/(hv*Ma);
    den = sqrt( (TtaTa/(TtaTa - 1)) * (Tt4Ta/(TtaTa*tc) - 1) * (tc - 1) + (Tt4Ta/(TtaTa*tc))) - 1;
    TSFCaa(it) = num/den;
    it =  it + 1;
end

[hAx, hLine1, hLine2] = plotyy(PIc, ndthrust, PIc, TSFCaa);
title('Ideal Turbojet Performance Analysis');
xlabel('Compressor Pressure Ratio');
ylabel(hAx(1), 'Non-dimensional Thrust')
ylabel(hAx(2), 'TSFC.a');
grid on;
