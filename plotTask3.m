%% Network Engineering: Task 3

% Define parameters
markerKMatrix = ["bo", "go", "co", "mo", "ro"];
K = [1, 5, 15, 50, 100];
N = 1000;
x = 0:0.01:0.99;

% Check if Figure 6 exists
figExists = ishandle(6);

% Create Figure 6 or activate it if it already exists
if ~figExists
 %   figure(6);
else
    figure(6);  % Activate Figure 6 if it already exists
    clf;  % Clear the existing content in Figure 6, if needed
end

% Initialize title_text and legendLabels
legendLabels = cellstr(string(K));  % Create legend labels from K values

for Kindex = 1:5
    currentK = K(Kindex);

    % Initialize arrays to store results
    numberofTransmissions = zeros(1, length(x));

    for pIndex = 1:length(x)
        p = x(pIndex);

        % Run the simulation and store the results
        numberofTransmissions(pIndex) = runTwoParallelLinkSim(currentK, p, N);
    end

    % Plot the results on Figure 6
    marker = markerKMatrix(Kindex);  % Get marker K
    semilogy(x, numberofTransmissions, marker, 'MarkerSize', 8);
    hold on;
end

% Add labels and title
title(['Avg Num of Transmissions vs. Prob of failure']);
xlabel('Prob of failure');
ylabel('Avg Num of Transmissions');

% Set y and x axis limits
xlim([0, 1]);
ylim([0, 10^3]);

% Add a legend outside the plot area to the right
legend(legendLabels, 'Location', 'eastoutside', 'Orientation', 'vertical');
