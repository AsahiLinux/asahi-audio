import sys, numpy, scipy
from scipy import signal
import matplotlib.scale as scale
import matplotlib.pyplot as plt

rate, data = scipy.io.wavfile.read(sys.argv[1])

w, h = signal.freqz(data, worN=65536)

w *= rate / (2 * numpy.pi)

fig, ax1 = plt.subplots(figsize=(10,8))

ax1.plot(w, 20 * numpy.log10(abs(h)), 'b')

plt.ylabel('Amplitude [dB]', color='b')
plt.xlabel('Frequency [Hz]')

ax1.grid()
ax1.set_xscale('log')
plt.xlim([20, 20000])

#ax1.xlim([25, 50])

ax2 = ax1.twinx()
angles = numpy.unwrap(numpy.angle(h))
ax2.plot(w, angles, 'g')
plt.ylabel('Angle (radians)', color='g')
#plt.axis('tight')
plt.show()

