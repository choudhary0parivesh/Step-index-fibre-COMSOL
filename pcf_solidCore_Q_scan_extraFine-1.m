% pcf_solidCore_Q_scan.m
% Author: Max Yan and COMSOL 5.4
% Date: 20191114
% Purpose: To calculate mode neff of a PCF (quarter structure used)
% Remark:
% - This script calls function SiO2DispSellmeier, which is in a separate
% script file (SiO2DispSellmeier.m). Put two .m files in the same folder.

%% Model exported on Nov 18 2019, 22:01 by COMSOL 5.4.0.388.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/Users/myan/Documents/0teaching/SK2402-2019/lab-fem/pcf-demo');

model.label('pcf_solidCore_Q.mph');

model.param.set('a', '2.5e-6');
model.param.set('d', '1e-6');
model.param.set('wavelength', '1.0e-6');
model.param.set('nSiO2', '1.45');
model.param.set('neff0', '1.4415');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('c1', 'Circle');
model.component('comp1').geom('geom1').feature('c1').set('pos', {'-4*a' '-2*a*sqrt(3)'});
model.component('comp1').geom('geom1').feature('c1').set('r', 'd/2');
model.component('comp1').geom('geom1').create('arr1', 'Array');
model.component('comp1').geom('geom1').feature('arr1').set('fullsize', [9 5]);
model.component('comp1').geom('geom1').feature('arr1').set('displ', {'a' 'sqrt(3)*a'});
model.component('comp1').geom('geom1').feature('arr1').selection('input').set({'c1'});
model.component('comp1').geom('geom1').create('c2', 'Circle');
model.component('comp1').geom('geom1').feature('c2').set('pos', {'-3.5*a' '-1.5*a*sqrt(3)'});
model.component('comp1').geom('geom1').feature('c2').set('r', 'd/2');
model.component('comp1').geom('geom1').create('arr2', 'Array');
model.component('comp1').geom('geom1').feature('arr2').set('fullsize', [8 4]);
model.component('comp1').geom('geom1').feature('arr2').set('displ', {'a' 'a*sqrt(3)'});
model.component('comp1').geom('geom1').feature('arr2').selection('input').set({'c2'});
model.component('comp1').geom('geom1').create('del1', 'Delete');
model.component('comp1').geom('geom1').feature('del1').selection('input').init;
model.component('comp1').geom('geom1').feature('del1').selection('input').set({'arr1(1,1)' 'arr1(1,2)' 'arr1(1,4)' 'arr1(1,5)' 'arr1(2,1)' 'arr1(2,5)' 'arr1(5,3)' 'arr1(8,1)' 'arr1(8,5)' 'arr1(9,1)'  ...
'arr1(9,2)' 'arr1(9,4)' 'arr1(9,5)' 'arr2(1,1)' 'arr2(1,4)' 'arr2(8,1)' 'arr2(8,4)'});
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('base', 'center');
model.component('comp1').geom('geom1').feature('r1').set('size', {'22e-6' '20e-6'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('base', 'center');
model.component('comp1').geom('geom1').feature('r2').set('size', {'26e-6' '24e-6'});
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', {'-13e-6' '-12e-6'});
model.component('comp1').geom('geom1').feature('r3').set('size', {'2e-6' '2e-6'});
model.component('comp1').geom('geom1').create('arr3', 'Array');
model.component('comp1').geom('geom1').feature('arr3').set('fullsize', [2 2]);
model.component('comp1').geom('geom1').feature('arr3').set('displ', {'24e-6' '22e-6'});
model.component('comp1').geom('geom1').feature('arr3').selection('input').set({'r3'});
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'arr1(1,3)' 'arr1(2,2)' 'arr1(2,3)' 'arr1(2,4)' 'arr1(3,1)' 'arr1(3,2)' 'arr1(3,3)' 'arr1(3,4)' 'arr1(3,5)' 'arr1(4,1)'  ...
'arr1(4,2)' 'arr1(4,3)' 'arr1(4,4)' 'arr1(4,5)' 'arr1(5,1)' 'arr1(5,2)' 'arr1(5,4)' 'arr1(5,5)' 'arr1(6,1)' 'arr1(6,2)'  ...
'arr1(6,3)' 'arr1(6,4)' 'arr1(6,5)' 'arr1(7,1)' 'arr1(7,2)' 'arr1(7,3)' 'arr1(7,4)' 'arr1(7,5)' 'arr1(8,2)' 'arr1(8,3)'  ...
'arr1(8,4)' 'arr1(9,3)' 'arr2(1,2)' 'arr2(1,3)' 'arr2(2,1)' 'arr2(2,2)' 'arr2(2,3)' 'arr2(2,4)' 'arr2(3,1)' 'arr2(3,2)'  ...
'arr2(3,3)' 'arr2(3,4)' 'arr2(4,1)' 'arr2(4,2)' 'arr2(4,3)' 'arr2(4,4)' 'arr2(5,1)' 'arr2(5,2)' 'arr2(5,3)' 'arr2(5,4)'  ...
'arr2(6,1)' 'arr2(6,2)' 'arr2(6,3)' 'arr2(6,4)' 'arr2(7,1)' 'arr2(7,2)' 'arr2(7,3)' 'arr2(7,4)' 'arr2(8,2)' 'arr2(8,3)'  ...
'arr3' 'r1' 'r2'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('size', {'13e-6' '12e-6'});
model.component('comp1').geom('geom1').create('int1', 'Intersection');
model.component('comp1').geom('geom1').feature('int1').selection('input').set({'uni1(1)' 'r4'});
model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat1').selection.set([1 4 9 10]);
model.component('comp1').material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat2').selection.set([2 3 5 6 7 8 11 12 13 14 15 16 17 18 19 20 21 22]);
model.component('comp1').material('mat2').propertyGroup.create('RefractiveIndex', 'Refractive index');

model.component('comp1').coordSystem.create('pml1', 'PML');
model.component('comp1').coordSystem('pml1').selection.set([4 9 10]);

model.component('comp1').physics.create('ewfd', 'ElectromagneticWavesFrequencyDomain', 'geom1');
model.component('comp1').physics('ewfd').create('sctr1', 'Scattering', 1);
model.component('comp1').physics('ewfd').feature('sctr1').selection.set([9 22 23 24]);
model.component('comp1').physics('ewfd').create('pmc1', 'PerfectMagneticConductor', 1);
model.component('comp1').physics('ewfd').feature('pmc1').selection.set([2 10 11 12 13 14 15 16 17 19]);

model.component('comp1').mesh('mesh1').autoMeshSize(2);

model.component('comp1').view('view1').axis.set('xmin', -3.249996893828211E-7);
model.component('comp1').view('view1').axis.set('xmax', 1.3324999599717557E-5);
model.component('comp1').view('view1').axis.set('ymin', -9.016848707688041E-7);
model.component('comp1').view('view1').axis.set('ymax', 1.2901685295219067E-5);

model.component('comp1').material('mat1').label('SiO2');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('n', {'nSiO2' '0' '0' '0' 'nSiO2' '0' '0' '0' 'nSiO2'});
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat2').label('Air');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});

model.study.create('std1');
model.study('std1').create('mode', 'ModeAnalysis');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('e1', 'Eigenvalue');
model.sol('sol1').feature('e1').create('d1', 'Direct');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').create('surf1', 'Surface');

model.study('std1').feature('mode').set('modeFreq', 'c_const/wavelength');
model.study('std1').feature('mode').set('neigsactive', true);
model.study('std1').feature('mode').set('neigs', 1);
model.study('std1').feature('mode').set('shiftactive', true);
model.study('std1').feature('mode').set('shift', 'neff0');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('e1').set('transform', 'effective_mode_index');
model.sol('sol1').feature('e1').set('neigs', 1);
model.sol('sol1').feature('e1').set('shift', 'neff0');
model.sol('sol1').feature('e1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('e1').feature('d1').label('Suggested Direct Solver (ewfd)');
% model.sol('sol1').runAll;

model.result('pg1').label('Electric Field (ewfd)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('smooth', 'internal');
model.result('pg1').feature('surf1').set('resolution', 'normal');

%% Custumized scan
wavelength1=1e-6;   % w normalized to w0
wavelength2=2e-6;
nWavelengths=51;
wavelengths=linspace(wavelength1, wavelength2, nWavelengths);
filename='lambda_neff.txt';
% Two previous neff values, used for next guessing
neff00=[1.4420,1.4418];
for ctr=1:nWavelengths
    file=fopen(filename,'a');
    
    wavelength=wavelengths(ctr);
    
    % Estimate the next guess
    if ctr>2
        neff0=interp1(wavelengths(ctr-2:ctr-1),neff00,wavelength,'linear','extrap');
    else
        neff0=neff00(ctr);
    end
    % Get SiO2 index
    [epsSiO2R,epsSiO2I]=SiO2DispSellmeier(wavelength*1e6);
    display(sprintf('wavelength=%1.6fum', wavelength*1e6));
    display(sprintf('nSiO2=%1.6f', sqrt(epsSiO2R)));
    display(sprintf('neff guessed: %1.6f', neff0));
    
    model.param.set('wavelength', num2str(wavelength,12));
    model.param.set('nSiO2', num2str(sqrt(epsSiO2R),12));
    model.param.set('neff0', num2str(neff0,12));
    
    model.sol('sol1').runAll;

    % Get eigenvalues
    ki=mphglobal(model,'real(lambda)','dataset','dset1','outersolnum',1);
    kr=mphglobal(model,'imag(lambda)','dataset','dset1','outersolnum',1);
    
    display(sprintf('neff obtained: %1.6f+%1.6ei', -kr/(2*pi/wavelength),-ki/(2*pi/wavelength)));
    display(sprintf('\n'));
    
    
	fprintf(file,'%.6f\t%.10f\t%.10f\n', wavelength*1e6, -kr/(2*pi/wavelength), -ki/(2*pi/wavelength));

    % Prepare neff00 for next guess
    if ctr>2
        neff00(1)=neff00(2);
        neff00(2)=-kr/(2*pi/wavelength);
    end
    
    fclose(file);
end
% out = model;
