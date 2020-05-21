function [gain, Pwrk, gamma_sol, i] = get_gain(PpD)
%GET_GAIN Design the observer gain based on Hinfinity scheme 
% Inputs : PpD.A, PpD.C, PpD.E, PpD.F(State, OuputMatrices)
% Ouputs: Observer Gain, matrix P, solution of lmi, decay rate
% Author: JJRATH
% Date: 15.4.2019
% Last Updated by: FBehtarin

tic;
ns = size(PpD.A,1);
nh = size(PpD.C,1);
nw = size(PpD.E,1);
nv = size(PpD.F,1);
try
    P = sdpvar(ns,ns,'symmetric');
    Y = sdpvar(ns,nh,'full');
    gamma = linspace(0,50,100);
    for i = 2:length(gamma)
        GAx = blkvar;
        GAx(1,1) = eye(ns)-P;
        GAx(2,1) = zeros(nw, ns);
        GAx(2,2) = -gamma(i)*gamma(i)*eye(nw);
        GAx(3,1) = zeros(nv,ns);
        GAx(3,2) = zeros(nv, nw);
        GAx(3,3) = -gamma(i)*gamma(i)*eye(nv);
        GAx(4,1) = P*PpD.A-Y*PpD.C;
        GAx(4,2) = P*PpD.E;
        GAx(4,3) = -Y*PpD.F;
        GAx(4,4) = -P;
        GAx = sdpvar(GAx);
        ObjR= [P>=0, GAx<=0, gamma(i)>0]; % The objective function   
        ops_lmi = sdpsettings('solver','mosek','verbose',1,'warning',1); 
        solpb = optimize(ObjR,gamma(i)*gamma(i),ops_lmi); % optimze the LMis
        if solpb.problem == 1 % see its significance in yalmiperror; checkset(pblmi)
            disp('LMIs are infeasible. Hmmm ... Be patient to wait for a miracle!');
            OGain = zeros(ns,nh);
            Pwrk = zeros(ns,ns);
            Thwrk = zeros(nh,nh);
            gamma_i = 0/0;
            gamma_sol = 0/0;
        else
            disp('The problem has been found FEASIBLE in iteration');
            disp(i);
            gamma_sol  = double(gamma(i));
            Pwrk = double(P);
            Thwrk = double(Y);
            OGain = inv(Pwrk)*Thwrk;
            break;
        end    
     end




    %--- Check for obs. eigen values

    PP =(PpD.A-OGain*PpD.C);
    ObsInd =  'good design'; % i.e. system has good poles
catch
    ObsInd =  'bad design';   
    OGain = zeros(ns,nh);
    Pwrk = zeros(ns,ns);
    gamma_sol = 0/0;
end
Tsolve =toc;
gain = OGain;
end