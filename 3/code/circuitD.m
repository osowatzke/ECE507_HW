inv1 = inverterGate('INV1');
inv2 = inverterGate('INV2');
inv3 = inverterGate('INV3');
or1 = orGate('OR1');
or2 = orGate('OR2');
or3 = orGate('OR3');
nand1 = nandGate('NAND1');
nor1 = norGate('NOR1');

Pa = 0.5;
Pb = 0.5;
Pc = 0.5;

Pinv1 = inv1(Pa);
Pinv2 = inv2(Pb);
Pinv3 = inv3(Pc);
Por1 = or1(Pinv1,Pc);
Por2 = or2(Pinv2,Pa);
Por3 = or3(Pinv3,Pb);
Pnand1 = nand1(Por1,Por2);
Pnor1 = nor1(Pnand1,Por3);