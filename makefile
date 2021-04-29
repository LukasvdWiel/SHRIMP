sources = enumerates.F files.F MPIhandling.F geometry.F meshData.F readInput.F shrimp.F splitPointCloud.F findNeighbors.F writeOutput.F matchElements.F

all: clean compile

compile: ${sources}
	sed -i 's/\t/    /g' shrimp.F
	mpif90 -o shrimp -g -ffree-form -fallow-argument-mismatch \
           -I/trinity/opt/apps/software/openmpi/openmpi-4.0.4/build/include \
           ${sources}

clean:
	rm -f *.mod shrimp *.o
