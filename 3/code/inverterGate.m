classdef inverterGate < gate
    methods(Access=protected)
        function Py = stepImpl(self, Pa)
            A = self.randVar(Pa);
            Y = ~A;
            Py = sum(Y)/length(Y);
            self.Pout = Py;
            self.getActivityFactor();
            self.printStats();
        end
    end
end
    