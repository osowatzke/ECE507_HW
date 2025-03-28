classdef norGate < gate
    methods(Access=protected)
        function Py = stepImpl(self, Pa, Pb)
            A = self.randVar(Pa);
            B = self.randVar(Pb);
            Y = ~(A | B);
            Py = sum(Y)/length(Y);
            self.Pout = Py;
            self.getActivityFactor();
            self.printStats();
        end
    end
end