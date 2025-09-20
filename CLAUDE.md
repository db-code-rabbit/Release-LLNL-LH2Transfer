# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a MATLAB-based simulation tool for liquid hydrogen (LH2) transfer between vessels, specifically modeling thermodynamic states during transfer from a horizontal trailer (ST) to a vertical storage dewar (ET). The code calculates boil-off and heat transfer using lumped-parameter models and cryogenic fluid dynamics.

## Key Architecture
The simulation follows a modular architecture with distinct phases:
1. **Initialization** (`inputs_TrailerToDewar.m`) - Sets up vessel parameters and initial conditions
2. **Control Logic** (`LH2Control.m`) - Manages fill process stages and valve states
3. **ODE Solver** (`LH2Simulate.m`) - Core physics engine solving mass/energy balance equations
4. **Post-processing** (`Data_extraction.m`) - Extracts and formats simulation results
5. **Visualization** (`plotLH2Data.m`, `plotHeatTransfer.m`) - Generates output plots

## Commands
Since this is a MATLAB project, the main commands are:
- **Run simulation**: Execute `runNominal.m` in MATLAB
- **Output**: Results saved to `output_bottomfill.txt` in the same directory

## Important Dependencies
- **MATLAB**: Developed and tested with R2013b, but should work with newer versions
- **REFPROP**: Required for thermodynamic property calculations
  - Must install REFPROP DLL version 9.1 or compatible
  - Place REFPROP files in the `refprop/` directory:
    - `refprop.m`, `rp_proto.m`, `rp_proto64.m`
    - `REFPRP64.DLL`, `REFPRP64_thunk_pcwin64.dll`
  - Install REFPROP in "Program Files (x86)" on Windows

## Directory Structure
- `/LH2Simulate/` - Main simulation code files
- `/testfuncs/` - Helper functions for heat transfer corrections
  - `AddedMinorCorrections.m` - Controls Nusselt number corrections
  - `VerticalPlates.m` - Natural convection correlations
  - `plotHeatTransfer.m` - Heat transfer visualization
- `/refprop/` - REFPROP interface files (user must provide)

## Key Technical Details
- **Vessel Types**:
  - ST (1) = 17,000 gallon horizontal trailer (feeding)
  - ET (2) = 3,300 gallon vertical storage (receiving)
- **Physics**: Uses 2-phase thermodynamics with condensation/evaporation models
- **Solver**: MATLAB's ode15s for stiff differential equations
- **Units**: Mixed SI and Imperial units (pressure in psi, temperature in K)

## Development Notes
- This is a modified version of the LLNL LH2Transfer code with corrected Nusselt number expressions
- Code verified only for typical LH2 thermodynamic states near 2-phase region
- Not verified for warm vessel cool-down scenarios