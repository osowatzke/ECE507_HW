classdef gate < matlab.System
    properties (Constant)
        N = 1e8;
    end
    properties
        name;
        Pout;
        alpha;
    end
    methods
        function self = gate(name)
            self.name = name;
        end
    end
    methods (Access=protected)
        function getActivityFactor(self)
            self.alpha = (1 - self.Pout)*self.Pout;
        end
        function printStats(self)
            fprintf('Pout(%s) = %.4f\n', self.name, self.Pout);
            fprintf('alpha(%s) = %.4f\n', self.name, self.alpha);
        end
        function y = randVar(self, Pa)
            y = (rand(self.N,1) < Pa);
        end
    end
end