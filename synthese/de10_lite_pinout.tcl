#============================================================
# CLOCK
#============================================================
set_location_assignment PIN_N5  -to adc_clk_10
set_location_assignment PIN_P11 -to max10_clk1_50
set_location_assignment PIN_N14 -to max10_clk2_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to adc_clk_10
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to max10_clk1_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to max10_clk2_50

#============================================================
# LED
#============================================================
set_location_assignment PIN_A8  -to ledr[0]
set_location_assignment PIN_A9  -to ledr[1]
set_location_assignment PIN_A10 -to ledr[2]
set_location_assignment PIN_B10 -to ledr[3]
set_location_assignment PIN_D13 -to ledr[4]
set_location_assignment PIN_C13 -to ledr[5]
set_location_assignment PIN_E14 -to ledr[6]
set_location_assignment PIN_D14 -to ledr[7]
set_location_assignment PIN_A11 -to ledr[8]
set_location_assignment PIN_B11 -to ledr[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ledr[*]

#============================================================
# KEY
#============================================================
set_location_assignment PIN_B8 -to key[0]
set_location_assignment PIN_A7 -to key[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to key[*]

#============================================================
# SW
#============================================================
set_location_assignment PIN_C10 -to sw[0]
set_location_assignment PIN_C11 -to sw[1]
set_location_assignment PIN_D12 -to sw[2]
set_location_assignment PIN_C12 -to sw[3]
set_location_assignment PIN_A12 -to sw[4]
set_location_assignment PIN_B12 -to sw[5]
set_location_assignment PIN_A13 -to sw[6]
set_location_assignment PIN_A14 -to sw[7]
set_location_assignment PIN_B14 -to sw[8]
set_location_assignment PIN_F15 -to sw[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw[*]

#============================================================
# 7 segments
#============================================================
set_location_assignment PIN_C14 -to hex0[0]
set_location_assignment PIN_E15 -to hex0[1]
set_location_assignment PIN_C15 -to hex0[2]
set_location_assignment PIN_C16 -to hex0[3]
set_location_assignment PIN_E16 -to hex0[4]
set_location_assignment PIN_D17 -to hex0[5]
set_location_assignment PIN_C17 -to hex0[6]
set_location_assignment PIN_D15 -to hex0[7]
set_location_assignment PIN_C18 -to hex1[0]
set_location_assignment PIN_D18 -to hex1[1]
set_location_assignment PIN_E18 -to hex1[2]
set_location_assignment PIN_B16 -to hex1[3]
set_location_assignment PIN_A17 -to hex1[4]
set_location_assignment PIN_A18 -to hex1[5]
set_location_assignment PIN_B17 -to hex1[6]
set_location_assignment PIN_A16 -to hex1[7]
set_location_assignment PIN_B20 -to hex2[0]
set_location_assignment PIN_A20 -to hex2[1]
set_location_assignment PIN_B19 -to hex2[2]
set_location_assignment PIN_A21 -to hex2[3]
set_location_assignment PIN_B21 -to hex2[4]
set_location_assignment PIN_C22 -to hex2[5]
set_location_assignment PIN_B22 -to hex2[6]
set_location_assignment PIN_A19 -to hex2[7]
set_location_assignment PIN_F21 -to hex3[0]
set_location_assignment PIN_E22 -to hex3[1]
set_location_assignment PIN_E21 -to hex3[2]
set_location_assignment PIN_C19 -to hex3[3]
set_location_assignment PIN_C20 -to hex3[4]
set_location_assignment PIN_D19 -to hex3[5]
set_location_assignment PIN_E17 -to hex3[6]
set_location_assignment PIN_D22 -to hex3[7]
set_location_assignment PIN_F18 -to hex4[0]
set_location_assignment PIN_E20 -to hex4[1]
set_location_assignment PIN_E19 -to hex4[2]
set_location_assignment PIN_J18 -to hex4[3]
set_location_assignment PIN_H19 -to hex4[4]
set_location_assignment PIN_F19 -to hex4[5]
set_location_assignment PIN_F20 -to hex4[6]
set_location_assignment PIN_F17 -to hex4[7]
set_location_assignment PIN_J20 -to hex5[0]
set_location_assignment PIN_K20 -to hex5[1]
set_location_assignment PIN_L18 -to hex5[2]
set_location_assignment PIN_N18 -to hex5[3]
set_location_assignment PIN_M20 -to hex5[4]
set_location_assignment PIN_N19 -to hex5[5]
set_location_assignment PIN_N20 -to hex5[6]
set_location_assignment PIN_L19 -to hex5[7]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex0[*]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex1[*]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex2[*]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex3[*]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex4[*]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to hex5[*]

#============================================================
# SDRAM
#============================================================
set_location_assignment PIN_U17  -to dram_addr[0]
set_location_assignment PIN_W19  -to dram_addr[1]
set_location_assignment PIN_V18  -to dram_addr[2]
set_location_assignment PIN_U18  -to dram_addr[3]
set_location_assignment PIN_U19  -to dram_addr[4]
set_location_assignment PIN_T18  -to dram_addr[5]
set_location_assignment PIN_T19  -to dram_addr[6]
set_location_assignment PIN_R18  -to dram_addr[7]
set_location_assignment PIN_P18  -to dram_addr[8]
set_location_assignment PIN_P19  -to dram_addr[9]
set_location_assignment PIN_T20  -to dram_addr[10]
set_location_assignment PIN_P20  -to dram_addr[11]
set_location_assignment PIN_R20  -to dram_addr[12]
set_location_assignment PIN_T21  -to dram_ba[0]
set_location_assignment PIN_T22  -to dram_ba[1]
set_location_assignment PIN_N22  -to dram_cke
set_location_assignment PIN_L14  -to dram_clk
set_location_assignment PIN_U20  -to dram_cs_n
set_location_assignment PIN_Y21  -to dram_dq[0]
set_location_assignment PIN_Y20  -to dram_dq[1]
set_location_assignment PIN_AA22 -to dram_dq[2]
set_location_assignment PIN_AA21 -to dram_dq[3]
set_location_assignment PIN_Y22  -to dram_dq[4]
set_location_assignment PIN_W22  -to dram_dq[5]
set_location_assignment PIN_W20  -to dram_dq[6]
set_location_assignment PIN_V21  -to dram_dq[7]
set_location_assignment PIN_P21  -to dram_dq[8]
set_location_assignment PIN_J22  -to dram_dq[9]
set_location_assignment PIN_H21  -to dram_dq[10]
set_location_assignment PIN_H22  -to dram_dq[11]
set_location_assignment PIN_G22  -to dram_dq[12]
set_location_assignment PIN_G20  -to dram_dq[13]
set_location_assignment PIN_G19  -to dram_dq[14]
set_location_assignment PIN_F22  -to dram_dq[15]
set_location_assignment PIN_V22  -to dram_dqm[0]
set_location_assignment PIN_J21  -to dram_dqm[1]
set_location_assignment PIN_U21  -to dram_cas_n
set_location_assignment PIN_U22  -to dram_ras_n
set_location_assignment PIN_V20  -to dram_we_n

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_addr[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_ba[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_ba[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_cke
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_cs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dq[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dqm[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_dqm[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_cas_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_ras_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to dram_we_n

#============================================================
# Accelerometer
#============================================================
set_location_assignment PIN_V11  -to gsensor_sdi
set_location_assignment PIN_V12  -to gsensor_sdo
set_location_assignment PIN_AB16 -to gsensor_cs_n
set_location_assignment PIN_AB15 -to gsensor_sclk
set_location_assignment PIN_Y14  -to gsensor_int1
set_location_assignment PIN_Y13  -to gsensor_int2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gsensor_sdi
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gsensor_sdo
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gsensor_cs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gsensor_sclk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gsensor_int1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gsensor_int2
