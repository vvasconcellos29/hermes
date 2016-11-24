classdef rfImpairment < handle
    
%   This class defines objects that will add iq imbalance to a
%   given multidimensional input signal.
%
%   Read-Only Public Properties:
%       phase_imbalance - <1 x 1 double> phase distortion in degrees
%             
%       amplitude_imbalance - <1 x 1 double> (dB) amplitude imabalance
%                            If < 0, causes vertical stretching of the 
%                            constellation
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

    
    properties ( GetAccess = 'public', SetAccess = 'protected' )
        
        phase_Imbalance = 0;          % IQ Phase Imbalance in degrees
        amplitude_Imbalance = 1;      % IQ Amplitude Imbalance in dB
        dc_Offset = 0;                % DC offset for IQ Imbalance
        freq_Offset = 0;              % Freq Offset in Hz  
        ph_Offset = 0;               % Freq Offset in Degrees
        non_Linearity = 0;            % Non-linearity Amplitude in dBm
        rfimpairmentType = enum.channel.Rfimpairment.NONE; 
        
        
    end

    
    methods
        
        function this = rfImpairment( ... 
                            phase_imbalance, ...
                            amplitude_imbalance, ...
                            dc_offset, ...
                            freq_offset, ...
                            ph_offset,...
                            non_linearity)
            
            if exist( 'phase_imbalance', 'var' ) && ~isempty(phase_imbalance)
                this.phase_Imbalance = phase_imbalance;
            else
                this.phase_Imbalance = 0;
            end           

            if exist( 'amplitude_imbalance', 'var' ) && ~isempty(amplitude_imbalance)
                this.amplitude_Imbalance = phase_imbalance;
            else
                this.amplitude_Imbalance = 0;
            end                        

            if exist( 'dc_offset', 'var' ) && ~isempty(dc_offset)
                this.dc_Offset = dc_offset;
            else
                this.dc_Offset = 0;
            end
            
            if exist( 'freq_offset', 'var' ) && ~isempty(freq_offset)
                this.freq_Offset = freq_offset;
            else
                this.freq_Offset = 0;
            end
            
            if exist( 'ph_offset', 'var' ) && ~isempty(ph_offset)
                this.ph_Offset = ph_offset;
            else
                this.ph_Offset = 0;
            end
            
            if exist( 'non_linearity', 'var' ) && ~isempty(non_linearity)
                this.non_Linearity = non_linearity;
            else
                this.non_Linearity = 0;
            end            
        end
    
        out = addrfImpairment(this,in, rfimpairmentType); 
        
    end
end
