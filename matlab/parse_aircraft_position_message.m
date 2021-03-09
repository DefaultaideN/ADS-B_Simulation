%% 是一个将二进制DATA字段转换为高度，F位，经度和纬度的人类可读表示的函数。

function [position] = parse_aircraft_position_message(line)
    %   海拔高度包含在DATA字段的第1-12位
    %   TODO：暂时忽略Q（“可解码”）位。
    altitude2 = bitor( ...
    bitshift(uint16(bitshift(line(1), -1)), 4), ...
    bitshift(uint16(line(2)), -4));
    position.altitude = altitude2 * 25 - 1000;
    
    %   Bit F is the 14th bit of the DATA field
    position.F = bitand(line(2), 4) > 0;
    
    %   CPR Longitude is represented in the next 17 bits
    cpr_lat_bin = strcat( ...
        dec2bin(bitand(line(2), 3), 2), ...
        dec2bin(line(3), 8), ...
        dec2bin(bitshift(line(4), -1), 7));
    cpr_lat = bin2dec(cpr_lat_bin) / 131072;
    position.cpr_lat = cpr_lat;
    
    %   CPR Latitude is represented in the next 17 bits
    cpr_lon_bin = strcat( ...
        dec2bin(bitand(line(4), 1), 1), ...
        dec2bin(line(5), 8), ...
        dec2bin(line(6), 8));
    cpr_lon = bin2dec(cpr_lon_bin) / 131072;
    position.cpr_lon = cpr_lon;
end
