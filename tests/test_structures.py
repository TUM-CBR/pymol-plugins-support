from os import path
from typing import NamedTuple

import run as proteinMPNN

BASE_FOLDER = path.dirname(__file__)

class StructureTestSpec(NamedTuple):
    name : str

    model_type : str = "ligand_mpnn"
    number_of_batches: int = 5
    temperature: float = 0.1

def run_structure(spec: StructureTestSpec):

    structure_folder = path.join(BASE_FOLDER, spec.name)

    args = [
        "--out_folder", path.join(structure_folder, "results"),
        "--model_type", spec.model_type,
        "--pdb_path_multi", path.join(structure_folder, "models.json"),
        "--chains_to_design_multi", path.join(structure_folder, "assigned.jsonl"),
        "--fixed_residues_multi", path.join(structure_folder, "fixed.jsonl"),
        "--batch_size", "1",
        "--number_of_batches", str(spec.number_of_batches),
        #"--num_seq_per_target", str(self.__spec.num_seqs),
        #"--backbone_noise", str(args.backbone_noise),
        "--temperature", str(spec.temperature)
    ]

    proteinMPNN.main(proteinMPNN.parse_args(args))

def test_AbKdgD_kda():
    run_structure(
        StructureTestSpec(
            name = "AbKdgD-Kda"
        )
    )