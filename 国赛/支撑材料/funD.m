function D=funD(seita)
if 0<seita && seita<=180
    D=0.0057*seita;
elseif 180<seita && seita<=360
    D=-0.0057*seita+1.0186;
end