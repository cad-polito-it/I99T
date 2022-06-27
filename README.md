PoliTo ITC99 (I99T)
===================

[![License: EUPL](https://img.shields.io/badge/license-EUPL-green.svg)](https://www.eupl.eu/1.2/en/)
![RT-Level: VHDL](https://img.shields.io/badge/RT--level-VHDL-8877cc.svg)
![Gate-level: edf](https://img.shields.io/badge/gate--level-edf-8877cc.svg)
![Gate-level: bench](https://img.shields.io/badge/gate--level-bench-8877cc.svg)
![Gate-level: blif](https://img.shields.io/badge/gate--level-blif-8877cc.svg)
![](https://www.google-analytics.com/collect?v=1&t=pageview&tid=UA-28094298-5&cid=4f34399f-f437-4f67-9390-61c649f9b8b2&dl=https%3A%2F%2Fgithub.com%2Fsquillero%2Fitc99-poli%2F)

The [ITC'99 benchmarks](http://www.cerc.utexas.edu/itc99-benchmarks/bench.html) developed in the [CAD Group](http://www.cad.polito.it/) at Politecnico di Torino (**I99T**) are a set of circuits whose characteristics are typical of synthesized circuits. For each bench both the RT-level VHDL description and the synthesized Gate-Level netlist are available. In April 2002 new RT-Level VHDL benchmarks were added to the set and more gate-level circuits were synthesized.

I99T benchmarks are available from [https://github.com/squillero/itc99-poli](https://github.com/squillero/itc99-poli). They are licensed under the [European Union Public License 1.2](https://www.eupl.eu/1.2/en/).

Detailed descriptions of benchmarks and an experimental RT-level ATPG tool can be found in the article "RT-Level ITC 99 Benchmarks and First ATPG Results", *IEEE Design & Test of Computers*, July-August 2000 (DOI: [10.1109/54.867894](http://doi.org/10.1109/54.867894)). In brief, the main characteristics are:

* Fully synthesizable RT-Level VHDL descriptions (in Synopsys Design Compiler description styles).
* No compiler specific directive.
* Require only IEEE standard logic and arithmetic packages.
* Completely synchronous circuits.
* One single-phase clock signal connected directly to memory elements.
* Global reset signal always available.
* No internal memories (except register banks).
* No 3-state busses.
* No or wired connections.

VHDL RT-Level descriptions range from a tiny, monolithic circuit (1 entity, 1 process, 70 lines) to a large, multi-entity, multi-process one (11 entities, 33 processes, 1,424 lines). At the Gate-Level, netlists range from an s27-sized circuit (2 inputs, 29 gates, 4 flip-flops, 150 faults) to a circuit more than 3 times larger that the largest ISCAS'89 (37 inputs, 69,917 gates, 3,320 flip-flops, 429,712 faults). 

VHDL descriptions were synthesized to netlists using both standard options and optimized (`_opt`) options. The former may contains completely useless gates with no inputs and no outputs. Optimized gate-level circuits superseded the *stripped* gate-level circuits of the first release. Most benchmarks are available as combinational circuits (`_C`), where flip-flops have been transformed to input/output pairs. The different releases of the benchmarks are mapped to [GitHub's releases](https://github.com/squillero/itc99-poli/releases).

All benchmarks are syntactically correct, but, due to the development process, there is **no guarantee** that VHDL descriptions are functionally meaningful. However, to help researchers better understand their results, the original functionalities of VHDL descriptions is reported in the following table.

| NAME | ORIGINAL FUNCTIONALITY                         |
|------|------------------------------------------------|
| b01  | FSM that compares serial flows                 |
| b02  | FSM that recognizes BCD numbers                |
| b03  | Resource arbiter                               |
| b04  | Compute min and max                            |
| b05  | Elaborate the contents of a memory             |
| b06  | Interrupt handler                              |
| b07  | Count points on a straight line                |
| b08  | Find inclusions in sequences of numbers        |
| b09  | Serial to serial converter                     |
| b10  | Voting system                                  |
| b11  | Scramble string with variable cipher           |
| b12  | 1-player game (guess a sequence)               |
| b13  | Interface to meteo sensors                     |
| b14  | Viper processor (subset)                       |
| b15  | 80386 processor (subset)                       |
| b16  | Hard to initialize circuit (parametric)        |
| b17  | Three copies of b15                            |
| b18  | Two copies of b14 and two of b17               |
| b19  | Two copies of b14 and two of b17               |
| b20  | A copy of b14 and a modified version of b14    |
| b21  | Two copies of b14                              |
| b22  | A copy of b14 and two modified versions of b14 |

## Available formats

* RT-Level VHDL descriptions (`vhd`)
* Synthesized netlists in EDIF format (`edf`)
* Synthesized netlists in ISCAS'89 format (`bench`)
* Synthesized netlists in BLIF format (`blif`)
* Fault lists (`fau`)

**Notes**: Due to format restrictions, not all circuits are available in all formats; in some circuits there are multiple connections between the same pair of gates; in some circuits there are dandling (unconnected) gates.

## Contact information

[Matteo Sonza Reorda](http://staff.polito.it/matteo.sonzareorda/) <[matteo.sonzareorda@polito.it](mailto:matteo.sonzareorda@polito.it)>

[Giovanni Squillero](http://staff.polito.it/giovanni.squillero/) <[giovanni.squillero@polito.it](mailto:[giovanni.squillero@polito.it])>
