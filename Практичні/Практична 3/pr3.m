clear all;
%% ���� ������� ����������� ������� [sec]
dt_sim = 1e-4; 
%% ��� ����������� [sec]
Tsim = 0.6; 
%% ��������� ��� ���� �������������� ����� VMs(������� ��������) �� PSCs ( ��������)[sec]
dt_out = 0.005; 
csim('set','dt',dt_sim);
%% ��������� 1-�� ����������� �������� �������
n1 = csim('create','SpikingInputNeuron'); 
%% ��������� 2-�� ����������� �������� �������
n2 = csim('create', 'SpikingInputNeuron'); 
%% ��������� 3-�� ����������� �������� �������
n3 = csim('create', 'SpikingInputNeuron'); 
%% ��������� 1-�� ����������� �������� �������
n4 = csim('create','AnalogInputNeuron'); 
%% ��������� 2-�� ����������� �������� �������
n5 = csim('create','AnalogInputNeuron'); 
nmc = neural_microcircuit;
%% ����������� ��� Sigmoidal �������� ������� 4�2�5, ��������� ��������� �� 3D � ������ � 1, 1, 1 (�, y, z).
[nmc, p_sig]=add(nmc,'pool','type','SigmoidalNeuron','size',[4 2 5],'origin',[6 1 1]); 
figure(1); %clf reset;
plat(nmc);
title('SigmoidalNeuron 4x2x5')
fprintf('SigmoidalNeuron 4x2x5 build\n');
%% ����������� ��� Sigmoidal �������� ������� 2�3�4, ��������� ��������� �� 3D � ������ � 6, 1, 1 (�, y, z).
[nmc, p_sig]=add(nmc,'pool','type','SigmoidalNeuron','size',[2 3 4],'origin',[6 1 1]); 
%figure(2); %clf reset;
%plat(nmc);
%title('SigmoidalNeuron 4x2x5 + SigmoidalNeuron 2x3x4')
%fprintf('SigmoidalNeuron 2x3x4 build\n');
%% ����������� ��� LIF �������� ������� 2�3�4, ��������� ��������� �� 3D � ������ � 6, 1, 1 (�, y, z).
[nmc, p_lif]=add(nmc,'pool','type','LifNeuron','size',[3 3 3],'origin',[10 1 1]); 
%figure(3); %clf reset;
%plat(nmc);
%title('SigmoidalNeuron`s + LifNeuron')
%fprintf('SigmoidalNeuron + LifNeuron build\n');
%% ��������� ���� ���������� ������� �������.
[nmc,p_sin] = add(nmc,'pool','type','SpikingInputNeuron',...
 'size',[1 1 3],'origin',[0 1 5],'frac_EXC',1.0);
%% ��������� ������ ����������� �������
[nmc,p_ain] = add(nmc,'pool','type','AnalogInputNeuron',...
 'size',[1 1 2],'origin',[0 1 2],'frac_EXC',1.0);
p_sig = [6 1 1; 6 1 1];
p_sin = [0 1 5; 0 1 5];
%% 璺������ ����
[nmc, c(1)] = add(nmc,'conn','dest', p_sig,'src', p_sin, 'Cscale',1,'Wscale',5); 
figure(2); %clf reset;
plat(nmc);
title('Conected');
%fprintf('SigmoidalNeuron + LifNeuron + SpikingInput + AnalogInput\n');