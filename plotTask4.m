%% Network Engineering: Task 4

% Define the different marker styles and colors
colors = ["bo", "gs", "cd", "mp", "rh"];

% Define the number of packets to be tested
K_values = [1, 5, 15, 50, 100];

% Number of simulations to run
N = 1000;

% Probability range
x = 0:0.01:0.99;

% Create a new plot for each K value
for K_index = 1:length(K_values)
    K = K_values(K_index); % Get the current value of K

    % Initialize an array to store simulation results
    transmissions = zeros(size(x));

    % Run simulations for different probability values
    for p_index = 1:length(x)
        p = x(p_index);
        transmissions(p_index) = runCompoundNetworkSim(K, p, N);
    end

    % Create a new figure for each K value
    figure;

    % Plot the results with a log y-axis scale
    semilogy(x, transmissions, colors(K_index));
    hold on;

    % Label the plot
    % Label the plot
    title('Avg Num of Transmissions vs. Prob of failure');
    xlabel('Prob of failure');
    ylabel('Avg Num of Transmissions');

    % Set y and x axis limits
    xlim([0, 1]);
    ylim([0, 10^3]);
end