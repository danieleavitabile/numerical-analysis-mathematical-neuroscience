
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11124322.svg)](https://doi.org/10.5281/zenodo.11124322)

<img src="https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/assets/brain.png?raw=true">

# Tutorials on numerical analysis for neurobiological networks

These tutorials are written for the masterclass [*Numerical and Analytical Methods for Spatially-Extended Neurobiological Networks*](https://www.uu.nl/en/events/ccss-masterclass-on-numerical-and-analytical-methods-for-spatially-extended-neurobiological-networks?ref=danieleavitabile.com), held at the Centre for Complex Systems Studies, Utrecht University in May 2024.

* [Tutorial 1](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Tutorials/Tutorial1/Questions/tutorial-1.pdf)
* [Tutorial 2](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Tutorials/Tutorial2/Questions/tutorial-2.pdf)

The tutorials are self-contained, but they complemented the following lectures, which may also be of interest (some parts of the lectures were done on the board):
* [Lecture 1](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Lectures/lecture-1.png) [(YouTube)](https://youtu.be/5gzayOeKpmc)
* [Lecture 2](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Lectures/lecture-2.pdf) [(YouTube)](https://youtu.be/l9BpVK_4rqE)
* [Lecture 3](https://github.com/danieleavitabile/numerical-analysis-mathematical-neuroscience/blob/main/Lectures/lecture-3.pdf) [(YouTube)](https://youtu.be/avzZhN0T5R4)
  
## Getting started
1. Download the latest release of the tutorial, under **Releases**, on the right-hand-side of the present webpage, or [here](https://doi.org/10.5281/zenodo.11124322).
1. Download the [accompanying dataset](https://zenodo.org/records/11215758).
1. Click on `Tutorial1` above, which is a link to `Tutorial/Questions/tutorial-1.pdf.
1. Solutions to Tutorial 1 are available in an html file, linked in the tutorial pdf so you can browse at once code and generated graphs.
1. You should be able to progress even if you get stuck on a question: try to get some tips from the html file.
1. Some tasks are longer than others, and involve a substantial amount of coding, which is another reason for providing solutions. Even if you find it too cumbersome to write code for a question, you are expected to have a full grasp of the solutions before moving to the next one.
1. The code that generated `Tutorials/Tutorial1/Solutions/html/driver.html` is in `Tutorials/Tutorial1/Solutions/`. I suggest to write your own code first, and then amend it after you have seen the solutions, if you find it useful. 

I would be pleased to receive pull requests if you correct errors in the tutorial questions or solutions: all sources, including the LaTeX files for the questions are in the `src/` directory, so you can modify them too (your work will be acknowledged explicitly).

I am keen to include Julia and Python versions of the solutions, so do not hesitate to contact me if you want to help.

## Acknowledgements 
I am grateful to Nico C. X. Stuhlmüller for providing feedback to v1.0.0 of the tutorial, and for pointing out to some bugs.

## Citation
Please cite this work using both references below

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
