# Estimating Multi-cause Treatment Effects via Single-cause Perturbation (NeurIPS 2021)

Single-cause Perturbation (SCP) is a framework to estimate the multi-cause conditional average treatment effect (CATE) from observational data.

Most existing CATE estimation methods are designed for *single cause* interventions, i.e. only one variable can be intervened on at one time.  However, many applications involve simultaneous intervention on multiple variables. This is the *multi-cause* estimation problem addressed by SCP.

SCP leverages the connection between single and multi-cause interventions and overcomes the confounding bias via data augmentation. 
Compared with existing works, SCP does not make assumptions about the distributional or functional form of the DGP.

## Usage 

To run the code locally, make sure to first install the required python packages specified in `requirements.txt`.

The `reproduce_all.sh` shell script contains commands to reproduce *all* tables and figures in the paper.
The `Fig[x].sh` or `Tab[x].sh`  shell script contain commands to generate results for individual figures or tables.
The `Fig[x].ipynb` notebooks contain commands to create the visualizations.

An implementation of SCP is provided in the file `run_simulation_scp.py`.
Note that SCP is a general framework agnostic to the exact choice of step one and step two estimators.
In this implementation, we use DR-CFR in step one and neural network regression in step two.
The benchmarks are implemented in the files `run_simulation_[x].py`.

## Citation

If you find the software useful, please consider citing the following paper:

```
@inproceedings{scp2021,
  title={Estimating Multi-cause Treatment Effects via Single-cause Perturbation},
  author={Qian, Zhaozhi and Curth, Alicia and van der Schaar, Mihaela},
  booktitle={Advances in neural information processing systems},
  year={2021}
}
```

## License
Copyright 2021, Zhaozhi Qian.

This software is released under the MIT license.
 