#!/bin/bash

#master-branch
mkdir APU_turbocharger_master
wget -O APU_turbocharger_master/Jones.cfg https://raw.githubusercontent.com/su2code/SU2/master/TestCases/turbomachinery/APU_turbocharger/Jones.cfg
wget -O APU_turbocharger_master/jones_turbine.su2 https://github.com/su2code/TestCases/raw/master/turbomachinery/APU_turbocharger/jones_turbine.su2
wget -O APU_turbocharger_master/solution_flow_0.dat https://github.com/su2code/TestCases/raw/master/turbomachinery/APU_turbocharger/solution_flow_0.dat
wget -O APU_turbocharger_master/solution_flow_1.dat https://github.com/su2code/TestCases/raw/master/turbomachinery/APU_turbocharger/solution_flow_1.dat

#develop branch
mkdir APU_turbocharger_develop
wget -O APU_turbocharger_develop/Jones.cfg https://raw.githubusercontent.com/su2code/SU2/develop/TestCases/turbomachinery/APU_turbocharger/Jones.cfg
wget -O APU_turbocharger_develop/stator.cfg https://github.com/su2code/SU2/raw/develop/TestCases/turbomachinery/APU_turbocharger/stator.cfg
wget -O APU_turbocharger_develop/rotor.cfg https://github.com/su2code/SU2/raw/develop/TestCases/turbomachinery/APU_turbocharger/rotor.cfg
wget -O APU_turbocharger_develop/mesh_jones_turbine.su2 https://github.com/su2code/TestCases/raw/develop/turbomachinery/APU_turbocharger/mesh_jones_turbine.su2
wget -O APU_turbocharger_develop/solution_flow_0.dat https://github.com/su2code/TestCases/raw/develop/turbomachinery/APU_turbocharger/solution_flow_0.dat
wget -O APU_turbocharger_develop/solution_flow_1.dat https://github.com/su2code/TestCases/raw/develop/turbomachinery/APU_turbocharger/solution_flow_1.dat


