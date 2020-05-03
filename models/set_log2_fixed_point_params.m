log2_fixed_point.in_word_width = 11;      % default 16
log2_fixed_point.in_fraction_width = 10;   % default 7

log2_fixed_point.in_word_width_max = 128;

log2_fixed_point.out_word_width = 11;     % default 19
log2_fixed_point.out_fraction_width = 10; % default 10

log2_fixed_point.log2_table_size = 32;    % default 32

B = ceil(log2(log2_fixed_point.log2_table_size))+1;

log2_fixed_point.log2_table = log2((2^(B-1) : (2^(B) - 1)) / 2^(B - 1));
log2_fixed_point.log2_table = fi(log2_fixed_point.log2_table, 0, log2_fixed_point.out_fraction_width, log2_fixed_point.out_fraction_width);

clear B;

log2_fixed_point.tolerance = 0.15;