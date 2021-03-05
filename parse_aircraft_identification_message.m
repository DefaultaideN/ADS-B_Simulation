
%   parse_aircraft_identification_messsage.m
%   parse_aircraft_identification_message() is a function which parses
%   an Aircraft Identification Message, converting the DATA binary field
%   into a human-readable Callsign representation, returning this callsign.

function [callsign] = parse_aircraft_identification_message(line)
    %   Each letter in the Identification Message is encoded in a 6-bit
    %   group, its value signifying the index in the `alphabet' constant
    %   defined below. To convert from bytes into a human-readable
    %   representation of the callsign, we concatenate the zero-padded
    %   8-bit binary representation of the bytes in the Callsign field,
    %   and then get the indexes of the characters by dividing into
    %   6-character substrings which are then converted into integers.
    data_bin = strcat( ...
        dec2bin(uint8(line(1)), 8), ...
        dec2bin(uint8(line(2)), 8), ...
        dec2bin(uint8(line(3)), 8), ...
        dec2bin(uint8(line(4)), 8), ...
        dec2bin(uint8(line(5)), 8), ...
        dec2bin(uint8(line(6)), 8));
    alphabet = ...
        '#ABCDEFGHIJKLMNOPQRSTUVWXYZ#####_###############0123456789######';

    callsign = strcat( ...
        alphabet(bin2dec(data_bin( 1: 6)) + 1), ...
        alphabet(bin2dec(data_bin( 7:12)) + 1), ...
        alphabet(bin2dec(data_bin(13:18)) + 1), ...
        alphabet(bin2dec(data_bin(19:24)) + 1), ...
        alphabet(bin2dec(data_bin(25:30)) + 1), ...
        alphabet(bin2dec(data_bin(31:36)) + 1), ...
        alphabet(bin2dec(data_bin(37:42)) + 1), ...
        alphabet(bin2dec(data_bin(43:48)) + 1));
    
    %   Remove the `#' and '_' characters from the callsign
    callsign = strrep(callsign, '#', '');
    callsign = strrep(callsign, '_', '');
end