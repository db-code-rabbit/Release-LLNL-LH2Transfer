# Release LH2 Transfer Simulation

This release proposes minor modifications of the LH2TS (for "LH2 Transfer Simulation") code developed and published online such as https://github.com/LLNL/LH2Transfer.
These modifications concern only the file LH2Simulate.m, in which, the expressions of the Nusselt number used to calculate the thermal exchanges, walls/fluids (liquid phase and gas phase) inside the external tank (ET), have been corrected. 

# Description of the files and folders

The new release of LH2Simulate.m uses a function, named AddedMinorCorrections.m, which activates or deactivate the different Nusselt number corrections proposed.

A post-processing file, named plotHeatTransfer.m is used in runNominal.m file, has also been created to display the results of the heat transfers in the external tank (ET)

For this release of the LH2TS code, a folder named TESTFUNCS was also created, and in which the following files are located :
-	AddedMinorCorrections.m : which activates or deactivates corrected the Nusselt number expressions
-	VerticalPlates.m : gives different types of correlations from the literature for the natural flow along a vertical wall, and is called in LH2Simulate.m
-	plotHeatTransfer.m  : post-processing of heat transfer results in external tank (ET)

Another folder named REFPROP has been created where the user has to place the different files that allow to use the properties/data of REFPROPM :

-	refprop.m
-	rp_proto.m
-	rp_proto64.m
-	REFPRP64.DLL
-	REFPRP64_thunk_pcwin64.dll
