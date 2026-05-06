# symplectic-optics-toolkit
MATLAB toolkit for symbolic thin-lens decompositions and verification of 4×4 symplectic optical systems.

# Symplectic Optical Systems via Thin-Lens Decompositions

MATLAB implementations accompanying my research on the symbolic decomposition of $4\times 4$ symplectic transfer matrices using thin lenses and free-space propagation operators. Refer to this [JOSA A paper](https://doi.org/10.1364/JOSAA.404552) for further details.

This repository focuses on a small set of fundamental optical identities from which several physically relevant optical transforms can be derived through suitable parameter choices.

The project combines:

* symbolic matrix optics,
* symplectic transfer matrices,
* structured thin-lens decompositions,
* and exact symbolic verification using MATLAB.

---

# Overview

The repository is organized around four fundamental symplectic identities developed in my research work.

These identities provide constructive decompositions of structured $4\times4$ symplectic matrices using:

* x-cylindrical thin lenses,
* y-cylindrical thin lenses,
* and free-space propagation sections.

Many optical systems and transforms can then be realized as special cases obtained through parameter substitution.

Examples include:

* partial Fourier transforms,
* inverse partial Fourier transforms,
* image reflectors,
* differential magnifiers,
* and related structured optical systems.

---

# Mathematical Background

The optical systems are modeled using paraxial ray-transfer matrices acting on transverse phase-space coordinates:

$[
(x,p_x,y,p_y)
]$

The basic optical elements used throughout the repository are:

## Free-space propagation

$$P(d)=
\begin{bmatrix}
1 & d & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & d \\
0 & 0 & 0 & 1
\end{bmatrix}$$

## X-cylindrical thin lens

$$L_x(f)=
\begin{bmatrix}
1 & 0 & 0 & 0 \\
-\frac{1}{f} & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}$$

## Y-cylindrical thin lens

$$L_y(f)=
\begin{bmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & -\frac{1}{f} & 1
\end{bmatrix}$$

---

# Repository Structure

```text
core/
    Lenx.m
    Leny.m
    Prop.m
    Mult.m

fundamental_identities/
    Eq29.m (Identity 1)
    Eq31.m (Identity 2)
    Eq33.m (Identity 3)
    Eq36.m (Identity 4)

applications/
    ParFourier.m (Partial Fourier transform)
    InvParFourier.m (Inverse partial Fourier transform)
    ImageRefl.m (Image reflector)
    DiffMag.m (Differential magnifier)
```

---

# Core Philosophy

The repository is intentionally organized around a small number of general symbolic identities rather than many isolated examples.

The goal is to demonstrate that:

* several optical transforms,
* structured imaging systems,
* and symplectic transfer matrices

can be generated systematically from a compact set of constructive decompositions.

The applications included in the repository are therefore presented as parameterized realizations of the fundamental identities.

---

# Example Usage

```matlab
clear
clc

syms a1 b1 d1 a2 b2 d2;

c1 = (a1*d1 - 1)/b1;
c2 = (a2*d2 - 1)/b2;

T = sym(eye(4));

T = Mult(T, Lenx(-b1/(1+d1-b1)));
T = Mult(T, Leny(-b2/(1+d2-b2)));
T = Mult(T, Prop(1));

T = simplify(T);

disp(T);
```

---

# Requirements

* MATLAB
* Symbolic Math Toolbox

The programs were developed using symbolic matrix algebra in MATLAB.

---

# Research Context

This repository is based on my research work in:

* symplectic optics,
* paraxial optical systems,
* thin-lens decompositions,
* and structured canonical transformations.

The emphasis is on exact symbolic verification and constructive optical realizations.

---

# License

MIT License
