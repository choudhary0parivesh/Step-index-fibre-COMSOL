function [epsRe,epsIm]=SiO2DispSellmeier(lambda)
% PURPOSE: To compute epsilon of silica based on Sellmeier fit
% AUTHOR: Max Yan (maxyan@kth.se)
% DATE: 20191101
% DESCRIPTION:
% - Input: wavelength in um

c=299792458;    % in fact tis c can be canclled

omega = 2*pi*c/lambda;

B1 = 0.6961663;
B2 = 0.4079426;
B3 = 0.8974794;
lambda1 = 0.0684043;
lambda2 = 0.1162414;
lambda3 = 9.896161;
omega1 = 2*pi*c/lambda1;
omega2 = 2*pi*c/lambda2;
omega3 = 2*pi*c/lambda3;

epsRe = 1+B1*omega1^2/(omega1^2-omega^2)+B2*omega2^2/(omega2^2-omega^2)+B3*omega3^2/(omega3^2-omega^2);
epsIm=0;