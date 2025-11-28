v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 -130 -100 40 {lab=#net1}
N -250 70 -140 70 {lab=vin}
N -250 70 -250 150 {lab=vin}
N -60 -160 130 -160 {lab=#net1}
N -100 -60 10 -60 {lab=#net1}
N 10 -160 10 -60 {lab=#net1}
N -100 -260 -100 -190 {lab=VDD}
N -100 -260 170 -260 {lab=VDD}
N 170 -260 170 -190 {lab=VDD}
N 170 -130 170 40 {lab=Vout}
N -100 100 -100 180 {lab=#net2}
N -100 180 170 180 {lab=#net2}
N 170 100 170 180 {lab=#net2}
N 210 70 340 70 {lab=#net3}
N 340 70 340 130 {lab=#net3}
N 170 -70 360 -70 {lab=Vout}
N 40 180 40 260 {lab=#net2}
N -210 280 0 280 {lab=#net4}
N 300 -10 300 20 {lab=GND}
N -370 210 -250 210 {lab=GND}
N -210 340 -210 370 {lab=GND}
N 40 310 40 350 {lab=GND}
N 340 190 340 230 {lab=GND}
N 120 70 170 70 {lab=GND}
N -100 70 -30 70 {lab=GND}
N -160 -160 -100 -160 {lab=VDD}
N 170 -160 260 -160 {lab=VDD}
N 260 -190 260 -160 {lab=VDD}
N 40 280 140 280 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -120 70 0 0 {name=M1
W=10u
L=1u
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -80 -160 0 1 {name=M2
W=20u
L=1u
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 150 -160 0 0 {name=M3
W=20u
L=1u
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 190 70 0 1 {name=M4
W=10u
L=1u
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 20 280 0 0 {name=M5
W=6u
L=2u
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vdd.sym} 30 -260 0 0 {name=l1 lab=VDD}
C {gnd.sym} -370 210 0 0 {name=l2 lab=GND}
C {gnd.sym} 300 20 0 0 {name=l3 lab=GND}
C {capa.sym} 300 -40 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 340 160 0 0 {name=Vp1 value=0.9 savecurrent=false}
C {vsource.sym} -210 310 0 0 {name=Vb value=0.7 savecurrent=false}
C {vsource.sym} -250 180 0 0 {name=Vp value=0.9 savecurrent=false}
C {gnd.sym} -210 370 0 0 {name=l4 lab=GND}
C {gnd.sym} 40 350 0 0 {name=l5 lab=GND}
C {gnd.sym} 340 230 0 0 {name=l6 lab=GND}
C {opin.sym} 360 -70 0 0 {name=p1 lab=Vout}
C {code_shown.sym} -1030 -260 0 0 {name=s1 only_toplevel=false value="
.include /home/shivansh/eda_tools/open_pdks/sources/sky130_fd_pr/models/sky130.lib.spice
 tt

"


}
C {vdd.sym} -160 -160 0 0 {name=l7 lab=VDD}
C {vdd.sym} 260 -190 1 0 {name=l8 lab=VDD}
C {gnd.sym} -30 70 0 0 {name=l9 lab=GND}
C {gnd.sym} 120 70 0 0 {name=l10 lab=GND}
C {gnd.sym} 140 280 0 0 {name=l11 lab=GND}
C {code_shown.sym} -1020 -60 0 0 {name=s2 only_toplevel=false value=".ac dec 100 1 1e9
    .save all

    .control
        run
        setplot ac1
        plot vdb(v(vout)/v(vin))
    .endc"}
C {ipin.sym} -250 120 0 0 {name=p2 lab=vin}
