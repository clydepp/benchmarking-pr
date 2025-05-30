from py.mdb import mandelbrot_set as mbs
from cy.cmdb import mandelbrot_set_cy as mbscy
import time

print("Starting Python test\n")
t0 = time.time()
for i in range(100):
    py = mbs(-2.0, 1.0, -1.5, 1.5, 640, 480, 200)
t1 = time.time()
totalpy = t1-t0

print("Starting Cython test\n")
t0 = time.time()
for i in range(100):
    cy = mbscy(-2.0, 1.0, -1.5, 1.5, 640, 480, 200)
t1=time.time()
totalcy = t1-t0

print(totalpy)
print(totalcy)