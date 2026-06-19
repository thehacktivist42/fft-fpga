outFile = "data/fft/ref.json";

X = 0:1023;

tic;
X_fft = fft(X, 1024);
elapsedTime = toc;
disp(['Exeuction time: ', num2str(elapsedTime), ' seconds']);
X_fft_real = real(X_fft);
X_fft_imag = imag(X_fft);

data = fopen(file, "w");

s = struct();

for i = 1 : length(X_fft)
    op = [X_fft_real(i), X_fft_imag(i)];
    s.(sprintf('in_%d', X(i))) = op;
end

jsonString = jsonencode(s, PrettyPrint=true);
fprintf(data, "%s", jsonString);