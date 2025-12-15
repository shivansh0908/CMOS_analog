v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}

*========================
* POWER & GROUND
*========================
C {vdd.sym} 0 -260 0 0 {name=l1 lab=VDD}
C {gnd.sym} 0 360 0 0 {name=l2 lab=GND}

*========================
* DIFFERENTIAL PAIR (NMOS)
*========================
C {sky130_fd_pr/nfet_01v8.sym} -120 40 0 0 {name=M1 W=10u L=1u model=nfet_01v8 spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym}  120 40 0 0 {name=M2 W=10u L=1u model=nfet_01v8 spiceprefix=X}

* Tail current source
C {sky130_fd_pr/nfet_01v8.sym} 0 140 0 0 {name=M3 W=6u L=2u model=nfet_01v8 spiceprefix=X}

*========================
* PMOS CURRENT MIRROR LOAD
*========================
C {sky130_fd_pr/pfet_01v8.sym} -120 -100 0 1 {name=M4 W=20u L=1u model=pfet_01v8 spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym}  120 -100 0 1 {name=M5 W=20u L=1u model=pfet_01v8 spiceprefix=X}

*========================
* SECOND STAGE (GAIN)
*========================
C {sky130_fd_pr/nfet_01v8.sym} 0 220 0 0 {name=M6 W=12u L=1u model=nfet_01v8 spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 0 -180 0 1 {name=M7 W=24u L=1u model=pfet_01v8 spiceprefix=X}

*========================
* BIAS NETWORK (MIRRORS)
*========================
C {sky130_fd_pr/nfet_01v8.sym} -260 220 0 0 {name=M8 W=6u L=2u model=nfet_01v8 spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} -260 140 0 0 {name=M9 W=6u L=2u model=nfet_01v8 spiceprefix=X}

C {sky130_fd_pr/pfet_01v8.sym} 260 -180 0 1 {name=M10 W=24u L=1u model=pfet_01v8 spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 260 -100 0 1 {name=M11 W=24u L=1u model=pfet_01v8 spiceprefix=X}

*========================
* CONNECTIONS
*========================
N -120 40 -120 -60 {lab=vd1}
N 120 40 120 -60 {lab=vd2}
N -120 -60 120 -60 {lab=vdiff}

N -120 -100 -120 -60 {lab=vd1}
N 120 -100 120 -60 {lab=vd2}

N -120 -140 120 -140 {lab=VDD}
N -120 -140 -120 -100 {lab=VDD}
N 120 -140 120 -100 {lab=VDD}

N -120 80 120 80 {lab=vtail}
N 0 140 0 80 {lab=vtail}

N 0 180 0 140 {lab=vtail}

N 0 220 0 260 {lab=GND}

N 0 -220 0 -180 {lab=VDD}

N 0 40 0 180 {lab=vdiff}

N 0 -140 0 -100 {lab=vout}

*========================
* OUTPUT & COMPENSATION
*========================
C {capa.sym} 120 -140 0 0 {name=Cc value=1p}
N 120 -140 0 -140 {lab=vout}

C {opin.sym} 0 -140 0 0 {name=p1 lab=vout}

*========================
* INPUTS
*========================
C {ipin.sym} -120 0 0 0 {name=p2 lab=vinp}
C {ipin.sym}  120 0 0 0 {name=p3 lab=vinn}

*========================
* BIAS SOURCES
*========================
C {vsource.sym} -260 260 0 0 {name=Vb1 value=0.7}
C {vsource.sym} 260 -60 0 0 {name=Vb2 value=0.7}

N -260 260 -260 220 {lab=Vb1}
N 260 -60 260 -100 {lab=Vb2}

C {gnd.sym} -260 300 0 0 {}
C {gnd.sym} 260 0 0 0 {}

*========================
* SUPPLY
*========================
C {vsource.sym} 0 -300 0 0 {name=VDDsrc value=0.9}
N 0 -300 0 -260 {lab=VDD}

*========================
* SIMULATION
*========================
C {code_shown.sym} -900 -200 0 0 {name=s1 value="
.include /home/shivansh/eda_tools/open_pdks/sources/sky130_fd_pr/models/sky130.lib.spice
tt
.ac dec 100 1 1e9
.save all
.control
run
plot vdb(v(vout)/(v(vinp)-v(vinn)))
.endc
"}
