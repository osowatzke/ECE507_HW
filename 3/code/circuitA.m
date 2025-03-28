inv1 = inverterGate('INV1');
inv2 = inverterGate('INV2');
and1 = andGate('AND1');
and2 = andGate('AND2');
or1 = orGate('OR1');

Pa = 0.5;
Pb = 0.5;
Pc = 0.5;

Pinv1 = inv1(Pa);
Pinv2 = inv2(Pb);
Pand1 = and1(Pinv1, Pinv2);
Pand2 = and2(Pinv2, Pc);
Por1 = or1(Pand1, Pand2);