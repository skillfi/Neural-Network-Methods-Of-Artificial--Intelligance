clear all;
%% крок поданн€ аналогового сигналу [sec]
dt_sim = 1e-4; 
%% час моделюванн€ [sec]
Tsim = 0.6; 
%% ≥нтервали при €ких в≥дбуватиметьс€ запис VMs(напруги мембрани) та PSCs ( ≥мпульс≥в)[sec]
dt_out = 0.005; 
csim('set','dt',dt_sim);
%% створенн€ 1-го ≥мпульсного вх≥дного нейрону
n1 = csim('create','SpikingInputNeuron'); 
%% створенн€ 2-го ≥мпульсного вх≥дного нейрону
n2 = csim('create', 'SpikingInputNeuron'); 
%% створенн€ 3-го ≥мпульсного вх≥дного нейрону
n3 = csim('create', 'SpikingInputNeuron'); 
%% створенн€ 1-го аналогового вх≥дного нейрону
n4 = csim('create','AnalogInputNeuron'); 
%% створенн€ 2-го аналогового вх≥дного нейрону
n5 = csim('create','AnalogInputNeuron'); 
nmc = neural_microcircuit;
%% створюЇтьс€ шар Sigmoidal нейррон≥в розм≥ром 4х2х5, початкове положенн€ на 3D Ц раф≥ку Ц 1, 1, 1 (х, y, z).
[nmc, p_sig]=add(nmc,'pool','type','SigmoidalNeuron','size',[4 2 5],'origin',[6 1 1]); 
figure(1); %clf reset;
plat(nmc);
title('SigmoidalNeuron 4x2x5')
fprintf('SigmoidalNeuron 4x2x5 build\n');
%% створюЇтьс€ шар Sigmoidal нейррон≥в розм≥ром 2х3х4, початкове положенн€ на 3D Ц раф≥ку Ц 6, 1, 1 (х, y, z).
[nmc, p_sig]=add(nmc,'pool','type','SigmoidalNeuron','size',[2 3 4],'origin',[6 1 1]); 
%figure(2); %clf reset;
%plat(nmc);
%title('SigmoidalNeuron 4x2x5 + SigmoidalNeuron 2x3x4')
%fprintf('SigmoidalNeuron 2x3x4 build\n');
%% створюЇтьс€ шар LIF нейррон≥в розм≥ром 2х3х4, початкове положенн€ на 3D Ц раф≥ку Ц 6, 1, 1 (х, y, z).
[nmc, p_lif]=add(nmc,'pool','type','LifNeuron','size',[3 3 3],'origin',[10 1 1]); 
%figure(3); %clf reset;
%plat(nmc);
%title('SigmoidalNeuron`s + LifNeuron')
%fprintf('SigmoidalNeuron + LifNeuron build\n');
%% створенн€ двох ≥мпульсних вх≥дних нейрон≥в.
[nmc,p_sin] = add(nmc,'pool','type','SpikingInputNeuron',...
 'size',[1 1 3],'origin',[0 1 5],'frac_EXC',1.0);
%% створенн€ одного аналогового нейрону
[nmc,p_ain] = add(nmc,'pool','type','AnalogInputNeuron',...
 'size',[1 1 2],'origin',[0 1 2],'frac_EXC',1.0);
p_sig = [6 1 1; 6 1 1];
p_sin = [0 1 5; 0 1 5];
%% зТЇднанн€ шар≥в
[nmc, c(1)] = add(nmc,'conn','dest', p_sig,'src', p_sin, 'Cscale',1,'Wscale',5); 
figure(2); %clf reset;
plat(nmc);
title('Conected');
%fprintf('SigmoidalNeuron + LifNeuron + SpikingInput + AnalogInput\n');