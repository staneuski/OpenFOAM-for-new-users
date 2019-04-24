#!/bin/bash

cd forwardStep/
rm -r log.* && ./Allclean
cd ../bumpMinf0675/
rm -r log.* && ./Allclean
cd ../AxialStageMRFRotating/
rm -r log.* && ./Allclean
cd ../AxialMixerMRFCHTSteadyState/
rm -r log.* && ./Allclean
cd ../AxialMixerMRFCHTUnsteady/
rm -r log.* && ./Allclean
cd ../AxialMixerMRFFSISteadyState/
rm -r log.* && ./Allclean
cd ../AxialRotorMRF/
rm -r log.* && ./Allclean
cd ../AxialRotorSRF/
rm -r log.* && ./Allclean
