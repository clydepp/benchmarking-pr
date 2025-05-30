import cython
import numpy as np
cimport numpy as cnp
from libc.math cimport sqrt

# Define the data types
ctypedef cnp.float64_t DTYPE_t
ctypedef cnp.int64_t ITYPE_t

def mandelbrot_cy(double complex c, int max_iter):
    cdef double complex z = c
    cdef int n
    cdef double abs_z
    
    for n in range(max_iter):
        abs_z = sqrt(z.real * z.real + z.imag * z.imag)
        if abs_z > 2.0:
            return n
        z = z * z + c
    return max_iter

def mandelbrot_set_cy(double xmin, double xmax, double ymin, double ymax, 
                      int width, int height, int max_iter):
    cdef cnp.ndarray[ITYPE_t, ndim=2] result = np.zeros((height, width), dtype=np.int64)
    cdef double x_step = (xmax - xmin) / width
    cdef double y_step = (ymax - ymin) / height
    cdef int i, j
    cdef double x, y
    cdef double complex c
    
    for i in range(height):
        y = ymin + i * y_step
        for j in range(width):
            x = xmin + j * x_step
            c = x + 1j * y
            result[i, j] = mandelbrot_cy(c, max_iter)
    
    return result