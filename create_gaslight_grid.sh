incident_grid_dir='/research/astrodata/highz/synthesizer/grids'
grid_dir='/research/astrodata/highz/gaslight/grids'
output_dir='/research/astrodata/highz/gaslight/cloudy'

# standard SPS grid
# incident_grids=('bpass-2.2.1-bin_chabrier03-0.1,300.0-ages:6.,7.,8.')
# config_files=('c23.01-full')

# standard SPS grid
incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0-ages:6,7,8")
config_files=("sps-c23.01-test-v1")

# standard AGN grid
# incident_grids=( "qsosed-isotropic-limited" )
# config_files=( "agn-c23.01-reduced-v1" )

incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0"  "qsosed-isotropic-limited")
config_files=("sps-c23.01-v1" "agn-c23.01-v1")

incident_grids=("qsosed-isotropic-limited")
config_files=("agn-c23.01-test-v1")

cd ..

for i in "${!incident_grids[@]}"; do

    incident_grid=${incident_grids[$i]}
    config_file=${config_files[$i]}
    # run the setup script
    echo python create_gaslight_grid.py -grid_dir=$grid_dir -incident_grid_dir=$incident_grid_dir -incident_grid=$incident_grid -config_file=$config_file -output_dir=$output_dir
    python create_gaslight_grid.py -grid_dir=$grid_dir -incident_grid_dir=$incident_grid_dir -incident_grid=$incident_grid -config_file=$config_file -output_dir=$output_dir

done





