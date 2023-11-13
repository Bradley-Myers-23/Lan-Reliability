%% Function runSingleLinkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runSingleLinkSim(K, p, N)
    simResults = ones(1, N); % A place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % Transmission count
        pktSuccessCount = 0; % Number of packets that have made it across

        while pktSuccessCount < K
            r = rand; % Generate a random number to determine if the packet is successful (r > p)
            txAttemptCount = txAttemptCount + 1; % Count the first attempt

            % While packet transmission is not successful (r < p)
            while r < p
                r = rand; % Transmit again, generate a new success check value (r)
                txAttemptCount = txAttemptCount + 1; % Count additional attempts
            end

            pktSuccessCount = pktSuccessCount + 1; % Increase success count
        end

        simResults(i) = txAttemptCount; % Record the total number of attempts
    end

    result = mean(simResults); % Calculate the average result
end
