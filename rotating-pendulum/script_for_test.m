% params = [-0.04, 0.06, 0.074, 0.00002, 4.8, 0.00077, 50, 0.03];
% t = 0 : 0.001 : 10;
% init_theta_1 = pi; init_theta_2 = pi/2;
% U = [0 0 params];
% y1 = sim('system_model1', t, [], U);
% % y2 = sim('system_model_biased', t, [], U);
% % 
% plot(y1.tout, y1.yout{2}.Values.Data)
% % hold on
% % plot(y2.tout, y2.yout{2}.Values.Data)
% 
% % figure;
% % plot(y2.tout, y2.yout{2}.Values.Data)
% % hold on
% % 
% % params = [-0.04, 0.06, 0.014, 0.00002, 4.8, 0.00077, 50, 0.03];
% % for i = 1: 1: 3
% % params = params - 0.00001;
% % t = 0 : 0.001 : 10;
% % init_theta_1 = 0; init_theta_2 = pi;
% % U = [0 2];
% % y1 = sim('system_model', t, [], U);
% % % y2 = sim('system_model_biased', t, [], U);
% % plot(y1.tout, y1.yout{2}.Values.Data)
% % end
% 
% P = [-0.0400000000000000	0.0271957553503854	0.0740000000000000	9.04647898379042e-05	4.80000000000000	3.23518615348741e-05	50	0.0300000000000000];
% P = [-0.0400000000000000	0.0870000574985959	0.0740000000000000	6.80902785103868e-05	4.80000000000000	9.99997774924231e-05	50	0.0300000000000000];
% P = [-0.0400000000000000	0.0766489567759310	0.0740000000000000	4.33109657851613e-05	4.80000000000000	4.52967957330280e-05	50	0.0300000000000000];
% 

