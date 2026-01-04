# Clifford-Singularity: Black Hole Simulation in Julia

This personal project utilises the Clifford Attractor to visually simulate the dynamics of a supermassive black hole. The primary objective is to demonstrate how high-performance tools like Julia can recreate complex astrophysical phenomena with minimal code.

## Project Visualisation

Below is a real-time recording of the simulation, showcasing the accretion disk dynamics, particle trajectories, and relativistic jets.

| Simulation Demo | Source Code |
| --- | --- |
| [Watch Blackhole.mp4](Blackhole.mp4) | [View CliffordHole.jl](CliffordHole.jl) |


## Features

* Accretion Disk: 7,000 particles orbiting a central singularity using Keplerian-inspired decay.
* Relativistic Jets: High-velocity particle emissions from the poles, rendered in ice-blue.
* Custom Attractor Logic: An adaptation of the Clifford Attractor theorem to model gravitational pull.
* Real-time Rendering: Colour mapping based on particle velocity and proximity to the event horizon.


## Installation and Usage

### 1. Clone the Repository
```bash
git clone https://github.com/ErickQ29/Clifford-Singularity.git
cd Clifford-Singularity
```

### 2. Install Essential Packages

Before running the simulation, you must install the required dependencies. Open the **Julia REPL** (terminal) and execute the following:

```julia
using Pkg
Pkg.add("Plots")
```

### 3. Execution

You can run the project using either of the following methods:

* **Via Code Editor:** Open `CliffordHole.jl` in your preferred editor (such as **VS Code** with the Julia extension), ensure your working directory is set to the project folder, and click **Run**.


## 👨‍🔬 Author's Note

This repository is a result of my lifelong interest in space exploration and computational science. It represents a significant step in my journey to master Julia for scientific research, merging childhood curiosity with professional aspiration.


## 📜 License

This project is licensed under the MIT License - see the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.
