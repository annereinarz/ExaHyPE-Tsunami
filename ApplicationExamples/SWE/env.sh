cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l0 && cp exahype_debug.log-filter exahype.log-filter && \
    cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l1 && cp exahype_debug.log-filter exahype.log-filter && \
    cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l2 && cp exahype_debug.log-filter exahype.log-filter

threads=28
ranks=1
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"cores\": .*/\"cores\": $threads,/g' SWE_asagi_limited_l0.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"cores\": .*/\"cores\": $threads,/g' SWE_asagi_limited_l1.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"cores\": .*/\"cores\": $threads,/g' SWE_asagi_limited_l2.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"background_job_consumers\": .*/\"background_job_consumers\": $threads-1/g' SWE_asagi_limited_l0.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"background_job_consumers\": .*/\"background_job_consumers\": $threads-1/g' SWE_asagi_limited_l1.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"background_job_consumers\": .*/\"background_job_consumers\": $threads-1/g' SWE_asagi_limited_l2.exahype2

cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l0 && cp exahype_debug.log-filter exahype.log-filter
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l1 && cp exahype_debug.log-filter exahype.log-filter
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l2 && cp exahype_debug.log-filter exahype.log-filter
#system("cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l0 && cp exahype_release.log-filter exahype.log-filter");
#    system("cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l1 && cp exahype_release.log-filter exahype.log-filter");
#    system("cd /ExaHyPE-Tsunami/ApplicationExamples/SWE/SWE_asagi_limited_l2 && cp exahype_release.log-filter exahype.log-filter");

cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"time\": 1.0,/\"time\": 10000.0,/g' SWE_asagi_limited_l0.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"time\": 1.0,/\"time\": 10000.0,/g' SWE_asagi_limited_l1.exahype2
cd /ExaHyPE-Tsunami/ApplicationExamples/SWE && sed -i 's/\"time\": 1.0,/\"time\": 10000.0,/g' SWE_asagi_limited_l2.exahype2

mpirun --allow-run-as-root -x OMP_NUM_THREADS=$threads -map-by numa:pe=28 -x LD_LIBRARY_PATH -x SHARED_DIR -n ranks ./ExaHyPE-SWE ../SWE_asagi_limited_l2.exahype2

