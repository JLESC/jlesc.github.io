---
layout: post
title: Automating Analysis and Optimization of Floating-Point for HPC Applications
date: 2026-10-05
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - numerics
  - perf_tools
  - apps
keywords:
  - floating-point
  - mixed precision
  - numerical stability
  - compilers
  - low-precision hardware
head: moses_w
members:
  - domke_j
  - dubey_a
  - hovland_p
  - hueckelheim_j
  - wahib_m
---

## Research topic and goals

When solving problems, domain scientists manipulate high-level mathematical equations atop infinite-precision real numbers.
Computers, in contrast, represent each operation in a finite-precision floating-point value.
This mismatch forces scientists to spend time outside of their field of expertise, considering the impact of rounding errors, number formats, and the availability of high-FLOP instructions (like tensor cores).
While historically many applications have ignored these issues without significant downsides, nearly all applications will need to optimize their numerics in the coming years due to the proliferation of (AI-)accelerators with only low-precision hardware units as the dominant compute paradigm.

In this project, we will build tooling to automatically analyze and optimize the numeric stability and performance within existing applications.
