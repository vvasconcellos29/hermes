function out = addrfImpairment( this, in, rfimpairmentType )

%ADDIQIMBALANCE adds iq Imbalance to input vector. 
%   Detailed description can be found in class header.
%
%   Author: Vanessa de Oliveira Vasconcellos (OVV)
%   Work Address: UNB Bras?lia
%   E-mail: <vvasconcellos29>@gmail.com.br
%   History:
%       v1.0 07 Nov 2016 (OVV) - created
%
%   Copyright (c) 2015 INDT - Institute of Technology Development.
%
%   The program may be used and/or copied only with the written
%   permission of INDT, or in accordance with the terms and conditions
%   stipulated in the agreement/contract under which the program has been
%   supplied.

        switch rfimpairmentType
            
            case enum.channel.Rfimpairment.NONE
               
                out = in; 
            
            case enum.channel.Rfimpairment.IQIMBALANCE
               
                A = this.amplitude_Imbalance;
                P = this.phase_Imbalance;
                x = in;
                dc_offset = this.dc_Offset;

            % Apply I/Q amplitude and phase imbalance in to input signal
                gainI = 10.^(0.5*A/20).*exp(-0.5i*P*pi/180);
                gainQ = 10.^(-0.5*A/20).*exp(0.5i*P*pi/180)*1i;
                imbI = bsxfun(@times,real(x),gainI);
                imbQ = bsxfun(@times,imag(x),gainQ);
                out = dc_offset + imbI + imbQ;
                
            case enum.channel.Rfimpairment.NONLINEARITY
                
                amplifier = comm.MemorylessNonlinearity('IIP3', this.non_Linearity); 
                out = amplifier(in);
                
            case enum.channel.Rfimpairment.PHFREQOFFSET
                
                pfo = comm.PhaseFrequencyOffset('PhaseOffset', this.ph_Offset); 
                out = pfo(in);
        
        end 

end

