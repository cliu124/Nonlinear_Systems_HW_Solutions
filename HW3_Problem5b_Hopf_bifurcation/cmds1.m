%% demo for supercritical Hopf bifurcation on page 73 of Khalil (2002)
% This is a demo for 
% \dot{x}_1=x1*[\mu-(x1^2+x2^2)]-x2
% \dot{x}_2=x2*[\mu-(x1^2+x2^2)]+x1

close all; keep pphome; 
%% cell 1: init and cont of trivial branch 
p=[]; par=[-2]; % set initial value of parameter mu=-2. 
p=init(p,par); p=setfn(p,'tr'); p=cont(p);

%% cell 2: switch to Hopf bifurcating branches and continue
para=4; ds=0.1; figure(2); clf; aux=[];
aux.tl=100; %increase time resolution according to Hint.   
p=hoswibra('tr','hpt1',ds,para,'hpt1',aux); nsteps=200;%switch to Hopf bifurcation branch

%% cell 3: continue in Hopf branch 
p.hopf.nfloq=2;
p.hopf.jac=1; p.nc.dsmax=0.1; p.hopf.xi=0.05; p.file.smod=5; p.sw.verb=2; 
p.hopf.flcheck=0;% turn off Floquet calculation according to Hing % switch for Floquet-comp (stability of periodic orbit): 0: off, 1:floq, 2: floqps 
p.sw.bifcheck=0; %turn off bifurcation detection according to Hint % switch for bifurcation detection: 0:off, 1:on  
p=hocont(p,nsteps);

%% cell 4: plot bifurcation diagram. 
plotbra('tr'); plotbra('hpt1');
saveas(gcf, 'HW3_prob5b.png');