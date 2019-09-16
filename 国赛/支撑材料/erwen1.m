load seita.txt,load pt.txt,load sieta_d.txt,load juli.txt;
sj=seita0;
x=sj(:,1)';
x(end+1)=2*pi;
y=sj(:,2)';
y(end+1)=7.239;
xx=0:0.0001:2*pi;
X=interp1(x,y,xx,'spline');

figure
b=size(seita);
for i=1:1:b(2)
   S(i,1)=i/10000;
   S(i,2)=seita(i);
end
hold on
plot(S(:,1),S(:,2),'-b')
xlabel('极角（rad）');
ylabel('极径（mm）');
plot(seita0(:,1),seita0(:,2),'.r','markersize',1)


figure
a=size(seita);
J=zeros(a(2)+1,2);
x=0;h=0.0001;
for i=1:1:a(2)
    J(i,1)=x/2/pi*360;
    J(i,2)=seita(i);
    x=x+h;
end
J(end,1)=360;
J(end,2)=seita(1); 
plot(J(:,1),J(:,2))
xlabel('极角（°）');
ylabel('极径（mm）');

