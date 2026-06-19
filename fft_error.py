real_ref = open("references/fft/real_ref.txt")
imag_ref = open("references/fft/imag_ref.txt")
real_out = open("results/fft/real_out.txt")
imag_out = open("results/fft/imag_out.txt")

n = 0
mse = 0

for ref_r, ref_i, out_r, out_i in zip(real_ref, imag_ref, real_out, imag_out):
    mse += (float(ref_r.rstrip('\n')) - float(out_r.rstrip('\n')))**2
    mse += (float(ref_i.rstrip('\n')) - float(out_i.rstrip('\n')))**2
    n += 1
    
mse /= n
print(mse)