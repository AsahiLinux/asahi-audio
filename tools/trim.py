import sys, numpy, scipy

EPSILON = 1e-10 # -200dB

rate, data = scipy.io.wavfile.read(sys.argv[1])

count = len(numpy.trim_zeros((abs(data) > EPSILON), "b"))

data = data[:count]

scipy.io.wavfile.write(sys.argv[2], rate, data)
