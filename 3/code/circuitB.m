and1 = andGate('AND1');
or1 = orGate('OR1');
and2 = andGate('AND2');
and3 = andGate('AND3');
or2 = orGate('OR2');

Pa = 0.5;
Pb = 0.5;
Pc = 0.5;

Pand1 = and1(Pa, Pb);
Por1 = or1(Pb, Pc);
Pand2 = and2(Pb, Pc);
Pand3 = and3(Por1, Pand2);
Por2 = or2(Pand1, Pand3);