if (Test-Path dist) {
    Remove-Item -Recurse dist
}
New-Item -Path . -Name dist -ItemType "directory"
python -m pip install -r .\requirements.txt

$current_directory = (Get-Location).Path

#############################################################################################################################
# Create the CBR Extra package
#############################################################################################################################
#Set-Location cbr-tools-extra\repository
#if (Test-Path virtualenv) {
#    Remove-Item -Recurse virtualenv
#}
#python -m virtualenv virtualenv
#.\virtualenv\Scripts\pip.exe install -r ..\requirements.txt
#.\virtualenv\Scripts\pyinstaller.exe -n cbrtools --collect-all primer3 --distpath ..\..\dist\ cbrtools.py
#Set-Location $current_directory
#############################################################################################################################

#############################################################################################################################
# ProteinMPNN package
#############################################################################################################################
#Set-Location ProteinMPNN\repository
#if (Test-Path virtualenv) {
#    Remove-Item -Recurse virtualenv
#}
#python -m virtualenv virtualenv
#.\virtualenv\Scripts\pip install -r ..\requirements.txt
#.\virtualenv\Scripts\pyinstaller.exe -n proteinMPNN `
#    --add-data "soluble_model_weights\v_48_002.pt;soluble_model_weights\" `
#    --add-data "soluble_model_weights\v_48_010.pt;soluble_model_weights\" `
#    --add-data "soluble_model_weights\v_48_020.pt;soluble_model_weights\" `
#    --add-data "soluble_model_weights\v_48_030.pt;soluble_model_weights\" `
#    --add-data "soluble_model_weights\excluded_PDBs.csv;soluble_model_weights\excluded_PDBs.csv" `
#    --add-data "vanilla_model_weights\v_48_002.pt;vanilla_model_weights\" `
#    --add-data "vanilla_model_weights\v_48_010.pt;vanilla_model_weights\" `
#    --add-data "vanilla_model_weights\v_48_020.pt;vanilla_model_weights\" `
#    --add-data "vanilla_model_weights\v_48_030.pt;vanilla_model_weights\" `
#    --distpath ..\..\dist\ protein_mpnn_run.py
#Set-Location $current_directory
#############################################################################################################################

#############################################################################################################################
# LigandMPNN package
#############################################################################################################################
Set-Location LigandMPNN\repository
if (Test-Path virtualenv) {
    Remove-Item -Recurse virtualenv
}
python -m virtualenv virtualenv
.\virtualenv\Scripts\pip install -r ..\requirements.txt
.\virtualenv\Scripts\pyinstaller.exe -n ligandMPNN `
    --add-data "model_params\global_label_membrane_mpnn_v_48_020.pt;model_params\" `
    --add-data "model_params\ligandmpnn_v_32_005_25.pt;model_params\" `
    --add-data "model_params\ligandmpnn_v_32_010_25.pt;model_params\" `
    --add-data "model_params\ligandmpnn_v_32_020_25.pt;model_params\" `
    --add-data "model_params\ligandmpnn_v_32_030_25.pt;model_params\" `
    --add-data "model_params\per_residue_label_membrane_mpnn_v_48_020.pt;model_params\" `
    --add-data "model_params\proteinmpnn_v_48_002.pt;model_params\" `
    --add-data "model_params\proteinmpnn_v_48_010.pt;model_params\" `
    --add-data "model_params\proteinmpnn_v_48_020.pt;model_params\" `
    --add-data "model_params\proteinmpnn_v_48_030.pt;model_params\" `
    --add-data "model_params\solublempnn_v_48_002.pt;model_params\" `
    --add-data "model_params\solublempnn_v_48_010.pt;model_params\" `
    --add-data "model_params\solublempnn_v_48_020.pt;model_params\" `
    --add-data "model_params\solublempnn_v_48_030.pt;model_params\" `
    --distpath ..\..\dist\ run.py
Set-Location $current_directory