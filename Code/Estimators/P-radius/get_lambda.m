function [lambda] = get_lambda(PpD)
%GET_LAMBDA Find Lambda for  minimum P-radius
% Inputs : PpD.A, PpD.C, PpD.E, PpD.F(State, OuputMatrices)
% Ouputs: Observer Gain, matrix P, solution of lmi, decay rate
% Author: JJRATH
% Date: 15.4.2019
% Last Updated by: FBehtarin

ns = size(PpD.A,1); nh = size (PpD.C,1);
try
for i = 1: nh
    P = sdpvar(ns,ns,'symmetric'); % The vector in state dimensions
    Y = sdpvar(ns,1,'full'); %The gain matrix
    tau = sdpvar(1,1); % The factor to be maximized for decreasing the P radius
    cond_temp = max(PpD.E(i,:)*PpD.E(i,:)');
    phi(i) = max(PpD.F(i,:));
    %------Bisection Algorithm-----%
    beta_up = 1;  % Max value of beta
    beta_lo = 0; % Min value of beta
    
    beta_tol = 0.0001;%0.1
    
    beta_wr = beta_lo; % Current working value of beta
    %------Start of loop
    while(beta_up-beta_lo)> beta_tol
        beta_tst = (beta_up+beta_lo)/2;
        GAx = blkvar;
        GAx(1,1) = beta_tst*P;
        GAx(1,2) = 0;GAx(1,3) = 0;GAx(1,4) = PpD.A'*P-PpD.A'*PpD.C(i,:)'*Y';
        GAx(2,2) = PpD.E'*PpD.E; GAx(2,3) = 0;
        GAx(2,4)= PpD.E'*P-PpD.E'*PpD.C(i,:)'*Y';
        GAx(3,3) = phi(i)*phi(i);
        GAx(3,4) =Y'*phi(i);
        GAx(4,4) = P;
        GAx = sdpvar(GAx);
        cond2 = ((1-beta_tst)*P)/(phi(i)+cond_temp);
        % Define the optimization criterion
        % ---------------------------------
        crit =-tau; % Maximise tau
        %% Solve the problem
        % -----------------
        options_sdp=sdpsettings;
        options_sdp.solver='mosek'; % sedumi %
        options_sdp.verbose=1;  % =0: suppress screenoutput, =1: allow screen output
        % LMI problem to be solved
        pblmi =  [(P>=0) , (GAx>=0) ,(cond2>=eye(ns)*tau),(tau>=0) ];
        % Solve LMI conditions
        solpb = optimize(pblmi,crit,options_sdp);
        % Check if LMI is feasible
        if solpb.problem == 1
            disp('LMIs are infeasible');
            beta_up = beta_tst;
        else
            %     disp('LMIs are FEASIBLE');
            beta_lo = beta_tst;
            beta_wr = beta_tst;
            % Pworks = P;
            % Yworks = Y;
            % Tworks = tau;
        end
    end
    % P = value(Pworks);
    % Y = value(Yworks);
    % tau = value(Tworks);
    P = value(P);
    Y = value(Y);
    tau = value(tau);
    %-------End of While loop
    lambda(:,i) = inv(P)*Y;
end


%--- Check for obs. eigen values
  PP =(PpD.A-lambda*PpD.C);
    ObsInd =  'good design'; % i.e. system has good poles
catch
    ObsInd =  'bad design';
    lambda = zeros(ns,nh);
    P = zeros(ns,ns);
end
Tsolve = toc;
end

%------------End of Code-----%