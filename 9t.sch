v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}

* Completed 9T schematic (cleaned nets, explicit body ties, include & control blocks)

N -400 -300 -400 -200 {lab=VDD}
N 400 300 400 200 {lab=GND}

* --- Power & bias sources ---
C {vdd.sym} -160 -260 0 0 {name=l_vdd lab=VDD}
C {gnd.sym} 160 260 0 0 {name=l_gnd lab=GND}
C {vsource.sym} -250 320 0 0 {name=Vbias value=0.7 savecurrent=false}
C {vsource.sym} 250 320 0 0 {name=Vdd_src value=0.9 savecurrent=false}
C {vsource.sym} 220 -40 0 0 {name=Vin value=0 ac 1 dc 0}

* --- Include sky130 models ---
C {code_shown.sym} -1030 -260 0 0 {name=s_include only_toplevel=false value=".include /home/shivansh/eda_tools/open_pdks/sources/sky130_fd_pr/models/sky130.lib.spice\n"}

* --- Control block: AC analysis ---
C {code_shown.sym} -1020 -60 0 0 {name=s_ctrl only_toplevel=false value=".ac dec 100 1 1e9\n.save all\n.control\n  run\n  setplot ac1\n  plot vdb(v(vout)/v(vin))\n.endc\n"}

* --- Nodes ---
N -120 120 -120 200 {lab=vin}
N 120 -120 120 -200 {lab=vout}
N -120 -200 120 -200 {lab=net_int1}
N -120 40 120 40 {lab=net_tail}
N 0 0 0 80 {lab=Vb}

* --- MOSFETs: names, explicit bulk connections ---
C {sky130_fd_pr/pfet_01v8.sym} -80 40 0 0 {name=M1
W=20u
L=1u
nf=1
mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 80 40 0 1 {name=M2
W=20u
L=1u
nf=1
mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -80 -40 0 0 {name=M3
W=10u
L=1u
nf=1
mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 80 -40 0 1 {name=M4
W=10u
L=1u
nf=1
mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -40 -160 0 0 {name=M5
W=6u
L=2u
nf=1
mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 40 -160 0 0 {name=M6
W=6u
L=2u
nf=1
mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 160 120 0 0 {name=M7
W=8u
L=1u
nf=1
mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -160 120 0 0 {name=M8
W=8u
L=1u
nf=1
mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 0 200 0 0 {name=M9
W=6u
L=2u
nf=1
mult=1
model=nfet_01v8
spiceprefix=X
}

* --- Pin wiring: map gates/drains/sources/bulk to named nets ---
* Note: Xschem symbol pin order is D G S B. The connections below use explicit net labels.
N -80 80 -80 40 {lab=net_tail}   ; M1 drain -> net_tail
N -80 0 -80 -40 {lab=Vb}         ; M1 gate  -> Vb (example internal bias)
N -80 -80 -80 -120 {lab=VDD}      ; M1 source -> VDD (pfet source to VDD)
N -80 -120 -80 -160 {lab=VDD}     ; M1 bulk -> VDD

N 80 80 80 40 {lab=vout}          ; M2 drain -> vout
N 80 0 80 -40 {lab=net_tail}      ; M2 gate  -> net_tail
N 80 -80 80 -120 {lab=VDD}        ; M2 source -> VDD
N 80 -120 80 -160 {lab=VDD}       ; M2 bulk -> VDD

N -80 -40 -80 -80 {lab=vin}       ; M3 gate -> vin
N -80 -80 -80 -120 {lab=net_int1} ; M3 drain -> net_int1
N -80 -120 -80 -160 {lab=GND}     ; M3 source -> GND
N -80 -160 -80 -200 {lab=GND}     ; M3 bulk -> GND

N 80 -40 80 -80 {lab=net_int1}   ; M4 drain -> net_int1
N 80 0 80 -40 {lab=net_tail}      ; M4 gate  -> net_tail
N 80 -120 80 -160 {lab=GND}       ; M4 source -> GND
N 80 -160 80 -200 {lab=GND}       ; M4 bulk -> GND

N -40 -160 -40 -120 {lab=net_tail} ; M5 drain-> net_tail
N -40 -120 -40 -80 {lab=GND}       ; M5 source-> GND
N -40 -80 -40 -40 {lab=vin}        ; M5 gate -> vin
N -40 -40 -40 0 {lab=GND}          ; M5 bulk -> GND

N 40 -160 40 -120 {lab=net_tail}  ; M6 drain-> net_tail
N 40 -120 40 -80 {lab=Vb}         ; M6 gate -> Vb
N 40 -80 40 -40 {lab=VDD}         ; M6 source-> VDD
N 40 -40 40 0 {lab=VDD}           ; M6 bulk -> VDD

N 160 120 160 80 {lab=vout}       ; M7 drain -> vout
N 160 80 160 40 {lab=net_int1}    ; M7 gate  -> net_int1
N 160 40 160 0 {lab=GND}          ; M7 source -> GND
N 160 0 160 -40 {lab=GND}         ; M7 bulk -> GND

N -160 120 -160 80 {lab=net_tail} ; M8 drain -> net_tail
N -160 80 -160 40 {lab=Vb}        ; M8 gate -> Vb
N -160 40 -160 0 {lab=VDD}        ; M8 source -> VDD
N -160 0 -160 -40 {lab=VDD}       ; M8 bulk -> VDD

N 0 240 0 200 {lab=GND}           ; M9 source -> GND
N 0 200 0 160 {lab=net_tail}      ; M9 drain  -> net_tail
N 0 160 0 120 {lab=Vb}            ; M9 gate   -> Vb
N 0 120 0 80 {lab=GND}            ; M9 bulk   -> GND

* --- Output capacitor & probe ---
C {capa.sym} 200 40 0 0 {name=Cout value=1p footprint=1206 device="ceramic capacitor"}
C {opin.sym} 260 40 0 0 {name=probe_vout lab=vout}

* --- Ground references ---
C {gnd.sym} 180 260 0 0 {name=gnd1 lab=GND}
C {gnd.sym} -180 260 0 0 {name=gnd2 lab=GND}

* --- End schematic ---


