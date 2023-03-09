clear
close all
% clc

load("black-box data\round 3\xbeam.mat")
load("black-box data\round 3\xpend.mat")
load("black-box data\round 3\u.mat")

load("calib_data\adin_gain.mat")
load("calib_data\adin_offs.mat")

xpend = (xpend - adin_offs(2)) / adin_gain(2);
xbeam = (xbeam - adin_offs(1)) / adin_gain(1);

u = u(1:20000);

y = xbeam;
y = unwrap(y);
figure
y = y';
y = y -mean(y);
y = detrend(y);
plot(y,'r')
hold on

plot(u,'b')
grid on

data = iddata(y, u);


% use OE model
% OE.sys = oe(data, [5, 5, 1]);
% figure
% resid(data, OE.sys) % G is perfect but H is not

% use BJ model
BJ.sys = bj(data, [4, 3, 3, 4, 1]);
figure
resid(data, BJ.sys) % all are perfect

sys = BJ.sys;

bode(sys)
step(sys)
zpk(sys)
d2c(sys)

compare(data, sys)

y_est = sim(sys, data(:, [], :));

cost_func = 'NRMSE';
y = y_est.y;
yref = data.y;
fit = goodnessOfFit(y, yref, cost_func)
value = fpe(sys)



% M = bj([y u],[4 3 3 4 1]); 
% [A,B,C,D,F] = polydata(M);  % Retrieve polynomial coeff
% H = tf(C,D,1); 
% G = tf(B,F,1); 
% [Phiu,w] = pwelch(u);  % Estimate input power spectrum
% [Gmag,~] = bode(G,w);
% [Hmag,~] = bode(H,w);  
% 
% sigma_ehat = M.Report.Fit.MSE; % Estimate variance of e(t)
% Phiv = squeeze(Hmag).^2*sigma_ehat; 
% Phiy = squeeze(Gmag).^2.*Phiu+Phiv;

% figure;
% loglog(w,Phiv,'linewidth',2); 
% hold on; 
% loglog(w,Phiv./Phiu,'linewidth',2); 
% loglog(w,Phiv./Phiy,'linewidth',2);


% validation

save('sys.mat', 'sys');