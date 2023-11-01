#!/bin/bash
placement=("yarn") 
#schedule=("fifo" "sjf" "shortest" "shortest-gpu" "dlas-gpu" "dlas-gpu-gittins")
schedule=("shortest")
#schedule=("dlas" "dlas-gpu" "dlas-gpu-100" "dlas-gpu-8" "dlas-gpu-4" "dlas-gpu-2" "dlas-gpu-1" "dlas-gpu-05")
# schedule=("dlas-gpu")
#schedule=("dlas-gpu-gittins")
#schedule=("shortest-gpu")
#schedule=("dlas" "dlas-gpu")
# schedule=("dlas-gpu-05")
# schedule=("dlas-gpu-1" "dlas-gpu-2" "dlas-gpu-4" "dlas-gpu-8" "dlas-gpu-10" "dlas-gpu-100" "dlas-gpu-1000")
#schedule=("fifo")
#jobs=("60")
jobs=("11cb48") # 0e4a51 103959 11cb48 2869ce 6214e9 6c71a0 7f04ca b436b2 e13805 ed69ec ee9e8c
setups=("n32g4")


for setup in ${setups[@]};do
    cluster_spec="${setup}.csv"
    for job in ${jobs[@]};do
        #job_file="${job}_job.csv"
        job_file="traces/${job}.csv"
        log_folder="${setup}j${job}"
        mkdir ${log_folder}
        for p in ${placement[@]};do
            for s in ${schedule[@]};do
                log_name="${log_folder}/${s}-${p}"
                #cmd="python run_sim.py --cluster_spec=${cluster_spec} --print --scheme=${p} --trace_file=${job_file} --schedule=${s} --log_path=${log_name}"
		cmd="python run_sim_ov.py --cluster_spec=${cluster_spec} --print --scheme=${p} --trace_file=${job_file} --schedule=${s} --log_path=${log_name}"
                echo ${cmd} 
                python run_sim_ov.py --cluster_spec=${cluster_spec} --print --scheme=${p} --trace_file=${job_file} --schedule=${s} --log_path=${log_name}
            done
        done
    done
done
