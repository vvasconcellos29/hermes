classdef Rfimpairment
% RF Impairments class defines rf impairments type enumerated constants.
%
%   Read-Only Public Properties:
%     NONE - no rf impariments type will be used
%     IQIMBALANCE - IQIMBALANCE will be used
%     NONLINEARITY - NONLINEARITY will be used
%     PHFREQOFFSET - FREQOFFSET will be used
%
%   Author: Erika Portela Lopes de Almeida (EA)
%   Work Address: INDT Bras?lia
%   E-mail: <erika.almeida>@indt.org.br
%   History:
%       v1.0 03 Mar 2015 (EA) - created
%
%   Copyright (c) 2015 INDT - Institute of Technology Development.
%
%   The program may be used and/or copied only with the written
%   permission of INDT, or in accordance with the terms and conditions
%   stipulated in the agreement/contract under which the program has been
%   supplied.
    
    enumeration
     
        NONE, ...
        IQIMBALANCE, ...
        NONLINEARITY, ...
        PHFREQOFFSET;
        
    end
    

    
end

