%% Function runCustomCompoundNetworkSim
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
    % Initialize an array to store the results of each simulation
    simResults = zeros(1, N);

    % Loop through N simulations
    for i = 1:N
        % Initialize variables for this simulation
        txAttemptCount = 0;
        pktSuccessCount = 0;

        % Continue until K packets have been successfully transmitted
        while pktSuccessCount < K
            % Initialize success indicators for each link
            link1Success = false;
            link2Success = false;
            link3Success = false;

            % Attempt to transmit the packet
            txAttemptCount = txAttemptCount + 1;

            % Check the success of the first link
            while ~link1Success
                r = rand;
                if r > p1
                    link1Success = true;
                end
                txAttemptCount = txAttemptCount + 1;
            end

            % Check the success of the second link
            while ~link2Success
                r2 = rand;
                if r2 > p2
                    link2Success = true;
                end
                txAttemptCount = txAttemptCount + 1;
            end

            % Check the success of the third link
            r3 = rand;
            if r3 > p3
                link3Success = true;
            end
            txAttemptCount = txAttemptCount + 1;

            % If the packet successfully traverses all links, increment success count
            if link1Success || link2Success && link3Success
                pktSuccessCount = pktSuccessCount + 1;
            end
        end

        % Store the total number of attempts in the results array for this simulation
        simResults(i) = txAttemptCount;
    end

    % Calculate and return the average number of transmission attempts
    result = mean(simResults);
end
