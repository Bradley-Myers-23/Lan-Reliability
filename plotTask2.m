%% Network Engineering: Task 2

% Define colors for plotting
colors = ['b', 'g', 'c', 'm', 'r'];
% Define values of K (number of packets)
K_values = [1, 5, 15, 50, 100];
% Number of simulations to run
N = 1000;
% Probability range
x = 0:0.01:0.99;

% Initialize legend labels
legendLabels = cell(1, numel(K_values));

% Create a figure for accumulation
%figure(6);
hold on;

for Kindex = 1:numel(K_values)
    K = K_values(Kindex);

    % Initialize arrays to store results
    transmissions = zeros(1, numel(x));
    calc = zeros(1, numel(x));

    % Simulate and calculate for each probability value
    for index = 1:numel(x)
        p = x(index);
        transmissions(index) = runTwoSeriesLinkSim(K, p, N);
        calc(index) = K / (1 - p)^2;
    end

    % Create a new figure for each K after the first one
    if Kindex > 1
        figure;
    end

    % Plot the simulation results with log y-axis scale
    semilogy(x, transmissions, 'ko', 'MarkerSize', 8);
    hold on;

    % Plot the calculated results with the specified color
    plot_color = colors(Kindex);
    semilogy(x, calc, plot_color, 'LineWidth', 2);

    % Label the plot
    title(['Avg # of Transmissions vs. Probability of failure for k = ' num2str(K)]);
    xlabel('Probability of failure');
    ylabel('Average Number of Transmissions');
    xlim([0 1]);

    % Store the legend label
    legendLabels{Kindex} = ['k = ' num2str(K)];
end

% Add a legend outside the last plot
legend(legendLabels, 'Location', 'eastoutside', 'Orientation', 'vertical');

% Set y and x axis limits for the accumulation figure
xlim([0, 1]);
ylim([0, 10^3]);
title('Avg Num of Transmissions vs. Prob of failure');
xlabel('Prob of failure');
ylabel('Avg Num of Transmissions');
