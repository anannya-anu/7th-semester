% Load CSV file
data = readtable('/MATLAB Drive/Credit card transactions - India - Simple.csv', 'VariableNamingRule', 'preserve');

% Extract features and labels
X = data(:, 1:end-1); % All columns except the last as features
y = data(:, end);     % Last column as the target variable

% Display first few rows and column names
disp(head(data));
disp(data.Properties.VariableNames); % Display column headers

load fisheriris
data = meas; % Features
labels = species; % Labels


% Split into training (70%) and test (30%) sets
cv = cvpartition(size(data,1), 'HoldOut', 0.3);
trainData = data(training(cv), :);
trainLabels = labels(training(cv));
testData = data(test(cv), :);
testLabels = labels(test(cv));

% Train a decision tree
model = fitctree(trainData, trainLabels);

% Make predictions
predictions = predict(model, testData);

% Calculate accuracy
accuracy = sum(strcmp(predictions, testLabels)) / numel(testLabels) * 100;
fprintf('Accuracy: %.2f%%\n', accuracy);

% Create a bar plot to compare actual and predicted values
figure;

% Bar plot for categorical labels
barData = [grp2idx(testLabels), grp2idx(predictions)]; % Convert labels to indices for plotting
bar(barData, 'grouped'); % Grouped bar plot
xlabel('Sample Index');
ylabel('Category Index');
legend('Actual', 'Predicted');
title('Comparison of Actual vs Predicted Labels');
grid on;

%Enter new data for prediction
new_input = input('Enter new data (comma-separated): ', 's');
new_input = str2num(new_input);
new_pred = predict(model, new_input);
fprintf('Predicted category: %d\n', new_pred);

