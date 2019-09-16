function V=funV(t)
if 0<=t && t<0.2
    V=100*t;
elseif 0.2<=t && t<2.2
    V=20;
elseif 2.2<=t && t<2.4
    V=-100*t+240;
else
    V=0;
end