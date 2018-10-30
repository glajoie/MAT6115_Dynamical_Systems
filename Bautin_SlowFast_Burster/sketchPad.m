% Integrate slow-fast elliptic burster system

%elliptic parameters
w=0.5;
a=.8;
eps = 0.01; % timescale

% integration
Tspan=[0 1000];
IC=[0 0.1 0];
options = odeset('RelTol',1e-6,'AbsTol',1e-6,'MaxStep',0.05);

% kick forcing
Kspan=1; %kick width
A=.5;
kickTimes=[];%[650];

% integration
[T,Y]=ode45(@(t,X) NF_bautin(t,X,w,eps,a,kickTimes,A,Kspan), Tspan, IC, options);

% Plot
figure;
plot(T,Y(:,1),T,Y(:,3),'r');
xlabel('time')
legend({'Re(z)','y'})
