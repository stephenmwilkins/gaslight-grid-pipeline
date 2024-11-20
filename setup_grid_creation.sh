
# runs the setup script and optionally runs a single grid point

# apollo2
grid_dir='/research/astrodata/highz/synthesizer/grids'
output_dir='/its/home/sw376/astrodata/gaslight/cloudy'
cloudy_dir='/research/astro/flare/software/cloudy/'
machine='apollo2'

# local
# grid_dir='/Users/sw376/Dropbox/Research/data/synthesizer/grids'
# output_dir='/Users/sw376/Dropbox/Research/data/gaslight/cloudy'
# cloudy_dir='/Users/sw376/Dropbox/Research/software/cloudy'

# standard SPS grid
# incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0-ages:6,7,8")
# config_files=("c23.01-full")

# standard SPS grid
# incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0")
# config_files=("sps-c23.01-v1")

# standard AGN grid
# incident_grids=( "qsosed-isotropic-limited" )
# config_files=( "agn-c23.01-v1" )

incident_grids=("qsosed-isotropic-limited")
config_files=("agn-c23.01-test-v1")

incident_grids=("qsosed-isotropic-limited")
config_files=("agn-c23.01-reduced-v1")

incident_grids=("qsosed-isotropic-limited")
config_files=("agn-c23.01-v1")

# incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0"  "qsosed-isotropic-limited")
# config_files=("sps-c23.01-v1" "agn-c23.01-v1")

incident_grids=("bpl-feltre16" "bpl-feltre16")
config_files=("agn-c23.01-extremes-v1" "agn-c23.01-reduced-v1")

incident_grids=("bpl-feltre16")
config_files=("agn-c23.01-v1")


cd ..

for i in "${!incident_grids[@]}"; do

    incident_grid=${incident_grids[$i]}
    config_file=${config_files[$i]}
    # run the setup script
    python setup_grid_creation.py -grid_dir=$grid_dir -incident_grid=$incident_grid -config_file=$config_file -output_dir=$output_dir -cloudy_dir=$cloudy_dir -machine=$machine

    # echo the command to run the first grid point (for testing / development purposes)
    index=1
    echo python run_cloudy.py -grid_dir=$grid_dir -incident_grid=$incident_grid -config_file=$config_file -output_dir=$output_dir -cloudy_dir=$cloudy_dir -index=$index

done







