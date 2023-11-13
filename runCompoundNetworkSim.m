%% Function runCompoundNetworkSim
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runCompoundNetworkSim(K, p, N)
    % Initialize an array to store the results of each simulation iteration
    simResults = zeros(1, N);

    % Loop through N simulations
    for i = 1:N
        txAttemptCount = 0; % Initialize transmission attempt count
        pktSuccessCount = 0; % Initialize count for successfully transmitted packets

        % Continuously attempt transmission until the required number of packets (K) is successfully transmitted
        while pktSuccessCount < K
            % Generate random numbers to determine packet success on each link
            r = rand;   % Random number for the first link
            r2 = rand;  % Random number for the second link
            r3 = rand;  % Random number for the third link
            txAttemptCount = txAttemptCount + 1; % Increment transmission attempt count

            % Keep attempting transmission until all packets are successfully transmitted
            while (r < p && r2 < p) || r3 < p
                % Generate new random values for retransmission
                r = rand;
                r2 = rand;
                r3 = rand;
                txAttemptCount = txAttemptCount + 1; % Increment additional attempt count
            end

            pktSuccessCount = pktSuccessCount + 1; % Increment the success count after a successful transmission
        end

        simResults(i) = txAttemptCount; % Store the total number of transmission attempts for this simulation iteration
    end

    % Calculate the average of all simulation results
    result = mean(simResults);
end
