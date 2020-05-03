onbreak resume
onerror resume
vsim -voptargs=+acc work.LOG2_FIXED_POINT_tb

add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/i_CLK
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/i_RSTn
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/i_VALID
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/i_DATA_VALID
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/i_DATA
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/o_VALID
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/o_LOG2_VALID
add wave sim:/LOG2_FIXED_POINT_tb/o_LOG2_VALID_ref
add wave sim:/LOG2_FIXED_POINT_tb/u_LOG2_FIXED_POINT/o_LOG2
add wave sim:/LOG2_FIXED_POINT_tb/o_LOG2_ref
run -all
