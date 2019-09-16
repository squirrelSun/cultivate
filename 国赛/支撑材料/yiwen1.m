function ans0=yiwen1(pt_h,rout_h,t0,t,h)
syms pt t;
format long
time=0;
for i=0:h:2.4-h
    time=time+1;
    ans1=int (0.85*0.7*0.7*pi*sqrt(2*(160-pt)*(funE(pt_h)-pt_h-pt)/(funE(pt_h)*pt_h))*t,t,i,i+h)-int (funV(i)*t,t,i,i+h);
    anst=solve(ans1,pt);
    rou=rout_h+anst/(500*5*5*pi);
    gx(time,size(rou))=rou(:);
end
b=gx(:,2);
c=double(b)
d=size(c);
for i=1:1:d(1)-1
    if c(i)<0.85 && c(i+1)>=0.85
        ans0=(i+1)/100;
        return
    end
end

