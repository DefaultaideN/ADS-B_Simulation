
%   main.m

%   Resources used:
%   1.  A Guide on Decoding ADS-B Messages
%       http://adsb-decode-guide.readthedocs.org/en/latest/
%   2.  Decoding ADS-B Position
%       http://www.lll.lu/~edward/edward/adsb/DecodingADSBposition.html
b=('1000110100110101110110000101100010111010111000101011011001011011010101111000000100111101100111111000101000101100');
c=b(find(b>='0'));
A = [];
for i = 1:16:112
    temp = ['0000' dec2hex(bin2dec(c(i:i+15)))];
    A = [A temp(end-3:end)];
end
%A = read_adsb_lines('data.txt');

%   The third line in the file is used as an example in [1], and carries
%   an Aircraft Identification Message.
posA = adsb_line_to_struct(A(:,4));
posB = adsb_line_to_struct(A(:,5));

%   In the tutorial in [1], these are the frames used as an example; also,
%   t0 > t1 is part of the demonstration, so the comparison has been kept.
cpr_to_position( ...
    posA.position.cpr_lon, ...
    posA.position.cpr_lat, ...
    posB.position.cpr_lon, ...
    posB.position.cpr_lat, ...
    1, 0)