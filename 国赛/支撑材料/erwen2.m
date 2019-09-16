function ans2=erwen02(pt_h,rout_h)
syms rout pt t;
h=0.01;time1=0;
for i=0:h:2.45
    time1=time1+1;
    %fun1=int(0.85*funS(funH(t))*sqrt(2*(pt-1)*(rout_h*(pt-pt_h))/funE(pt_h)+rout_h)*t,t,0,2.45);
    if 0<i && i<=(0.45-h)
        fun1=int(0.85*0.025*pi*(0.0592-2.5580*t+17.1876*t*t)*(2.5+0.025*(0.0592-2.5580*t+17.1876*t*t))*sqrt(2*(pt-1)*(rout_h*(pt-pt_h))/funE(pt_h)+rout_h)*t,t,i,i+h);
    elseif 0.45<i && i<(2-h)
        fun1=int(0.85*funS(2)*sqrt(2*(pt-1)*(rout_h*(pt-pt_h))/funE(pt_h)+rout_h)*t,t,i,i+h);
    elseif 2<i && i<(2.45-h)
        fun1=int(0.85*0.025*pi*(66.5717-42.0710*t+2.4868*t*t*t)*(2.5+0.025*(66.5717-42.0710*t+2.4868*t*t*t))*sqrt(2*(pt-1)*(rout_h*(pt-pt_h))/funE(pt_h)+rout_h)*t,t,i,i+h);
    else
        fun1=int(0.85*funS(0)*sqrt(2*(pt-1)*(rout_h*(pt-pt_h))/funE(pt_h)+rout_h)*t,t,i,i+h);
    end
    ansp1=solve(fun1,pt);
    rou1=rout_h+ansp1/(500*5*5*pi);
    gx1(time,size(rou1))=rou1(:);
end
gx1;

h=0.01;time2=0;time3=0;
for j=0.01:0.03:1
    time3=time3+1;
    oumiga=j;
    for i=0:h:2.45
        time2=time2+1;
        %fun2=int(0.85*pi*0.7*0.7*sqrt(2*(funP(funD(oumiga*t))-pt_h)*(rout_h*(2*(funP(funD(oumiga*t))-pt_h))/funE(pt_h)+rout_h))*t,t,112.0351,247.9649);
        if 0<(i)*oumiga && (i+h)*oumiga<=180
            fun2=int(0.85*pi*0.7*0.7*sqrt(2*(funP(0.0057*(oumiga*t))-pt_h)*(rout_h*(2*(funP(0.0057*(oumiga*t))-pt_h))/funE(pt_h)+rout_h))*t,t,i,i+h)+rou1;
        elseif 180<(i)*oumiga && (i+h)*oumiga<=360
            fun2=int(0.85*pi*0.7*0.7*sqrt(2*(funP(-0.0057*(oumiga*t+1.0186))-pt_h)*(rout_h*(2*(funP(-0.0057*(oumiga*t+1.0186)-pt_h))/funE(pt_h)+rout_h)))*t,t,i,i+h)+rou1;
        else
            fun2=int(0.85*pi*0.7*0.7*sqrt(2*(funP(0.0057*(oumiga*t))-pt_h)*(rout_h*(2*(funP(0.0057*(oumiga*t))-pt_h))/funE(pt_h)+rout_h))*t,t,i,i*oumiga)+...
                int(0.85*pi*0.7*0.7*sqrt(2*(funP(-0.0057*(oumiga*t+1.0186))-pt_h)*(rout_h*(2*(funP(-0.0057*(oumiga*t+1.0186)-pt_h))/funE(pt_h)+rout_h)))*t,t,i*oumiga,i+h)+rou1;
        end
        gx2(time2,1)=fun2;
    end
    GX(time3,1)=gx2(1,1);
    GX(time3,2)=j;
end
GX(:,1)=abs(GX(:,1)-0.85);
[m,n]=find(GX==min(GX(:,1)));
ans2=GX(m,2);




