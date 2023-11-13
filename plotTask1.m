% Network Engineering: Task 1

% Define color matrix to switch colors for different values of k
colorMatrix = ['b', 'g', 'c', 'm', 'r'];

% Define the number of packets for each simulation
Kmatrix = [1, 5, 15, 50, 100];

% Number of simulations to run
N = 1000;

% Loop through each k value in Kmatrix
for Kindex = 1:5
    K = Kmatrix(Kindex); % Set k to the k index value
    index = 1; % Used to index into arrays to build results

    % Arrays to store results from simulation and calculation
    numberofTransmissions = zeros(1, 100);
    calculatedResults = zeros(1, 100);
    x = 0:0.01:0.99; % Probability range

    % Loop through every possible p value
    for p = 0:0.01:0.99
        % Run the simulation and store the result
        numberofTransmissions(index) = runSingleLinkSim(K, p, N);
        
        % Calculate results for each p
        calculatedResults(index) = K / (1 - p);
        index = index + 1; % Increment the index
    end

    % Create a new plot for each k value
    if Kindex > 1
        figure;
    end

    % Plot the results with log y-axis scale and linear x-axis
    semilogy(x, numberofTransmissions, 'ko', 'MarkerSize', 8);
    hold on;
    semilogy(x, calculatedResults, colorMatrix(Kindex), 'LineWidth', 2);

    % Label the plot
    title("Avg # of Transmissions vs. Probability of failure for k=" + Kmatrix(Kindex));
    xlabel("Probability of failure");
    ylabel("Average Number of Transmissions");
    xlim([0, 1]); % Set x-axis limits to 0-1

    % Create an accumulation figure
    %figure(6);
    title("Average Number of Transmissions vs. Probability of failure");
    xlabel("Probability of failure");
    ylabel("Average Number of Transmissions");
    xlim([0, 1]); % Set x-axis limits to 0-1
    semilogy(x, numberofTransmissions, 'ko'); % Plot simulation results
    hold on;
    semilogy(x, calculatedResults, colorMatrix(Kindex), 'LineWidth', 2); % Plot calculated results
end
