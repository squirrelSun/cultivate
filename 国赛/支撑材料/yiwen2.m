function ans0=yiwen2(pt_h,rout_h,h,zt,kt,pt0,t,t0)
syms pt t;
for j=1:1:zt*10
    for i=0:h:kt-h
        ans1=int (0.85*0.7*0.7*pi*sqrt(2*(160-pt)*(funE(pt_h)-pt_h-pt)/(funE(pt_h)*pt_h))*t,t,i,i+h)-int (funV(i)*t,t,i,i+h);
        anst=solve(ans1,pt);
        rou=rout_h+anst/(500*5*5*pi);
    end
    cp=solve('(1531.868406+5.474444341*pt-0.0010824814*pt*pt+0.0001000378*pt*pt*pt)/rou(2)-(pt-pt_h)/(rou(2)-rout_h)=0','pt');
    pt0=pt0+cp;
end
if pt0>=150
    ans0=kt;
    return
else
    pt_h=pt;
    rout_h=rout;
    kt=kt+h;
    yiwen03(pt_h,rout_h,h,zt,kt,pt0,t,t0);
end





