%% Network Engineering: Task 5

color = ["bo", "go", "ro"];
K = [1, 5, 10]; % Change variable name from K to K
N = 1000;

% Define the probability values
p = 0:0.01:0.99;
p_values = length(p);

% Initialize a cell array to store legend labels
legendLabels = cell(1, length(K));

% Loop through different combinations of p1, p2, and p3
for i = 1:6
    % Figure number
    figure;  % Create a new figure for each i
    
    % Loop through different K values
    for Kindex = 1:length(K)
        K_value = K(Kindex);
        index = 1;
        Transmissions = zeros(1, p_values);

        % Set probability of failure values
        switch i
            case 1
                p1 = 0.10;
                p2 = 0.60;
                p3 = p;
                title_text = 'Figure 1: ';
            case 2
                p1 = 0.60;
                p2 = 0.10;
                p3 = p;
                title_text = 'Figure 2: ';
            case 3
                p1 = 0.10;
                p3 = 0.60;
                p2 = p;
                title_text = 'Figure 3: ';
            case 4
                p2 = 0.10;
                p3 = 0.60;
                p1 = p;
                title_text = 'Figure 4: ';
            case 5
                p2 = 0.60;
                p3 = 0.10;
                p1 = p;
                title_text = 'Figure 5: ';
            case 6
                p2 = 0.60;
                p3 = 0.10;
                p1 = p;
                title_text = 'Figure 6: ';
        end

        for p_value = p
            switch i
                case 1
                    p3 = p_value;
                case 2
                    p3 = p_value;
                case 3
                    p2 = p_value;
                case 4
                    p2 = p_value;
                case 5
                    p1 = p_value;
                case 6
                    p1 = p_value;
            end

            Transmissions(index) = runCustomCompoundNetworkSim(K_value, p1, p2, p3, N);
            index = index + 1;
        end

        % Plot the data and add labels to the legendLabels cell array
        h = semilogy(p, Transmissions, color(Kindex));
        hold on;
        legendLabels{Kindex} = sprintf('K=%d', K_value);
    end

    % Label the plot
    title('Avg Num of Transmissions vs. Prob of failure');
    xlabel('Prob of failure');
    ylabel('Avg Num of Transmissions');

    % Set y and x axis limits
    xlim([0, 1]);
    ylim([0, 10^3]);

    % Add a legend outside the plot area with aligned side points
    legend(legendLabels, 'Location', 'BestOutside', 'Orientation', 'vertical', 'Position', [0.87, 0.2, 0.1, 0.6]);
end
