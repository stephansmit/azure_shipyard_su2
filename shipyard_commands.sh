#!/bin/bash
#start pool
python3 /opt/batch-shipyard/shipyard.py pool add --configdir shipyard_configdir_singularity/

#running job
python3 /opt/batch-shipyard/shipyard.py jobs add --configdir shipyard_configdir_singularity/ --tail stdout.txt

#deleting job
python3 /opt/batch-shipyard/shipyard.py jobs del --configdir shipyard_configdir_singularity/ -y --wait

#deleting the pool
python3 /opt/batch-shipyard/shipyard.py pool del --configdir shipyard_configdir_singularity/ -y
