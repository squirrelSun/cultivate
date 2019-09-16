function H=funH(t)
if 0<=t && t<0.45
    H=0.0592-2.5580*t+17.1876*t*t;
elseif 0.45<=t && t<2
    H=2;
elseif 2<t &&t<2.45
    H=66.5717-42.0710*t+2.4868*t*t*t;
elseif 2.45<t && t<=100
    H=0;
end
