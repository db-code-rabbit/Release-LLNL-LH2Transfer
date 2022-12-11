# Release LH2 Transfer Simulation

This release proposes minor modifications of the LH2TS (for "LH2 Transfer Simulation") code developed and published online such as https://github.com/LLNL/LH2Transfer.
These modifications only concern the file LH2Simulate.m, in which the expressions of the Nusselt number used to calculate the thermal exchanges, walls/fluids (liquid phase and gas phase) inside the external tank (ET) have been corrected. 

# Description of the files and folders

This release of LH2Simulate.m uses a function named AddedMinorCorrections.m, which activates or deactivates the various Nusselt number corrections proposed.

A post-processing file, named plotHeatTransfer.m, used in runNominal.m file, has also been created to display the results of the heat transfers in the external tank (ET)

For this release of the LH2TS code, a folder named TESTFUNCS was also created, in which the following files are located:
-	AddedMinorCorrections.m: which activates or deactivates the corrected Nusselt number expressions
-	VerticalPlates.m: gives various correlation expressions from the literature for the natural flow along a vertical wall and is called in LH2Simulate.m
-	plotHeatTransfer.m: post-processing of heat transfer results in the external tank (ET)

Another folder named REFPROP has been created where the user has to place the different files; for linking REFPROP with MATLAB, make sure to follow instructions that can be found online, such as http://trc.nist.gov/refprop/LINKING/Linking.htm (last accessed 12/7/2017)

-	refprop.m
-	rp_proto.m
-	rp_proto64.m
-	REFPRP64.DLL
-	REFPRP64_thunk_pcwin64.dll
