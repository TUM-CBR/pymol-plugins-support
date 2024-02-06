if (Test-Path dist) {
    Remove-Item -Recurse dist
}
New-Item -Path . -Name dist -ItemType "directory"
python -m pip install -r .\requirements.txt

$current_directory = (Get-Location).Path

#############################################################################################################################
# Create the CBR Extra package
#############################################################################################################################
Set-Location cbr-tools-extra\repository
if (Test-Path virtualenv) {
    Remove-Item -Recurse virtualenv
}
python -m virtualenv virtualenv
.\virtualenv\Scripts\pip.exe install -r ..\requirements.txt
.\virtualenv\Scripts\pyinstaller.exe -n cbrtools --collect-all primer3 --distpath ..\..\dist\ cbrtools.py
Set-Location $current_directory
#############################################################################################################################

#############################################################################################################################
# ProteinMPNN package
#############################################################################################################################
Set-Location ProteinMPNN\repository
if (Test-Path virtualenv) {
    Remove-Item -Recurse virtualenv
}
python -m virtualenv virtualenv
.\virtualenv\Scripts\pip install ..\requirements.txt
.\virtualenv\Scripts\pyinstaller.exe -n proteinMPNN `
    --add-data "soluble_model_weights\v_48_002.pt;soluble_model_weights\" `
    --add-data "soluble_model_weights\v_48_010.pt;soluble_model_weights\" `
    --add-data "soluble_model_weights\v_48_020.pt;soluble_model_weights\" `
    --add-data "soluble_model_weights\v_48_030.pt;soluble_model_weights\" `
    --add-data "soluble_model_weights\excluded_PDBs.csv;soluble_model_weights\excluded_PDBs.csv" `
    --add-data "vanilla_model_weights\v_48_002.pt;vanilla_model_weights\" `
    --add-data "vanilla_model_weights\v_48_010.pt;vanilla_model_weights\" `
    --add-data "vanilla_model_weights\v_48_020.pt;vanilla_model_weights\" `
    --add-data "vanilla_model_weights\v_48_030.pt;vanilla_model_weights\" `
    --distpath ..\..\dist\ protein_mpnn_run.py
#############################################################################################################################