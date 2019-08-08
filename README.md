# Scripts to run SU2 containers with Azure Shipyard using a Singularity Shipyard Container

Scripts to run [SU2](https://su2code.github.io/) with [Open MPI](https://www.open-mpi.org/) version 1.10.2 on [Azure Shipyard](https://batch-shipyard.readthedocs.io/en/latest/00-introduction/") with [Singularity Container](https://github.com/stephansmit/azure_shipyard_su2)

## Pull the container
~~~~
singularity pull shub://stephansmit/shipyard_containers:master
~~~~

## Setting up the Batch Account
Shell in the container
~~~~
singularity shell shipyard_containers_master.sif 
~~~~

Login with your Microsoft account using the browser
~~~~
az login
~~~~

Create a service principle to login without authentication
~~~~
./create_service_principle.sh
~~~~

Login with service principle and create the azure resources
~~~~
./create_azure_resources.sh
~~~~


Make the credentials yaml file for Shipyard
~~~~
./create_shipyard_config.sh
~~~~

## Running a shipyard Job

~~~
./shipyard_commands.sh
~~~

