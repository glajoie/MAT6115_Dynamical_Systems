%fucntion returning the vector field for the normal form of an elliptic
%burster
function [Y]=NF_bautin(t,X,w,eps,a,Tk,A,Kspan)
x=X(1);
y=X(2);
u=X(3);
Y=zeros(3,1);

% Forcing term-----------------------------------
I_kick=0; %forcing
for it=1:length(Tk)
    if t-Tk(it) >= 0 && t-Tk(it)<= Kspan %checking if t is within Kspan past a Tk (kick time)
        I_kick=A;
    end
end
%--------------------------------------

%dx/dt
Y(1)=(u*x-w*y)+2*x*(x^2+y^2)-x*(x^2+y^2)^2+I_kick;
%dy/dt
Y(2)=x*w+y*u+2*y*(x^2+y^2)-y*(x^2+y^2)^2;
%du/dt
Y(3)=eps*(a-x^2-y^2);