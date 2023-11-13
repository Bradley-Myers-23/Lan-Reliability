%% Function runTwoParallelLinkSim
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runTwoParallelLinkSim(K, p, N)
    simResults = cell(1, N); % Cell array to store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % Transmission count
        pktSuccessCount = 0; % Number of packets that have made it across
        
        while pktSuccessCount < K
            r1 = rand; % Generate a random number for link 1
            r2 = rand; % Generate a random number for link 2
            txAttemptCount = txAttemptCount + 1; % Count the transmission attempt
            
            % While packet transmissions are not successful for both links
            while r1 < p && r2 < p
                r1 = rand; % Generate a new random value for link 1
                r2 = rand; % Generate a new random value for link 2
                txAttemptCount = txAttemptCount + 1; % Count additional attempts
            end
            
            pktSuccessCount = pktSuccessCount + 1; % Increase the success count after success (r1 > p and r2 > p)
        end
        
        simResults{i} = txAttemptCount; % Store the total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end
    
    result = mean([simResults{:}]); % Calculate the average over all simulations
end
