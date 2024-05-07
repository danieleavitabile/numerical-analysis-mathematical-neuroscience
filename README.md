
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11124322.svg)](https://doi.org/10.5281/zenodo.11124322)

<img src="ttps://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/assets/brain.png" width="48">

# Tutorials on numerical analysis for neurobiological networks

These tutorials are written for the masterclass [*Numerical and Analytical Methods for Spatially-Extended Neurobiological Networks*](https://www.uu.nl/en/events/ccss-masterclass-on-numerical-and-analytical-methods-for-spatially-extended-neurobiological-networks?ref=danieleavitabile.com), held at the Centre for Complex Systems Studies, University of Utrecht in May 2024.

* [Tutorial 1](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Tutorials/Tutorial1/Questions/tutorial-1.pdf)
*  [Tutorial 2](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Tutorials/Tutorial2/Questions/tutorial-2.pdf)
  
## Getting started
1. Download the latest release of the tutorial, under **Releases**, on the right-hand-side of the present webpage, or [here](https://doi.org/10.5281/zenodo.11124322).
1. Download the [accompanying dataset](https://zenodo.org/records/11120604).
1. Click on `Tutorial1` above, which contains links to files in the `src` folder.
1. Solutions to Tutorial 1 are available in an html file, linked in the tutorial pdf so you can browse at once code and generated graphs.
1. You should be able to progress even if you get stuck on a question: try to get some tips from the html file.
1. Some tasks are longer than others, and involve a substantial amount of coding, which is another reason for providing solutions. Even if you find it too cumbersome to write code for every single question, you are expected to have a full grasp of the solutions before progressing.
1. The code that generated `Tutorials/Tutorial1/Solutions/html/driver.html` is in `Tutorials/Tutorial1/Solutions/`, and you may need access to it for some tasks. While you are welcome to reuse functions in this directory in other tutorials, my strong advice is to write your own files first, and then amend them after you have seen the solutions, if you find it useful. Remember that there is not a unique way to accomplish a task.

You are welcome to send me pull requests if you correct errors in the tutorial questions or solutions: all sources, including the LaTeX files for the questions are in the `src/` directory, so you can modify them too (your work will be acknowledged explicitly).

I am keen to include Julia and Python versions of the solutions, so do not hesitate to contact me if you want to help.

## Citation
Please cite this work using these both references below

```
@software{avitabile2024,
  author = {Avitabile, Daniele},
  doi = {10.5281/zenodo.11124322},
  month = {04},
  title = {{Tutorials on Numerical and Analytical Methods for Spatially-Extended Neurobiological Networks}},
  url = {https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience},
  version = {1.0.0},
  year = {2024}
}

@article{avitabileProjectionMethodsNeural2023,
  title = {Projection {{Methods}} for {{Neural Field Equations}}},
  author = {Avitabile, Daniele},
  year = {2023},
  month = apr,
  journal = {SIAM Journal on Numerical Analysis},
  volume = {61},
  number = {2},
  pages = {562--591},
  issn = {0036-1429, 1095-7170},
  doi = {10.1137/21M1463768},
}
```
