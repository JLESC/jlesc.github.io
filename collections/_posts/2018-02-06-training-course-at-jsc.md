---
layout: post
title: Training course on intra-node performance bottlenecks
date: 2018-02-06
updated: 2018-02-06
author: speck_r
description: 'JSC is welcoming registrations for the training course "[From zero to hero: Understanding and fixing intra-node performance bottlenecks](http://www.fz-juelich.de/SharedDocs/Termine/IAS/JSC/EN/courses/2018/intranode-performance-2018.html)"!'
---


<!--more-->

In the first part of the training course we want to give insights in today's CPU microarchitecture and apply this knowledge in the hands-on session. As a demonstrator we will use a simple Coulomb solver and improve the code step-by-step. We will start from a basic implementation and advance to an optimized version using hardware features like vectorization to increase performance.

The exercises will also contain training on the use of open-source tools to measure and understand the achieved performance. Such optimizations, however, depend heavily on the targeted hardware and should not be part of the algorithmic layer of the code.

In the second part we will present a detailed description of possible abstraction layers to hide such hardware-specifics and therefore maintain readability and maintainability. We will also discuss the overhead costs of our introduced abstraction and show compile-time SIMD configurations and corresponding performance results on different platforms.

This advanced course is free of charge and intended for scientists/developers who want to understand performance-critical hardware features of modern CPUs (like SIMD, ILP, caches, out-of-order execution) and utilize these features in their code. See [here](http://www.fz-juelich.de/SharedDocs/Termine/IAS/JSC/EN/courses/2018/intranode-performance-2018.html) for details.
