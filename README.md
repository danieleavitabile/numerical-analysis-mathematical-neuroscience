[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11124322.svg)](https://doi.org/10.5281/zenodo.11124322)

# Tutorials on numerical analysis for neurobiological networks

This is material written for the masterclass [*Numerical and Analytical Methods for Spatially-Extended Neurobiological Networks*](https://www.uu.nl/en/events/ccss-masterclass-on-numerical-and-analytical-methods-for-spatially-extended-neurobiological-networks?ref=danieleavitabile.com), held at the Centre for Complex Systems Studies, University of Utrecht in May 2024.

## Getting started
1. Download the latest release of the tutorial, under **Releases**, on the right-hand-side of the present webpage, or [here](https://github.com/danieleavitabile/nonlinear-dynamical-systems-course-tutorials/releases).
1. Download the [accompanying dataset](https://zenodo.org/records/11120604).
1. Go to the `Tutorial/Tutorial1` folder, which contains links to files in the `src` folder (no need to enter the latter folder yet). 
1. Open `Tutorial1/tutorial-01.pdf` and start working: make a brand new folder on your computer for Tutorial 1, and populate it with your own code (keep solutions on a side).
1. Solutions to Tutorial 1 are available in an html file, so you can click on `Tutorial1/solutions-01-code.html` and browse at once code and generated graphs. Some questions are answered with pen and paper, and those are in `Tutorial1/solutions-01-analysis.pdf`.
1. You should be able to progress even if you get stuck on a question: try to get some tips from the html file.
1. Some tasks are longer than others, and involve a substantial amount of coding, which is another reason for providing solutions. Even if you find it too cumbersome to write code for every single question, you are expected to have a full grasp of the solutions before progressing.
1. The code that generated `Tutorial1/solutions-01-code.html` is in `src/Tutorial1/Solutions/Code`, and you may need access to it for some tasks. While you are welcome to reuse functions in this directory in other tutorials, my strong advice is to write your own files first, and then amend them after you have seen the solutions, if you find it useful. Remember that there is not a unique way to accomplish a task.

You are welcome to send me pull requests if you correct errors in the tutorial questions or solutions: all sources, including the LaTeX files for the questions are in the `src/` directory, so you can modify them too (you'll be acknowledged or co-author the tutorials).

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
