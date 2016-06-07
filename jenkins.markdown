---
theme:        metropolis
title:        'Jenkins: Continuous Integration and You'
author:       William Osler
date:         \today
logo:         img/logo.pdf
bibliography: references.bib
---

## Overview

- What is Continuous Integration? How can it help us?
- What is Jenkins? How can we use it?
- Continuous Integration Challenges

# Continuous Integration

## What is Integration?

**Integration** is where a developer merges their in-progress code into the
shared code repository, making it officially part of the software product being
developed.

## What is *Continuous* Integration?

> Continuous Integration is a software development practice where members of a
> team integrate their work frequently, usually each person integrates at least
> daily - leading to multiple integrations per day. Each integration is verified
> by an automated build (including test) to detect integration errors as quickly
> as possible.
>
> --- [@Fowler]

## Continuous Integration Requirements

Four things are required for CI to happen:

- A connection to a VCS
    - The target of the integration
- A build script
    - Automated builds
- Some feedback mechanism
    - Developers can see results
- A process for integrating source code changes
    - Source control management

After these 4 requirements are met, you can tack on additional tasks (like
testing). [@Duvall2007, pp. 12]

## What can Continuous Integration Track?

Continuous Integration can monitor all kinds of properties about your
application. You can find out:

- Is everything working together properly?
- What is the code complexity?
- Is the team adhering to coding standards?
- How much code is covered by tests?
- Were the tests successful?
- Does the application have the required performance?

If you can write code that performs an evaluation, you can use CI to always know
how your application measures up at any time. [@Duvall2007, pp. 6]

## Why Continuous Integration?

### Reduce Risks

By detecting errors immediately, mistakes are less likely to propagate into
release. This also allows for monitoring project health over time.

### Reduce Repetitive Processes

We're going to run the same tasks every time, so let the server do the heavy
lifting.

### Enable Project Visibility

You can tell at a glance the current "health" of the project by looking at CI
metrics and trends.

### Establish Product Confidence

Sleep well at night knowing that code in master is not horribly, horribly broken
to the point of not running.

[@Duvall2007, pp. 29]

## Continuous Integration Practices

- Commit frequently
- Don't commit broken code
- Fix broken builds immediately
- Write automated tests
- All tests must pass
- Run private builds first
- Avoid getting broken code

[@Duvall2007, pp. 39]

# Jenkins

## What is Jenkins?

According to the site:

> Jenkins is an open source automation server which enables developers around
> the world to reliably build, test, and deploy their software.

![The Jenkins Logo](./img/logo_title.pdf)

## Jenkins TL;DR

Jenkins will take your code and run an automated set of tasks against it
constantly, publishing results and trends as the project is developed.

## Deploy on Ubuntu

\columnsbegin
\column{.5\textwidth}

Some Options:

1. Deploy the `.war` in your server of choice
    - If you have a `.war` server of choice I'm low key judging you
2. There's a repository for Debian and its derivatives
3. Use the Juju charms

\column{.5\textwidth}

![Ubuntu Logo](./img/ubuntu-logo.pdf)

\columnsend

## Jenkins Concepts

### Projects

A *project* is a set of code backed by a repository that undergoes a build to
produce some result. There are several types of projects, but for Perl we use
the "free-style project" which simply executes a shell script.

### Builds

A project has many *builds*, which are the results of running the build process
on the code at any given time. Builds have a status, such as "success" or
"fail", contain test results, and sometimes produce artifacts.

## Jenkins Concepts --- Building

### Build Triggers

A *build trigger* is some event that causes Jenkins to start a new build. It can
be triggered by a change in VCS, a schedule, or any number of plugin events.

### Post Build Actions

These are the steps that are taken after a build, such as analyzing test
results, publishing generated binaries, or publishing documentation.

### Weather

*Weather* refers to the short term trend of builds in your project. If a project
fails many builds from the previous $n$ attempts, the weather will progress from
"sunny" to "stormy". There are two weather readings: One for build results, and
one for test results.

## Jenkins Concepts --- Nodes

Jenkins has the concept of *master* and *slave* nodes. The master node is the
one that runs the Jenkins interface and schedules builds. It can also schedule
builds on itself. Slave nodes are managed by a master node, and are assigned
build tasks.

## The Jenkins Flow

1. Set up your project in Jenkins by telling Jenkins when to build, how to
   build, and what to do with results
2. Activate a build trigger by pushing to VCS
3. Jenkins runs the build and publishes the result
4. After several builds, check the dashboard to view trends

# CI Implementation Challenges

## CI Implementation Challenges --- Retrofitting

Problem: How do you retrofit CI onto an existing project?

- How do we think of testing?
- What do we consider a "failed build"?
- Are there cases where we're okay with merging failed builds?
- Do we want to monitor master or only pre-master?

## CI Implementation Challenges --- Developer Effort

### Continuous Integration Practices

- Commit frequently
- Don't commit broken code
- Fix broken builds immediately
- Write automated tests
- All tests must pass
- Run private builds first
- Avoid getting broken code

Are we willing to consistently adhere to all of these? If not, why not? Can we
make CI work for us without these things?

## CI Implementation Challenges - Scaling

- How many parallel builds do we plan to run?
- What impact do inter-machine dependencies have on scaling? Isolation?

# Fin

## Citations
<!-- Citations will automatically appear on the last slide -->
