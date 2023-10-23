import numpy as np 

class Camera:
    """
    Defines a generic and ideal tof camera
    """
    def __init__(self, freq):
        self.freq = freq
        self.c = 3e8
        self.wavelength = self.c / self.freq # in m
        self.max_depth = self.wavelength / 2 
        self.A = 0.5
        self.B = 2 * np.pi / self.wavelength

    def calculate_quadrature(self, depth):
        """
        Calculates the quadrature of the signal

        Args:
            depth (float): depth of the object in meters

        Returns:
            g0,g1,g2,g3 (float): quadrature of the signal
        """

        g0 = self.A / 2 * np.cos(self.B * depth)
        g1 = - self.A / 2 * np.sin(self.B * depth)
        g2 = - self.A / 2 * np.cos(self.B * depth)
        g3 = self.A / 2 * np.sin(self.B * depth)

        return g0, g1, g2, g3
    
    def calculate_phase(self, g0, g1, g2, g3):
        """
        Calculates the phase of the signal

        Args:
            g0,g1,g2,g3 (float): quadrature of the signal

        Returns:
            phase (float): phase of the signal between [0, 2pi]
        """

        phase = np.arctan2(g3 - g1, g0 - g2) 
        return phase * 2
    
    def calculate_depth(self, phase):
        """
        Calculates the depth of the object

        Args:
            phase (float): phase of the signal between [0, 2pi]

        Returns:
            depth (float): depth of the object in meters
        """
        
        depth = (self.c/2) * ( phase / (2 * np.pi * self.c/ (self.wavelength) ) )
        return depth
    
    def simulate(self, depth):
        """
        Simulates the signal of the camera

        Args:
            depth (float): depth of the object in meters (ideal)

        Returns:
            depth (float): depth of the object in meters (simulated)
        """

        g0, g1, g2, g3 = self.calculate_quadrature(depth)
        phase = self.calculate_phase(g0, g1, g2, g3)
        depth = self.calculate_depth(phase)
        
        return depth