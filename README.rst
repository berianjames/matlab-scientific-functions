************************
matlab-science-functions
************************

:Date: March 10, 2012
:Version: 0.4
:Authors: Berian James
:Web site: https://github.com/berianjames/matlab-science-functions
:Copyright: This document has been placed in the public domain.
:License: This code is released under the MIT license.

===========================
Matlab scientific functions
===========================

This repository holds a set of short functions that aid scientific programming and data analysis in Matlab. Some of them implement routines that are similar to code that exists elsewhere, and I try to indicate this when I can. Many are not readily available elsewhere. 

Index
=====

* PolynomialDivision
* numericaltools
* plottingtools

PolynomialDivision
==================

Contains two functions for performing division on polynomials: one is for division over the integers and the other is over the integers mod n. These scripts were written to help with analysis of torus knots in knot theory, as published in [C11]_.

PolynomialDivision
------------------

`[quot,rem] = PolynomialDivision(coeffs,div)`

Polynomials are represented as vectors of coefficients, going from x^n down to x^0. E.g., x^3 + 2x + 4 :: [1 0 2 4]

This routine calculates quotient and remainder such that coeffs / div = quot + rem / div

PolynomialDivisionMod
---------------------

`[quot,rem] = PolynomialDivisionMod(coeffs,div,n)`

Performs polynomial division with the integers mod n.


.. [C11] Collins, Julia (2011), The L^2 signature of torus knots, http://arxiv.org/abs/1001.1329

numericaltools
==============

These are a set of numerical functions I use commonly in analysing data. There is some overlap with scientifictools---the distinction is mostly that these functions are shorter and deployed more frequently.

bisect
------
Implementation of 1-d bisection, written as an exericse, but used frequently.

Input: array (vector of scalar values)
       values (vector of bisection locations to find)
Output: index (vector of bisection indices)


gaussian, gaussian2, gaussian3, gaussian3b
------------------------------------------

Construct one-, two- and three-dimensional isotropic gaussian, and three-dimensional anisotropic gaussian (3b). Styled on code from within the Mathworks distribution.

Input: field (1-, 2- or 3-d array of scalar values)
       width (scalar or 3-vector (gaussian3b), representing smoothing width)

hist2, hist3, whist2
--------------------
Two- and three-dimensional histogramming from data coordinates, and weighted two-dimensional histogramming.

n = hist2(data,[nx,ny,w,[xmin xmax ymin ymax]])

Inputs: data (n x 2 vector of x,y values, n x 3 in hist3)
        nx, ny (integers, number of bins in the x- and y-directions
        [in whist2] w (n-vector, weights for each data point)
        xmin, xmax, ymin, ymax (floats, limits on x and y)
	[in hist3] nz (bins in z-direction)
	[in hist3] zmin, zmax (limits in z-direction)

Output: counts (two- or three-dimensional histogram)

smooth, smooth2, smooth3b
-------------------------

1-, 2- and 3-D Gaussian smoothing using FFT

Input: input (vector of scalar values)
       width (float, width of smoothing, in pixels)
       padding (integer, number of cells to pad with zeros)    
Output: vector of smoothed scalar values, same size as original

plottingtools
=============

A set of short snippets I use ubiquitously in producing plots for papers. 

imageplot and imageplot_smooth
------------------------------

[counts,h] = imageplot(x,y,res);

imageplot snippet to return and plot a two-dimension histogram from (x,y) data and imageplot the result, scaling and inverting the colormap to give black counts on a white background. Uses hist2 from numericaltools.

Input: x (vector), y (vector), res (scalar or 2-vector)
Output: counts (2-d array), plot handle

logaxislabels
-------------

logaxislabels(Axis)

Modifies labels on a logarithmic axis to display as, e.g., 0.01 instead of 10^2. Looks a bit more professional, really.

Input: Axis (axis handle)

prep_fig
--------

Prepares a simple Matlab plot figure for exporting (with exportfig, say). This amounts to making the axis ticks larger, adding labels.

Input: handle (figure handle), xlab, ylab (strings for x- and y-labels, with $math$ to be parsed by LaTeX, fsize (integer font size)
