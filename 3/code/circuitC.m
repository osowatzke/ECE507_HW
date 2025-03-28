inv1 = inverterGate('INV1');
inv2 = inverterGate('INV2');
inv3 = inverterGate('INV3');
nor1 = norGate('NOR1');
nand1 = nandGate('NAND1');
and1 = andGate('AND1');
and2 = andGate('AND2');
nor2 = norGate('NOR2');

Pa = 0.5;
Pb = 0.5;
Pc = 0.5;

Pinv1 = inv1(Pa);
Pinv2 = inv2(Pb);
Pinv3 = inv3(Pc);
Pnor1 = nor1(Pa,Pinv2);
Pnand1 = nand1(Pb,Pinv3);
Pand1 = and1(Pnor1,Pc);
Pand2 = and2(Pinv1,Pnand1);
Pnor2 = nor2(Pand1, Pand2);