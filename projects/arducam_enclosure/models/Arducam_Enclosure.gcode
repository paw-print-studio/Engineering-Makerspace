; HEADER_BLOCK_START
; BambuStudio 02.01.01.52
; model printing time: 16m 57s; total estimated time: 23m 16s
; total layer number: 41
; total filament length [mm] : 1664.14
; total filament volume [cm^3] : 4002.72
; total filament weight [g] : 5.08
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 8.20
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 3
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = enable_support;eng_plate_temp;eng_plate_temp_initial_layer;filament_max_volumetric_speed;hot_plate_temp;hot_plate_temp_initial_layer;nozzle_temperature_initial_layer;nozzle_temperature_range_high;nozzle_temperature_range_low;supertack_plate_temp;supertack_plate_temp_initial_layer;textured_plate_temp;textured_plate_temp_initial_layer;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 1
; enforce_support_layers = 0
; eng_plate_temp = 80
; eng_plate_temp_initial_layer = 80
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 30
; fan_max_speed = 90
; fan_min_speed = 40
; filament_adhesiveness_category = 300
; filament_change_length = 10
; filament_colour = #00AE42
; filament_cost = 30
; filament_density = 1.27
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.95
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG99
; filament_is_support = 0
; filament_map = 1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 8
; filament_minimal_purge_on_wipe_tower = 15
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 45
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_volumetric_speed = -1
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PETG"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PETG
; filament_vendor = Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 80
; hot_plate_temp_initial_layer = 80
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: P1S ========================\n;===== date: 20231107 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.2
; nozzle_temperature = 255
; nozzle_temperature_initial_layer = 260
; nozzle_temperature_range_high = 250
; nozzle_temperature_range_low = 230
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 90
; overhang_fan_threshold = 10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_steps = 10
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 12
; slow_down_min_speed = 20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 80
; supertack_plate_temp_initial_layer = 80
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 80
; textured_plate_temp_initial_layer = 80
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 220.343
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R23
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S ========================
;===== date: 20231107 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S80 ;set bed temp
M190 S80 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S260 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S260
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F199.559 T250


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P2 R22
G1 E50 F200
M400
M104 S260
G92 E0
M73 P21 R18
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S240 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P22 R18
G1 E-0.5 F300

M73 P23 R17
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S240
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
M73 P24 R17
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X92.5857 Y106.412 I70.8834 J40.7346
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S260 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S260
G1 Z0.2
G0 E2 F300
G0 X240 E15 F3200
G0 Y11 E0.700 F800
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F3200
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/41
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X161.336 Y104.736
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X162.234 Y105.225 E.03692
G1 X162.847 Y106.043 E.03692
G1 X163.064 Y107.037 E.03675
G3 X162.762 Y108.154 I-3.612 J-.376 E.04194
G1 X162.939 Y108.965 E.02997
M73 P25 R17
G3 X162.685 Y110.117 I-37.946 J-7.774 E.0426
G1 X162.844 Y110.33 E.00959
G1 X163.061 Y111.324 E.03675
G3 X162.839 Y112.335 I-33.274 J-6.781 E.03738
G1 X162.231 Y113.146 E.03659
G1 X161.953 Y113.297 E.0114
G1 X162.658 Y114.237 E.04241
G1 X162.875 Y115.231 E.03675
G1 X162.768 Y115.734 E.01855
G1 X162.997 Y116.039 E.01377
G1 X163.213 Y117.034 E.03675
G3 X162.934 Y118.122 I-4.279 J-.521 E.04068
G1 X163.105 Y118.91 E.02914
G3 X162.883 Y119.922 I-33.289 J-6.784 E.03738
G1 X162.275 Y120.732 E.03659
M73 P26 R17
G1 X161.377 Y121.221 E.03692
G1 X160.357 Y121.292 E.03691
G1 X159.4 Y120.932 E.0369
G1 X159.192 Y120.722 E.0107
G1 X158.275 Y121.221 E.03769
G1 X157.255 Y121.292 E.03691
G1 X156.298 Y120.932 E.0369
G1 X155.872 Y120.504 E.02182
G1 X155.003 Y121.276 E.04198
G3 X153.104 Y121.191 I-.317 J-14.099 E.06872
G1 X152.444 Y120.724 E.02915
G3 X150.039 Y121.054 I-1.59 J-2.656 E.09007
G1 X149.548 Y120.785 E.02023
G1 X148.83 Y121.175 E.0295
G1 X147.811 Y121.246 E.03691
G1 X146.854 Y120.887 E.0369
G1 X146.677 Y120.708 E.00908
G1 X145.734 Y121.221 E.03873
G1 X144.714 Y121.292 E.03691
G1 X144.078 Y121.053 E.02455
G1 X143.889 Y121.156 E.00777
G1 X142.869 Y121.226 E.03691
G1 X141.912 Y120.867 E.0369
G1 X141.753 Y120.706 E.00818
M73 P27 R16
G1 X140.806 Y121.221 E.03889
G1 X139.787 Y121.292 E.03691
G1 X139.112 Y121.038 E.02602
G1 X138.964 Y121.119 E.00607
G1 X137.944 Y121.19 E.03691
G1 X136.988 Y120.83 E.0369
G1 X136.861 Y120.703 E.00649
G1 X135.908 Y121.221 E.03916
G1 X134.888 Y121.292 E.03691
G1 X134.141 Y121.011 E.02884
G1 X133.055 Y121.118 E.03941
G1 X131.996 Y120.72 E.04085
G1 X131.075 Y121.221 E.03786
G1 X130.055 Y121.292 E.03691
G1 X129.031 Y120.907 E.03951
G1 X128.25 Y120.961 E.02825
G1 X127.433 Y120.654 E.03153
G1 X126.391 Y121.221 E.04284
G1 X125.371 Y121.292 E.03691
G1 X124.414 Y120.932 E.0369
G1 X124.123 Y120.639 E.01492
G1 X123.053 Y121.221 E.04395
G1 X122.034 Y121.292 E.03691
G1 X121.507 Y121.094 E.02031
G1 X121.273 Y121.221 E.0096
G1 X120.254 Y121.292 E.03691
G1 X119.297 Y120.932 E.0369
G1 X119.114 Y120.748 E.00938
G1 X118.497 Y120.791 E.02231
G1 X117.64 Y120.469 E.03307
G1 X117.469 Y120.697 E.01031
G1 X116.571 Y121.186 E.03692
G1 X115.551 Y121.257 E.03691
G1 X114.594 Y120.897 E.0369
G1 X114.419 Y120.72 E.00899
G1 X113.499 Y121.221 E.03781
G1 X112.479 Y121.292 E.03691
G1 X111.803 Y121.038 E.02605
G1 X111.702 Y121.093 E.00419
G1 X110.682 Y121.164 E.03691
G1 X109.725 Y120.805 E.0369
G1 X109.629 Y120.708 E.00494
G1 X108.685 Y121.221 E.03879
G1 X107.665 Y121.292 E.03691
G1 X106.713 Y120.934 E.03673
G1 X105.894 Y120.991 E.02966
G1 X105.053 Y120.675 E.03241
G1 X104.05 Y121.221 E.04124
G1 X103.03 Y121.292 E.03691
G1 X102.074 Y120.932 E.0369
G1 X101.775 Y120.632 E.01528
G1 X100.693 Y121.221 E.04449
G1 X99.673 Y121.292 E.03691
G1 X99.146 Y121.094 E.02031
G1 X98.913 Y121.221 E.0096
G1 X97.893 Y121.292 E.03691
G1 X96.936 Y120.932 E.0369
G1 X96.749 Y120.744 E.0096
G1 X96.178 Y120.783 E.02065
G1 X95.222 Y120.424 E.0369
G1 X94.501 Y119.699 E.03689
G1 X94.363 Y119.323 E.01448
G1 X93.886 Y119.143 E.0184
G1 X93.165 Y118.419 E.03689
G1 X92.836 Y117.525 E.0344
G1 X92.836 Y116.728 E.02878
G1 X93.165 Y115.834 E.0344
G1 X93.67 Y115.326 E.02584
G1 X93.173 Y114.826 E.02547
G1 X92.843 Y113.932 E.0344
G1 X92.843 Y113.135 E.02878
G1 X93.173 Y112.241 E.0344
G1 X93.893 Y111.516 E.03689
G1 X94.251 Y111.382 E.0138
G1 X93.575 Y110.702 E.03459
G1 X93.246 Y109.808 E.0344
G1 X93.246 Y109.011 E.02879
G1 X93.435 Y108.497 E.01977
G1 X93.273 Y108.335 E.00828
G1 X92.944 Y107.441 E.0344
G1 X92.944 Y106.643 E.02878
G1 X93.273 Y105.749 E.0344
G1 X93.994 Y105.025 E.03689
G1 X94.95 Y104.665 E.0369
G1 X95.97 Y104.736 E.03691
G1 X96.868 Y105.225 E.03692
G1 X97.482 Y106.043 E.03692
G1 X97.532 Y106.273 E.00852
G1 X97.986 Y106.305 E.01644
G1 X98.055 Y106.117 E.00722
G1 X98.776 Y105.393 E.03689
G1 X99.732 Y105.033 E.0369
G1 X100.752 Y105.104 E.03691
G1 X101.65 Y105.593 E.03692
G1 X101.929 Y105.964 E.01676
G1 X102.493 Y105.396 E.0289
G1 X103.45 Y105.037 E.0369
G1 X104.47 Y105.108 E.03691
G1 X105.33 Y105.576 E.03536
G1 X106.234 Y105.355 E.03359
G1 X106.738 Y105.365 E.01822
G1 X107.077 Y105.025 E.01734
G1 X108.034 Y104.665 E.0369
G1 X109.053 Y104.736 E.03691
G1 X109.98 Y105.24 E.03809
G1 X110.194 Y105.025 E.01097
G1 X111.151 Y104.665 E.0369
G1 X112.171 Y104.736 E.03691
G1 X112.768 Y105.061 E.02457
G1 X113.698 Y104.712 E.03585
G1 X114.718 Y104.783 E.03691
G1 X115.616 Y105.271 E.03692
G2 X116.005 Y105.466 I.259 J-.032 E.01857
G1 X116.11 Y105.489 E.0039
G1 X116.572 Y105.025 E.02364
G1 X117.528 Y104.665 E.0369
G1 X118.548 Y104.736 E.03691
G1 X119.502 Y105.299 E.04
G1 X120.317 Y105.356 E.02948
G1 X120.55 Y105.483 E.0096
G3 X121.594 Y105.321 I.699 J1.06 E.03934
G1 X121.889 Y105.025 E.01508
G1 X122.845 Y104.665 E.0369
G1 X123.865 Y104.736 E.03691
G1 X124.345 Y104.997 E.01972
G1 X124.715 Y104.858 E.01427
G1 X125.735 Y104.929 E.03691
G1 X126.432 Y105.308 E.02867
G1 X127.514 Y105.356 E.03911
G1 X127.748 Y105.483 E.0096
G3 X128.792 Y105.321 I.699 J1.06 E.03934
G1 X129.086 Y105.025 E.01508
G1 X130.043 Y104.665 E.0369
G1 X131.063 Y104.736 E.03691
G1 X131.847 Y105.163 E.03224
G1 X132.872 Y105.234 E.03708
G1 X133.262 Y105.447 E.01605
G1 X133.692 Y105.285 E.01658
G1 X134.712 Y105.356 E.03691
G1 X134.986 Y105.505 E.01128
G3 X136.089 Y105.321 I.753 J1.114 E.04165
G1 X136.384 Y105.025 E.01508
G1 X137.341 Y104.665 E.0369
G1 X138.36 Y104.736 E.03691
G1 X139.314 Y105.299 E.04
G1 X140.129 Y105.356 E.02948
G1 X140.362 Y105.483 E.0096
G3 X141.406 Y105.321 I.699 J1.06 E.03934
G1 X141.701 Y105.025 E.01508
G1 X142.658 Y104.665 E.0369
G1 X143.677 Y104.736 E.03691
G1 X144.197 Y105.019 E.02135
G1 X144.523 Y104.896 E.01256
G1 X145.542 Y104.967 E.03691
G1 X146.203 Y105.326 E.02714
G1 X146.313 Y105.285 E.00425
G1 X147.333 Y105.356 E.03691
G1 X147.607 Y105.505 E.01128
G3 X148.71 Y105.321 I.753 J1.114 E.04165
G1 X149.005 Y105.025 E.01508
G1 X149.961 Y104.665 E.0369
G1 X150.981 Y104.736 E.03691
G1 X151.672 Y105.112 E.02839
G1 X151.796 Y105.065 E.00478
G1 X152.816 Y105.136 E.03691
G1 X153.714 Y105.625 E.03692
G1 X153.958 Y105.951 E.01473
G1 X155.036 Y105.546 E.04156
G1 X156.056 Y105.617 E.03691
G1 X156.876 Y106.064 E.03373
G3 X159.255 Y105.129 I2.012 J1.626 E.09653
G1 X159.359 Y105.025 E.00531
G1 X160.316 Y104.665 E.0369
G1 X161.267 Y104.731 E.03444
; WIPE_START
G1 X162.234 Y105.225 E-.41238
G1 X162.782 Y105.957 E-.34762
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X155.179 Y106.619 Z.6 F30000
G1 X123.865 Y109.348 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X123.926 Y109.315 E.00248
G1 X124.715 Y109.612 E.03044
G1 X125.422 Y109.563 E.02559
G1 X125.538 Y109.679 E.00593
G1 X126.495 Y110.039 E.0369
G1 X127.514 Y109.968 E.03691
G1 X127.748 Y109.841 E.0096
G1 X128.274 Y110.039 E.02031
G1 X129.294 Y109.968 E.03691
G1 X130.248 Y109.405 E.04
G1 X130.711 Y109.372 E.01676
G1 X130.895 Y109.557 E.00942
G1 X131.852 Y109.917 E.0369
G1 X132.872 Y109.846 E.03691
G1 X132.997 Y109.778 E.00517
G1 X133.692 Y110.039 E.0268
G1 X134.712 Y109.968 E.03691
G1 X134.986 Y109.819 E.01128
G1 X135.572 Y110.039 E.0226
G1 X136.592 Y109.968 E.03691
G1 X137.546 Y109.405 E.04
G1 X137.858 Y109.383 E.01129
G1 X138.152 Y109.679 E.01508
G1 X139.109 Y110.039 E.0369
G1 X140.129 Y109.968 E.03691
G1 X140.362 Y109.841 E.0096
G1 X140.889 Y110.039 E.02031
G1 X141.909 Y109.968 E.03691
G1 X142.863 Y109.405 E.04
G1 X143.712 Y109.346 E.03075
G1 X144.522 Y109.65 E.03125
G1 X145.275 Y109.598 E.02724
G1 X145.356 Y109.679 E.00415
G1 X146.313 Y110.039 E.0369
G1 X147.333 Y109.968 E.03691
G1 X147.607 Y109.819 E.01128
G1 X148.193 Y110.039 E.0226
G1 X149.213 Y109.968 E.03691
G1 X150.167 Y109.405 E.04
G1 X150.745 Y109.364 E.02092
G1 X150.839 Y109.459 E.00483
G1 X151.531 Y109.72 E.0267
G1 X151.798 Y109.988 E.01366
G1 X151.798 Y110.793 E.02908
G1 X152.127 Y111.687 E.0344
G1 X152.303 Y111.864 E.009
G2 X151.595 Y113.07 I1.906 J1.931 E.05109
G1 X151.609 Y113.625 E.02004
G1 X151.168 Y114.069 E.02257
G1 X150.839 Y114.962 E.0344
G1 X150.839 Y115.606 E.02323
G1 X150.165 Y115.239 E.0277
G1 X149.145 Y115.168 E.03691
G1 X148.188 Y115.528 E.0369
G1 X147.827 Y115.891 E.01849
G1 X147.306 Y115.607 E.02143
G1 X146.286 Y115.536 E.03691
G1 X145.329 Y115.896 E.0369
G1 X144.677 Y116.552 E.03339
G1 X144.22 Y116.724 E.01763
G2 X143.597 Y116.523 I-.531 J.581 E.02436
G1 X143.262 Y116.076 E.02018
G1 X142.364 Y115.587 E.03692
G1 X141.344 Y115.517 E.03691
G1 X140.388 Y115.876 E.0369
G1 X139.696 Y116.572 E.03543
G1 X139.334 Y116.708 E.01395
G2 X138.673 Y116.486 I-.573 J.612 E.02598
G1 X138.338 Y116.039 E.02018
G1 X137.439 Y115.551 E.03692
G1 X136.42 Y115.48 E.03691
G1 X135.463 Y115.839 E.0369
G1 X134.697 Y116.61 E.03923
G1 X134.519 Y116.677 E.00686
G2 X133.783 Y116.415 I-.655 J.674 E.02909
G1 X133.448 Y115.968 E.02018
G1 X132.55 Y115.479 E.03692
G1 X131.53 Y115.408 E.03691
G1 X130.573 Y115.768 E.0369
G1 X129.786 Y116.559 E.0403
G1 X129.27 Y116.278 E.02124
G1 X128.978 Y116.258 E.01054
G1 X128.643 Y115.811 E.02018
G1 X127.745 Y115.322 E.03692
G1 X126.725 Y115.251 E.03691
G1 X125.769 Y115.611 E.0369
G1 X125.27 Y116.112 E.02552
G1 X124.755 Y115.832 E.02119
G1 X123.735 Y115.761 E.03691
G1 X122.778 Y116.12 E.0369
G1 X122.342 Y116.559 E.02235
G1 X122.034 Y116.538 E.01116
G1 X121.507 Y116.736 E.02031
G1 X121.273 Y116.609 E.0096
G1 X120.317 Y116.543 E.03462
G1 X119.517 Y116.108 E.03288
G1 X119.055 Y116.076 E.01672
G1 X118.798 Y115.733 E.01547
G1 X118.073 Y115.339 E.02979
G1 X118.21 Y114.694 E.0238
G1 X117.946 Y113.635 E.03939
G2 X118.115 Y112.857 I-26.042 J-6.063 E.02875
G1 X117.898 Y111.863 E.03676
G1 X117.559 Y111.411 E.02041
G1 X117.988 Y110.838 E.02583
G2 X118.249 Y109.645 I-39.884 J-9.346 E.0441
G1 X119.297 Y110.039 E.04041
G1 X120.317 Y109.968 E.03691
G1 X120.55 Y109.841 E.0096
G1 X121.077 Y110.039 E.02031
G1 X122.097 Y109.968 E.03691
G1 X123.051 Y109.405 E.04
G1 X123.797 Y109.353 E.027
; WIPE_START
G1 X123.926 Y109.315 E-.05098
G1 X124.715 Y109.612 E-.32042
G1 X125.422 Y109.563 E-.26935
G1 X125.538 Y109.679 E-.06244
G1 X125.678 Y109.732 E-.05681
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.028 Y111.788 Z.6 F30000
G1 X162.534 Y120.044 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X162.534 Y116.108 E.14209
G1 X162.327 Y115.831 E.01251
G1 X162.454 Y115.232 E.0221
G1 X162.275 Y114.412 E.03032
G1 X162.027 Y114.081 E.01496
G1 X162.027 Y120.378 E.22738
G1 X161.519 Y120.676 E.02125
G1 X161.519 Y105.304 E.555
G2 X161.011 Y105.126 I-.449 J.466 E.02004
G1 X161.011 Y120.834 E.56716
G1 X160.503 Y120.869 E.01838
G1 X160.503 Y105.09 E.56971
G2 X159.995 Y105.225 I-.107 J.622 E.01956
G1 X159.995 Y120.716 E.55933
G3 X159.487 Y120.436 I.053 J-.695 E.0216
G1 X159.487 Y105.479 E.54003
G1 X159.411 Y105.556 E.00389
G1 X158.979 Y105.518 E.01565
G1 X158.979 Y120.369 E.53622
G1 X158.472 Y120.646 E.02088
G1 X158.472 Y105.563 E.54457
G2 X157.964 Y105.741 I.046 J.948 E.01969
M73 P28 R16
G1 X157.964 Y120.83 E.54483
G1 X157.456 Y120.866 E.01838
G1 X157.456 Y106.1 E.53312
G1 X156.948 Y106.549 E.02448
G1 X156.948 Y120.737 E.51226
G1 X156.527 Y120.579 E.01625
G1 X156.44 Y120.492 E.00444
G1 X156.44 Y106.295 E.5126
G1 X155.932 Y106.021 E.02083
G1 X155.932 Y119.981 E.50403
G1 X155.89 Y119.938 E.00218
G1 X155.424 Y120.351 E.02248
G1 X155.424 Y105.986 E.51869
G2 X154.917 Y106.03 I-.205 J.578 E.01899
G1 X154.917 Y120.803 E.53337
G1 X154.854 Y120.858 E.00303
G1 X154.409 Y120.841 E.01609
G1 X154.409 Y106.221 E.52785
G1 X153.901 Y106.412 E.01959
G1 X153.901 Y120.863 E.52176
G3 X153.393 Y120.812 I-.165 J-.902 E.01868
G1 X153.393 Y105.919 E.53772
G1 X152.885 Y105.642 E.02088
G1 X152.885 Y120.532 E.53761
G1 X152.495 Y120.256 E.01726
G1 X152.377 Y120.306 E.00462
G1 X152.377 Y112.42 E.28472
G1 X152.008 Y113.155 E.02968
G1 X152.025 Y113.79 E.02296
G1 X151.869 Y113.947 E.00796
G1 X151.869 Y120.521 E.23737
G3 X151.362 Y120.707 I-.844 J-1.512 E.01962
G1 X151.362 Y114.733 E.21569
G1 X151.25 Y115.036 E.01164
G1 X151.25 Y116.298 E.04557
G1 X150.854 Y116.082 E.01629
G1 X150.854 Y120.769 E.16921
G3 X150.346 Y120.702 I-.079 J-1.358 E.01861
G1 X150.346 Y115.806 E.17677
G2 X149.838 Y115.629 I-.448 J.467 E.02003
G1 X149.838 Y120.475 E.17497
G1 X149.549 Y120.316 E.01191
G1 X149.33 Y120.435 E.00899
G1 X149.33 Y115.593 E.17482
G2 X148.822 Y115.729 I-.106 J.623 E.01957
G1 X148.822 Y120.712 E.1799
G3 X148.314 Y120.799 I-.349 J-.512 E.01919
G1 X148.314 Y115.984 E.17383
G1 X147.901 Y116.4 E.02115
G1 X147.807 Y116.348 E.0039
G1 X147.807 Y120.805 E.16093
G1 X147.299 Y120.614 E.01959
G1 X147.299 Y116.072 E.16401
G2 X146.791 Y115.984 I-.35 J.511 E.01919
G1 X146.791 Y120.24 E.15365
G1 X146.751 Y120.199 E.00204
G1 X146.283 Y120.454 E.01924
G1 X146.283 Y115.977 E.16165
G1 X145.775 Y116.168 E.01959
G1 X145.775 Y120.73 E.16473
G3 X145.267 Y120.841 I-.375 J-.5 E.01935
G1 X145.267 Y116.542 E.15522
G1 X144.906 Y116.906 E.01851
G1 X144.759 Y116.961 E.00565
G1 X144.759 Y120.869 E.14113
G1 X144.252 Y120.678 E.01959
G1 X144.252 Y117.152 E.12734
G1 X144.189 Y117.175 E.00242
G1 X143.744 Y116.946 E.01808
G1 X143.744 Y120.753 E.13747
G1 X143.236 Y120.789 E.01838
G1 X143.236 Y116.727 E.14666
G2 X142.728 Y116.254 I-.771 J.319 E.02584
G1 X142.728 Y120.734 E.16176
G1 X142.22 Y120.543 E.01959
G1 X142.22 Y115.99 E.1644
G1 X141.712 Y115.955 E.01838
G1 X141.712 Y120.26 E.15545
G1 X141.204 Y120.536 E.02088
G1 X141.204 Y116.009 E.16347
G1 X140.696 Y116.2 E.01959
G1 X140.696 Y120.812 E.16655
G1 X140.189 Y120.852 E.01839
G1 X140.189 Y116.66 E.15134
G3 X139.681 Y117.017 I-.645 J-.377 E.02312
G1 X139.681 Y120.813 E.13703
G1 X139.173 Y120.622 E.01959
G1 X139.173 Y117.089 E.12757
G2 X138.665 Y116.898 I-.462 J.46 E.0202
G1 X138.665 Y120.727 E.13825
G1 X138.157 Y120.762 E.01838
G1 X138.157 Y116.485 E.15446
G1 X138.062 Y116.358 E.00571
G1 X137.649 Y116.133 E.01697
G1 X137.649 Y120.639 E.1627
G1 X137.141 Y120.401 E.02025
G1 X137.141 Y115.942 E.16099
G1 X136.634 Y115.907 E.01838
G1 X136.634 Y120.358 E.16071
G1 X136.126 Y120.634 E.02088
G1 X136.126 Y116.03 E.16625
G1 X135.618 Y116.267 E.02024
G1 X135.618 Y120.829 E.16471
G1 X135.11 Y120.864 E.01838
G1 X135.11 Y116.778 E.14753
G3 X134.602 Y117.085 I-.59 J-.402 E.0221
G1 X134.602 Y120.745 E.13214
G1 X134.094 Y120.568 E.01942
G1 X134.094 Y116.914 E.13192
G2 X133.586 Y116.813 I-.364 J.505 E.01928
G1 X133.586 Y120.669 E.1392
G1 X133.116 Y120.701 E.01704
G1 X133.079 Y116.235 E.16127
G1 X132.571 Y115.959 E.02088
G1 X132.571 Y120.496 E.16384
G1 X132.063 Y120.306 E.01959
G1 X132.063 Y115.857 E.16061
G1 X131.555 Y115.838 E.01835
G1 X131.555 Y120.491 E.16801
G1 X131.047 Y120.768 E.02088
G1 X131.047 Y116.029 E.17109
G2 X130.539 Y116.385 I.136 J.734 E.0231
G1 X130.539 Y120.846 E.16105
G1 X130.031 Y120.844 E.01834
G1 X130.031 Y116.896 E.14252
G1 X129.861 Y117.068 E.00874
G1 X129.524 Y116.885 E.01386
G1 X129.524 Y120.653 E.13605
G1 X129.016 Y120.496 E.01919
G1 X129.016 Y116.673 E.13802
G1 X128.762 Y116.655 E.00917
G1 X128.508 Y116.316 E.01531
G1 X128.508 Y120.531 E.15218
G3 X128 Y120.428 I-.141 J-.607 E.0193
G1 X128 Y115.929 E.16242
G2 X127.492 Y115.717 I-.486 J.449 E.0205
M73 P29 R16
G1 X127.492 Y120.237 E.1632
G1 X127.401 Y120.203 E.00351
G1 X126.984 Y120.43 E.01714
G1 X126.984 Y115.682 E.17143
G2 X126.476 Y115.784 I-.142 J.606 E.01929
G1 X126.476 Y120.706 E.1777
G3 X125.969 Y120.838 I-.398 J-.489 E.01954
G1 X125.969 Y115.993 E.17492
G1 X125.461 Y116.504 E.02601
G1 X125.461 Y120.873 E.15775
G1 X124.953 Y120.695 E.01943
G1 X124.953 Y116.408 E.1548
G2 X124.445 Y116.223 I-.456 J.463 E.02013
G1 X124.445 Y120.38 E.1501
G1 X124.197 Y120.13 E.0127
G1 X123.937 Y120.272 E.01068
G1 X123.937 Y116.187 E.14748
G2 X123.429 Y116.315 I-.114 J.619 E.0195
G1 X123.429 Y120.548 E.15283
G1 X122.921 Y120.818 E.02076
G1 X122.921 Y116.56 E.15373
G1 X122.501 Y116.983 E.02153
G1 X122.414 Y116.977 E.00317
G1 X122.414 Y120.853 E.13996
G3 X121.906 Y120.804 I-.201 J-.58 E.019
G1 X121.906 Y117.026 E.13643
G1 X121.476 Y117.187 E.01659
G1 X121.398 Y117.145 E.0032
G1 X121.398 Y120.685 E.12782
G3 X120.89 Y120.835 I-.418 J-.48 E.01972
G1 X120.89 Y116.995 E.13866
G1 X120.382 Y116.96 E.01838
G1 X120.382 Y120.871 E.1412
G1 X120.314 Y120.875 E.00245
G1 X119.874 Y120.71 E.01698
G1 X119.874 Y116.771 E.14223
G1 X119.399 Y116.512 E.01953
G1 X119.366 Y120.419 E.14105
G1 X119.273 Y120.325 E.00478
G1 X118.859 Y120.353 E.015
G1 X118.859 Y116.474 E.14005
G1 X118.523 Y116.052 E.0195
G1 X118.351 Y115.958 E.00707
G1 X118.351 Y120.296 E.15664
G1 X117.843 Y120.105 E.01959
G1 X117.843 Y115.682 E.15972
G1 X117.607 Y115.553 E.00968
G1 X117.79 Y114.695 E.03169
G1 X117.611 Y113.874 E.03033
G1 X117.503 Y113.73 E.00652
G2 X117.694 Y112.859 I-29.209 J-6.881 E.03221
G1 X117.515 Y112.038 E.03033
G1 X117.335 Y111.797 E.01086
G1 X117.335 Y120.19 E.30302
G3 X116.827 Y120.578 I-.678 J-.361 E.0238
G1 X116.827 Y105.368 E.54916
G1 X117.335 Y105.177 E.01959
G1 X117.335 Y111.024 E.21109
G2 X117.692 Y110.288 I-.647 J-.768 E.0304
G1 X117.843 Y109.578 E.0262
G1 X117.843 Y105.099 E.16172
G1 X118.351 Y105.135 E.01838
G1 X118.351 Y109.244 E.14836
G1 X118.859 Y109.435 E.01959
G1 X118.859 Y105.373 E.14664
G2 X119.366 Y105.702 I3.528 J-4.889 E.02186
G1 X119.366 Y109.622 E.14152
G1 X119.874 Y109.586 E.01838
G1 X119.874 Y105.738 E.13897
G3 X120.382 Y105.86 I.12 J.616 E.01945
G1 X120.382 Y109.464 E.13013
G1 X120.519 Y109.39 E.00562
G1 X120.89 Y109.529 E.01431
G1 X120.89 Y105.795 E.13483
G3 X121.398 Y105.72 I.336 J.518 E.01912
G1 X121.398 Y109.604 E.14025
G1 X121.906 Y109.569 E.01838
G1 X121.906 Y105.591 E.14362
G3 X122.414 Y105.267 I.609 J.393 E.02244
G1 X122.414 Y109.327 E.1466
G3 X122.921 Y109.001 I2.596 J3.487 E.02181
G1 X122.921 Y105.083 E.14148
G1 X123.429 Y105.118 E.01838
G1 X123.429 Y108.966 E.13893
G2 X123.937 Y108.88 I-.706 J-5.714 E.0186
G1 X123.937 Y105.243 E.1313
G1 X124.314 Y105.448 E.01547
G1 X124.445 Y105.399 E.00507
G1 X124.445 Y109.071 E.13258
G2 X124.953 Y109.183 I.376 J-.499 E.01937
G1 X124.953 Y105.287 E.14067
G1 X125.461 Y105.322 E.01838
G1 X125.461 Y109.148 E.13812
G1 X125.581 Y109.139 E.00436
G2 X125.969 Y109.402 I.481 J-.292 E.01743
G1 X125.969 Y105.525 E.13999
G1 X126.401 Y105.76 E.01777
G1 X126.476 Y105.731 E.00292
G1 X126.476 Y109.593 E.13942
G1 X126.555 Y109.622 E.00305
G1 X126.984 Y109.592 E.01552
G1 X126.984 Y105.731 E.13941
G3 X127.492 Y105.812 I.166 J.596 E.01915
G1 X127.492 Y109.512 E.13358
G3 X128 Y109.496 I.261 J.212 E.02081
G1 X128 Y105.828 E.13246
G3 X128.508 Y105.714 I.379 J.498 E.01938
G1 X128.508 Y109.61 E.14069
G1 X129.016 Y109.575 E.01838
G1 X129.016 Y105.679 E.14066
G3 X129.524 Y105.3 I.669 J.366 E.02361
G1 X129.524 Y109.375 E.14713
G2 X130.031 Y109.008 I-.147 J-.738 E.02333
G1 X130.031 Y105.109 E.14079
G1 X130.539 Y105.112 E.01834
G1 X130.539 Y108.972 E.13937
G1 X130.87 Y108.949 E.01199
G1 X131.047 Y109.127 E.00905
G1 X131.047 Y105.196 E.14193
G1 X131.555 Y105.472 E.02088
G1 X131.555 Y109.366 E.14059
G2 X132.063 Y109.49 I.39 J-.493 E.01947
G1 X132.063 Y105.59 E.14081
G1 X132.571 Y105.626 E.01838
G1 X132.571 Y109.455 E.13826
G2 X132.966 Y109.326 I.057 J-.496 E.01547
G1 X133.079 Y109.369 E.00434
G1 X133.079 Y105.815 E.12831
G1 X133.231 Y105.898 E.00626
G1 X133.586 Y105.764 E.01372
G1 X133.586 Y109.56 E.13704
G2 X134.094 Y109.599 I.296 J-.536 E.01897
G1 X134.094 Y105.725 E.13985
G1 X134.602 Y105.765 E.01839
G1 X134.602 Y109.559 E.13702
G1 X134.955 Y109.367 E.0145
G1 X135.11 Y109.426 E.00598
G1 X135.11 Y105.898 E.12737
G1 X135.618 Y105.707 E.01959
G1 X135.618 Y109.617 E.14115
G1 X136.126 Y109.588 E.01837
G1 X136.126 Y105.736 E.13909
G1 X136.249 Y105.744 E.00444
G1 X136.634 Y105.37 E.01939
G1 X136.634 Y109.477 E.14827
G1 X137.141 Y109.201 E.02088
G1 X137.141 Y105.179 E.14519
G3 X137.649 Y105.099 I.342 J.515 E.01915
G1 X137.649 Y108.985 E.14032
G1 X138.017 Y108.96 E.01331
G1 X138.157 Y109.101 E.00718
G1 X138.157 Y105.134 E.14321
G1 X138.242 Y105.14 E.00309
G1 X138.665 Y105.37 E.01737
G1 X138.665 Y109.432 E.14668
G1 X139.17 Y109.622 E.01948
G1 X139.173 Y105.702 E.14155
G1 X139.681 Y105.737 E.01838
G1 X139.681 Y109.587 E.139
G2 X140.189 Y109.467 I.123 J-.615 E.01943
G1 X140.189 Y105.857 E.13036
G1 X140.331 Y105.934 E.00585
G1 X140.696 Y105.797 E.0141
G1 X140.696 Y109.527 E.13468
G2 X141.204 Y109.605 I.339 J-.516 E.01913
G1 X141.204 Y105.719 E.14028
M73 P30 R16
G1 X141.566 Y105.744 E.01307
G1 X141.712 Y105.597 E.00751
G1 X141.712 Y109.569 E.14343
G1 X141.791 Y109.564 E.00285
G1 X142.22 Y109.33 E.01764
G1 X142.22 Y105.269 E.14664
G1 X142.718 Y105.082 E.01922
G1 X142.728 Y109.002 E.14154
G1 X143.236 Y108.966 E.01838
G1 X143.236 Y105.118 E.13896
G3 X143.744 Y105.24 I.12 J.617 E.01946
G1 X143.744 Y108.931 E.13326
G1 X144.252 Y109.109 E.01943
G1 X144.252 Y105.438 E.13255
G3 X144.759 Y105.325 I.377 J.499 E.01937
G1 X144.759 Y109.221 E.14068
G1 X145.267 Y109.186 E.01838
G1 X145.267 Y105.36 E.13813
G3 X145.775 Y105.562 I.033 J.656 E.02035
G1 X145.775 Y109.397 E.13847
G1 X146.283 Y109.588 E.01959
G1 X146.283 Y105.736 E.1391
G3 X146.791 Y105.731 I.259 J.553 E.01891
G1 X146.791 Y109.593 E.13947
G1 X147.299 Y109.518 E.01854
G1 X147.299 Y105.806 E.13404
G1 X147.576 Y105.957 E.01138
G1 X147.807 Y105.87 E.00891
G1 X147.807 Y109.454 E.12942
G1 X148.314 Y109.618 E.01927
G1 X148.314 Y105.706 E.14126
G1 X148.822 Y105.741 E.01838
G1 X148.822 Y109.583 E.1387
G2 X149.33 Y109.436 I.093 J-.629 E.01969
G1 X149.33 Y105.342 E.14781
G1 X149.838 Y105.151 E.01959
G1 X149.838 Y109.157 E.14465
G1 X149.95 Y109.007 E.00677
G1 X150.346 Y108.98 E.01431
G1 X150.346 Y105.104 E.13993
G1 X150.854 Y105.14 E.01838
G1 X150.854 Y108.945 E.13738
G1 X150.904 Y108.941 E.00182
G2 X151.362 Y109.216 I.53 J-.362 E.01989
G1 X151.362 Y105.411 E.13738
G1 X151.64 Y105.563 E.01146
G3 X151.869 Y105.483 I.203 J.21 E.00904
G1 X151.869 Y109.476 E.1442
G1 X152.209 Y109.818 E.01741
G1 X152.209 Y110.72 E.03255
G1 X152.377 Y111.176 E.01754
G1 X152.377 Y105.312 E.21172
M204 S6000
G1 X162.534 Y112.398 F30000
G1 F3000
M204 S500
G1 X162.534 Y110.841 E.05621
G2 X162.241 Y110.211 I-.835 J.006 E.02587
G2 X162.518 Y108.966 I-40.868 J-9.746 E.04606
G1 X162.32 Y108.058 E.03357
G2 X162.534 Y107.546 I-.468 J-.496 E.02064
G1 X162.534 Y106.54 E.03631
G1 X162.464 Y106.218 E.01191
G1 X162.027 Y105.634 E.02634
G1 X162.027 Y113.023 E.26677
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S6000
G1 X154.508 Y114.335 Z.6 F30000
G1 X116.319 Y120.997 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X116.319 Y105.862 E.54646
G1 X116.243 Y105.939 E.00392
G2 X115.811 Y105.889 I-.305 J.744 E.01588
G1 X115.811 Y120.826 E.53931
G3 X115.303 Y120.724 I-.142 J-.606 E.01929
G1 X115.303 Y105.57 E.54716
G1 X114.796 Y105.294 E.02088
G1 X114.796 Y120.516 E.54963
G1 X114.493 Y120.212 E.01551
G1 X114.288 Y120.323 E.00843
G1 X114.288 Y105.165 E.5473
G1 X113.78 Y105.13 E.01838
G1 X113.78 Y120.6 E.55855
G1 X113.272 Y120.824 E.02005
G1 X113.272 Y105.311 E.56012
G1 X112.764 Y105.502 E.01959
G1 X112.764 Y120.86 E.5545
G3 X112.256 Y120.769 I-.155 J-.601 E.01921
G1 X112.256 Y105.251 E.56029
G2 X111.748 Y105.119 I-.398 J.489 E.01954
G1 X111.748 Y120.6 E.55894
G3 X111.241 Y120.713 I-.378 J-.498 E.01938
G1 X111.241 Y105.084 E.56431
G1 X110.733 Y105.262 E.01943
G1 X110.733 Y120.744 E.559
G1 X110.225 Y120.553 E.01959
G1 X110.225 Y105.577 E.54072
G1 X110.054 Y105.749 E.00874
G1 X109.717 Y105.565 E.01386
G1 X109.717 Y120.213 E.52885
G1 X109.209 Y120.467 E.02051
G1 X109.209 Y105.289 E.54803
G2 X108.701 Y105.124 I-.435 J.473 E.01989
G1 X108.701 Y120.744 E.56397
G3 X108.193 Y120.843 I-.362 J-.506 E.01927
G1 X108.193 Y105.089 E.56882
G1 X107.686 Y105.235 E.01909
G1 X107.686 Y120.86 E.56415
G1 X107.178 Y120.669 E.01959
G1 X107.178 Y105.507 E.54745
G1 X106.906 Y105.781 E.01394
G1 X106.67 Y105.775 E.00851
G1 X106.67 Y120.525 E.53253
G1 X106.162 Y120.56 E.01838
G1 X106.162 Y105.796 E.53308
G1 X105.654 Y105.92 E.01888
G1 X105.654 Y120.461 E.52504
G1 X105.146 Y120.271 E.01959
G1 X105.146 Y105.944 E.51727
G1 X104.638 Y105.668 E.02088
G1 X104.638 Y120.432 E.5331
G1 X104.131 Y120.709 E.02088
G1 X104.131 Y105.496 E.54926
G1 X103.623 Y105.461 E.01838
G1 X103.623 Y120.838 E.55521
G1 X103.115 Y120.874 E.01838
G1 X103.115 Y105.602 E.55139
G2 X102.607 Y105.865 I.034 J.687 E.0213
G1 X102.607 Y120.693 E.53537
G3 X102.099 Y120.374 I.095 J-.715 E.02233
G1 X102.099 Y106.376 E.50541
G1 X101.885 Y106.592 E.01095
G1 X101.591 Y106.2 E.01769
G1 X101.591 Y120.264 E.5078
G1 X101.083 Y120.54 E.02088
G1 X101.083 Y105.753 E.53392
G1 X100.576 Y105.504 E.02041
G1 X100.576 Y120.816 E.55287
G1 X100.068 Y120.852 E.01838
G1 X100.068 Y105.469 E.55543
G2 X99.56 Y105.537 I-.179 J.589 E.01908
G1 X99.56 Y120.81 E.55143
G1 X99.115 Y120.643 E.01716
G1 X99.052 Y120.677 E.00259
G1 X99.052 Y105.728 E.53973
G1 X98.544 Y106.209 E.02525
G1 X98.544 Y120.834 E.52805
M73 P31 R16
G1 X98.036 Y120.87 E.01838
G1 X98.036 Y106.721 E.51086
G1 X97.528 Y106.686 E.01838
G1 X97.528 Y120.715 E.50656
G3 X97.021 Y120.434 I.054 J-.696 E.02163
G1 X97.021 Y106.113 E.51705
G1 X96.513 Y105.499 E.02876
G1 X96.513 Y120.348 E.53611
G3 X96.005 Y120.279 I-.178 J-.59 E.01909
G1 X96.005 Y105.223 E.54359
G2 X95.497 Y105.115 I-.372 J.501 E.01933
G1 X95.497 Y120.088 E.54059
G1 X94.989 Y119.606 E.02527
G1 X94.989 Y105.09 E.52412
G1 X94.481 Y105.281 E.01959
G1 X94.481 Y111.03 E.20757
G1 X93.973 Y110.519 E.02601
G1 X93.973 Y105.629 E.17657
G2 X93.466 Y106.418 I.608 J.949 E.03494
G1 X93.466 Y108.236 E.06566
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S6000
G1 X94.173 Y115.836 Z.6 F30000
M73 P31 R15
G1 X94.481 Y119.148 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X94.481 Y111.734 E.26766
G2 X93.973 Y112.019 I.057 J.697 E.02167
G1 X93.973 Y118.648 E.23937
G1 X93.52 Y118.192 E.02321
G1 X93.466 Y118.044 E.00571
G1 X93.466 Y115.823 E.08017
M204 S6000
G1 X93.466 Y114.829 F30000
G1 F3000
M204 S500
G1 X93.466 Y112.238 E.09355
; WIPE_START
; WIPE_END
G1 E-.8 F1800
M204 S6000
G1 X99.56 Y116.832 Z.6 F30000
G1 X121.898 Y133.67 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X121.819 Y134.022 E.01303
G2 X121.733 Y135.109 I7.931 J1.171 E.03938
G1 X121.663 Y137.765 E.09593
G1 X99.892 Y137.765 E.78606
G2 X100.595 Y137.014 I-1.545 J-2.15 E.03735
G2 X97.472 Y137.428 I-1.72 J-.991 E.31896
G1 X97.858 Y137.765 E.01847
G1 X95.857 Y137.765 E.07223
G1 X95.857 Y133.754 E.14482
G1 X120.31 Y133.754 E.88291
G2 X121.838 Y133.677 I.166 J-11.985 E.05527
; WIPE_START
G1 X121.819 Y134.022 E-.1314
G1 X121.756 Y134.581 E-.21368
G1 X121.733 Y135.109 E-.20075
G1 X121.719 Y135.672 E-.21418
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.295 Y134.745 Z.6 F30000
G1 X138.102 Y133.668 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X138.614 Y133.725 E.01861
G2 X139.659 Y133.754 I.905 J-14.115 E.03777
G1 X160.143 Y133.754 E.73958
G1 X160.143 Y137.765 E.14482
G1 X151.657 Y137.765 E.30639
G2 X152.362 Y136.222 I-1.492 J-1.614 E.06287
G2 X148.798 Y137.431 I-1.986 J.003 E.27197
G1 X149.093 Y137.765 E.01609
G1 X138.337 Y137.765 E.38834
G2 X138.244 Y134.581 I-92.58 J1.125 E.11501
G2 X138.117 Y133.726 I-4.256 J.195 E.03126
; WIPE_START
G1 X138.614 Y133.725 E-.18885
G1 X139.659 Y133.754 E-.39741
G1 X140.117 Y133.754 E-.17374
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X147.711 Y134.514 Z.6 F30000
G1 X149.994 Y134.743 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X150.265 Y134.701 E.00991
G3 X150.96 Y134.811 I.127 J1.448 E.02564
G3 X149.937 Y134.762 I-.579 J1.411 E.30844
; WIPE_START
G1 X150.265 Y134.701 E-.12676
G1 X150.574 Y134.707 E-.11721
M73 P32 R15
G1 X150.772 Y134.746 E-.07664
G1 X150.96 Y134.811 E-.07566
G1 X151.139 Y134.898 E-.076
G1 X151.305 Y135.01 E-.0759
G1 X151.455 Y135.141 E-.0755
G1 X151.588 Y135.292 E-.07668
G1 X151.675 Y135.423 E-.05966
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.049 Y135.729 Z.6 F30000
G1 X98.818 Y137.546 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X98.676 Y137.535 E.00517
G3 X98.765 Y134.501 I.204 J-1.513 E.16157
G3 X99.46 Y134.611 I.127 J1.449 E.02565
G3 X98.878 Y137.549 I-.58 J1.412 E.15174
; WIPE_START
G1 X98.676 Y137.535 E-.07721
G1 X98.479 Y137.498 E-.07599
G1 X98.291 Y137.434 E-.07559
G1 X98.111 Y137.346 E-.0763
G1 X97.945 Y137.234 E-.07592
G1 X97.795 Y137.103 E-.07544
G1 X97.662 Y136.952 E-.07676
G1 X97.552 Y136.786 E-.07574
G1 X97.463 Y136.607 E-.07595
G1 X97.4 Y136.419 E-.07512
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X105.011 Y135.846 Z.6 F30000
G1 X137.572 Y133.394 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X122.428 Y133.394 E.54679
G2 X122.19 Y135.125 I6.782 J1.813 E.06324
G1 X122.109 Y138.222 E.11186
G1 X95.4 Y138.222 E.96434
G1 X95.4 Y133.297 E.17783
G1 X120.309 Y133.296 E.89937
G2 X122.311 Y133.147 I.21 J-10.651 E.07261
G1 X137.66 Y133.147 E.55416
G1 X138.142 Y133.213 E.01758
G2 X139.661 Y133.296 I1.37 J-11.025 E.05495
G1 X160.6 Y133.297 E.75604
G1 X160.6 Y138.222 E.17783
G1 X137.892 Y138.222 E.81989
G2 X137.788 Y134.616 I-104.895 J1.231 E.13024
G2 X137.588 Y133.452 I-5.713 J.378 E.04275
; WIPE_START
G1 X135.588 Y133.444 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.187 Y134.16 Z.6 F30000
G1 X148.837 Y134.693 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5002
G1 F5248.425
M204 S500
G1 X148.287 Y134.142 E.02813
G1 X147.64 Y134.142 E.02336
G1 X148.404 Y134.906 E.039
G2 X148.176 Y135.324 I2.796 J1.793 E.01724
G1 X146.993 Y134.142 E.0604
G1 X146.347 Y134.142 E.02336
G1 X148.036 Y135.831 E.08628
G2 X148.015 Y136.457 I2.537 J.399 E.02267
G1 X145.7 Y134.142 E.11824
G1 X145.053 Y134.142 E.02336
G1 X148.058 Y137.146 E.15347
G1 X147.889 Y137.228 E.00677
G1 X147.961 Y137.376 E.00594
G1 X147.641 Y137.376 E.01158
G1 X144.407 Y134.142 E.16522
G1 X143.76 Y134.142 E.02336
G1 X146.994 Y137.376 E.16522
G1 X146.348 Y137.376 E.02336
G1 X143.113 Y134.142 E.16523
G1 X142.466 Y134.142 E.02336
G1 X145.701 Y137.376 E.16523
G1 X145.054 Y137.376 E.02336
G1 X141.82 Y134.142 E.16523
G1 X141.173 Y134.142 E.02336
G1 X144.407 Y137.376 E.16523
G1 X143.761 Y137.376 E.02336
G1 X140.526 Y134.142 E.16523
G1 X139.88 Y134.142 E.02336
G1 X143.114 Y137.376 E.16523
G1 X142.467 Y137.376 E.02336
G1 X139.221 Y134.13 E.16583
G1 X138.582 Y134.112 E.0231
G1 X138.585 Y134.141 E.00103
G1 X141.821 Y137.376 E.16528
G1 X141.174 Y137.376 E.02336
G1 X138.64 Y134.842 E.12945
G1 X138.66 Y135.509 E.02408
G1 X140.527 Y137.376 E.09541
G1 X139.881 Y137.376 E.02336
G1 X138.679 Y136.175 E.06138
G1 X138.699 Y136.841 E.02408
G1 X139.44 Y137.582 E.03785
; WIPE_START
G1 X138.699 Y136.841 E-.39818
G1 X138.679 Y136.175 E-.25329
G1 X138.881 Y136.377 E-.10853
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X146.472 Y137.173 Z.6 F30000
G1 X148.46 Y137.382 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115169
G1 F3000
M204 S500
G1 X148.536 Y137.536 E.00098
M204 S6000
G1 X149.364 Y137.686 F30000
; LINE_WIDTH: 0.128213
G1 F3000
M204 S500
G2 X149.731 Y137.993 I4.687 J-5.238 E.00323
M204 S6000
G1 X149.793 Y137.936 F30000
; LINE_WIDTH: 0.138024
G1 F3000
M204 S500
G1 X149.908 Y137.955 E.00087
; LINE_WIDTH: 0.110676
G1 X150.018 Y137.966 E.00059
M204 S6000
G1 X149.793 Y137.936 F30000
; LINE_WIDTH: 0.177628
G1 F3000
M204 S500
G1 X149.669 Y137.915 E.00134
; LINE_WIDTH: 0.206037
G1 X149.495 Y137.875 E.0023
; WIPE_START
G1 X149.669 Y137.915 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X150.732 Y137.966 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.110278
G1 F3000
M204 S500
G1 X150.837 Y137.956 E.00056
; LINE_WIDTH: 0.137158
G1 X150.957 Y137.936 E.0009
; LINE_WIDTH: 0.176009
G1 X151.071 Y137.917 E.00122
; LINE_WIDTH: 0.205587
G1 X151.255 Y137.875 E.00242
M204 S6000
G1 X151.386 Y137.686 F30000
; LINE_WIDTH: 0.128204
G1 F3000
M204 S500
G3 X151.019 Y137.993 I-4.651 J-5.196 E.00323
; WIPE_START
G1 X151.386 Y137.686 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X152.214 Y137.536 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.115183
G1 F3000
M204 S500
G1 X152.29 Y137.382 E.00098
; WIPE_START
G1 X152.214 Y137.536 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X151.443 Y134.255 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.116322
G1 F3000
M204 S500
G1 X151.346 Y134.19 E.00068
; LINE_WIDTH: 0.143945
G1 X151.242 Y134.122 E.00099
; LINE_WIDTH: 0.177338
G2 X150.967 Y134.034 I-.255 J.322 E.00313
; LINE_WIDTH: 0.123942
G1 X150.721 Y134.009 E.00158
M204 S6000
G1 X150.029 Y134.009 F30000
; LINE_WIDTH: 0.123934
G1 F3000
M204 S500
G1 X149.783 Y134.034 E.00158
; LINE_WIDTH: 0.160179
G1 X149.696 Y134.048 E.00082
; LINE_WIDTH: 0.183926
G2 X149.502 Y134.125 I.076 J.474 E.00234
; LINE_WIDTH: 0.143272
G1 X149.404 Y134.19 E.00093
; LINE_WIDTH: 0.11637
G1 X149.306 Y134.255 E.00068
; WIPE_START
G1 X149.404 Y134.19 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X157.02 Y134.69 Z.6 F30000
G1 X159.96 Y134.884 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51092
G1 F5128.205
M204 S500
G1 X159.219 Y134.142 E.03877
G1 X158.557 Y134.142 E.02447
G1 X159.755 Y135.34 E.06261
G1 X159.755 Y136.002 E.02447
G1 X157.895 Y134.142 E.09722
G1 X157.233 Y134.142 E.02447
G1 X159.755 Y136.664 E.13182
G1 X159.755 Y137.325 E.02447
G1 X156.571 Y134.142 E.16642
G1 X155.909 Y134.142 E.02447
G1 X159.144 Y137.376 E.16909
G1 X158.482 Y137.376 E.02447
G1 X155.248 Y134.142 E.16909
G1 X154.586 Y134.142 E.02447
G1 X157.82 Y137.376 E.16909
G1 X157.158 Y137.376 E.02447
G1 X153.924 Y134.142 E.16909
G1 X153.262 Y134.142 E.02447
G1 X156.496 Y137.376 E.16909
G1 X155.834 Y137.376 E.02447
G1 X152.6 Y134.142 E.16909
G1 X151.984 Y134.142 E.02277
G1 X151.966 Y134.17 E.00123
G1 X155.173 Y137.376 E.16765
G1 X154.511 Y137.376 E.02447
G1 X152.633 Y135.499 E.09817
G3 X152.748 Y136.275 I-1.779 J.66 E.02923
G1 X153.849 Y137.376 E.05757
G1 X153.187 Y137.376 E.02447
G1 X152.491 Y136.68 E.03639
; WIPE_START
G1 X153.187 Y137.376 E-.37401
G1 X153.849 Y137.376 E-.2515
G1 X153.599 Y137.126 E-.13448
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.987 Y136.558 Z.6 F30000
G1 X121.567 Y134.735 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.50984
G1 F5140.067
M204 S500
G1 X120.958 Y134.126 E.03174
G1 X120.313 Y134.142 E.02379
G1 X121.343 Y135.172 E.05371
G1 X121.326 Y135.815 E.02374
G1 X119.653 Y134.142 E.08727
G1 X118.993 Y134.142 E.02435
G1 X121.309 Y136.458 E.12083
G1 X121.292 Y137.102 E.02374
G1 X118.333 Y134.142 E.15438
G1 X117.672 Y134.142 E.02436
G1 X120.907 Y137.376 E.16871
G1 X120.246 Y137.376 E.02436
M73 P33 R15
G1 X117.012 Y134.142 E.16871
G1 X116.352 Y134.142 E.02435
G1 X119.586 Y137.376 E.16871
G1 X118.926 Y137.376 E.02436
G1 X115.691 Y134.142 E.16871
G1 X115.031 Y134.142 E.02435
G1 X118.265 Y137.376 E.16871
G1 X117.605 Y137.376 E.02436
G1 X114.371 Y134.142 E.16871
G1 X113.71 Y134.142 E.02436
G1 X116.945 Y137.376 E.16871
G1 X116.284 Y137.376 E.02436
G1 X113.05 Y134.142 E.16871
G1 X112.39 Y134.142 E.02435
G1 X115.624 Y137.376 E.16871
G1 X114.964 Y137.376 E.02436
G1 X111.729 Y134.142 E.16871
G1 X111.069 Y134.142 E.02435
G1 X114.303 Y137.376 E.16871
G1 X113.643 Y137.376 E.02435
G1 X110.409 Y134.142 E.16871
G1 X109.748 Y134.142 E.02435
G1 X112.983 Y137.376 E.1687
G1 X112.322 Y137.376 E.02435
G1 X109.088 Y134.142 E.16871
G1 X108.428 Y134.142 E.02435
G1 X111.662 Y137.376 E.1687
G1 X111.002 Y137.376 E.02436
G1 X107.767 Y134.142 E.1687
G1 X107.107 Y134.142 E.02435
G1 X110.341 Y137.376 E.1687
G1 X109.681 Y137.376 E.02436
G1 X106.447 Y134.142 E.1687
G1 X105.786 Y134.142 E.02435
G1 X109.021 Y137.376 E.1687
G1 X108.36 Y137.376 E.02436
G1 X105.126 Y134.142 E.1687
G1 X104.466 Y134.142 E.02435
G1 X107.7 Y137.376 E.1687
G1 X107.04 Y137.376 E.02436
G1 X103.806 Y134.142 E.1687
G1 X103.145 Y134.142 E.02435
G1 X106.379 Y137.376 E.1687
G1 X105.719 Y137.376 E.02436
G1 X102.485 Y134.142 E.1687
G1 X101.825 Y134.142 E.02435
G1 X105.059 Y137.376 E.1687
G1 X104.398 Y137.376 E.02436
G1 X101.164 Y134.142 E.1687
G1 X100.767 Y134.142 E.01465
G1 X100.644 Y134.282 E.00688
G1 X103.738 Y137.376 E.16138
G1 X103.078 Y137.376 E.02436
G1 X101.185 Y135.483 E.09874
G3 X101.239 Y136.198 I-2.375 J.54 E.02653
G1 X102.418 Y137.376 E.06147
G1 X101.757 Y137.376 E.02435
G1 X101.131 Y136.75 E.03266
G3 X100.931 Y137.21 I-3.061 J-1.058 E.01853
G1 X101.303 Y137.582 E.01939
; WIPE_START
G1 X100.931 Y137.21 E-.19972
G1 X101.07 Y136.932 E-.11835
G1 X101.131 Y136.75 E-.07276
G1 X101.757 Y137.376 E-.33647
G1 X101.843 Y137.376 E-.0327
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.688 Y137.605 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11863
G1 F3000
M204 S500
G1 X99.562 Y137.688 E.0009
; LINE_WIDTH: 0.157756
G1 X99.461 Y137.747 E.00107
; LINE_WIDTH: 0.203253
G1 X99.359 Y137.806 E.00149
; LINE_WIDTH: 0.228899
G1 X99.007 Y137.993 E.00585
M204 S6000
G1 X98.743 Y137.993 F30000
; LINE_WIDTH: 0.228403
G1 F3000
M204 S500
G1 X98.39 Y137.806 E.00585
; LINE_WIDTH: 0.202975
G1 X98.29 Y137.747 E.00147
; LINE_WIDTH: 0.156759
G1 X98.184 Y137.686 E.0011
; LINE_WIDTH: 0.118178
G1 X98.062 Y137.605 E.00087
M204 S6000
G1 X98.298 Y137.846 F30000
; LINE_WIDTH: 0.276693
G1 F3000
M204 S500
G2 X99.452 Y137.846 I.577 J-4.09 E.0214
; WIPE_START
G1 X98.882 Y137.886 E-.37524
G1 X98.298 Y137.846 E-.38476
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.19 Y134.211 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.115956
G1 F3000
M204 S500
G1 X100.102 Y134.134 E.00068
; LINE_WIDTH: 0.151332
G1 X99.917 Y133.982 E.00205
; WIPE_START
G1 X100.102 Y134.134 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.833 Y133.982 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.160223
G1 F3000
M204 S500
G1 X97.736 Y134.057 E.00113
; LINE_WIDTH: 0.142019
G1 X97.648 Y134.134 E.00092
; LINE_WIDTH: 0.11595
G1 X97.56 Y134.211 E.00068
M204 S6000
G1 X97.25 Y134.592 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50486
G1 F5195.48
M204 S500
G1 X96.801 Y134.142 E.02319
G1 X96.245 Y134.142 E.02025
G1 X96.245 Y134.24 E.00358
G1 X96.827 Y134.822 E.03
G2 X96.625 Y135.274 I2.602 J1.43 E.01808
G1 X96.245 Y134.894 E.01961
G1 X96.245 Y135.547 E.02384
G1 X96.513 Y135.814 E.01379
G2 X96.555 Y136.51 I2.371 J.205 E.02552
G1 X96.245 Y136.2 E.01598
G1 X96.245 Y136.854 E.02384
G1 X96.974 Y137.582 E.03759
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5195.48
G1 X96.245 Y136.854 E-.3915
G1 X96.245 Y136.2 E-.24825
G1 X96.469 Y136.424 E-.12025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/41
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S255 ; set nozzle temperature
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.227 Y118.568
G1 Z.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F6364.704
G3 X98.56 Y118.763 I.005 J.373 E.01209
G3 X98.326 Y119.259 I-.343 J.141 E.01839
G3 X97.881 Y118.915 I-.068 J-.371 E.0189
G3 X98.171 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X98.465 Y118.641 E-.11523
G1 X98.56 Y118.763 E-.05911
G1 X98.561 Y119.066 E-.11526
G1 X98.326 Y119.259 E-.11545
G1 X98.029 Y119.2 E-.11513
G1 X97.881 Y118.915 E-.122
G1 X97.928 Y118.747 E-.06594
G1 X98.037 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X96.512 Y118.06 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X96.846 Y118.255 I.005 J.373 E.01209
G3 X96.611 Y118.751 I-.343 J.141 E.01839
G3 X96.167 Y118.406 I-.068 J-.371 E.0189
G3 X96.456 Y118.058 I.397 J.036 E.01432
; WIPE_START
G1 X96.75 Y118.132 E-.11523
G1 X96.846 Y118.255 E-.05911
G1 X96.846 Y118.558 E-.11526
G1 X96.611 Y118.751 E-.11545
G1 X96.314 Y118.691 E-.11513
G1 X96.167 Y118.406 E-.122
G1 X96.213 Y118.239 E-.06594
G1 X96.323 Y118.157 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X95.177 Y116.779 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X95.51 Y116.974 I.005 J.373 E.01209
G3 X95.275 Y117.47 I-.343 J.141 E.01839
G3 X94.831 Y117.126 I-.068 J-.371 E.0189
G3 X95.12 Y116.778 I.397 J.036 E.01432
; WIPE_START
G1 X95.414 Y116.852 E-.11523
G1 X95.51 Y116.974 E-.05911
G1 X95.51 Y117.278 E-.11526
G1 X95.275 Y117.47 E-.11545
G1 X94.978 Y117.411 E-.11513
G1 X94.831 Y117.126 E-.122
G1 X94.877 Y116.958 E-.06594
G1 X94.987 Y116.877 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X97.058 Y116.274 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X97.392 Y116.468 I.005 J.373 E.01209
G3 X97.157 Y116.964 I-.343 J.141 E.01839
G3 X96.713 Y116.62 I-.068 J-.371 E.0189
G3 X97.002 Y116.272 I.397 J.036 E.01432
; WIPE_START
G1 X97.296 Y116.346 E-.11523
G1 X97.392 Y116.468 E-.05911
G1 X97.392 Y116.772 E-.11526
G1 X97.157 Y116.964 E-.11545
G1 X96.86 Y116.905 E-.11513
G1 X96.713 Y116.62 E-.122
G1 X96.759 Y116.453 E-.06594
G1 X96.868 Y116.371 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X96.038 Y114.813 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X96.371 Y115.008 I.005 J.373 E.01209
G3 X96.137 Y115.504 I-.343 J.141 E.01839
G3 X95.692 Y115.16 I-.068 J-.371 E.0189
G3 X95.981 Y114.812 I.397 J.036 E.01432
; WIPE_START
G1 X96.275 Y114.886 E-.11523
G1 X96.371 Y115.008 E-.05911
G1 X96.371 Y115.311 E-.11526
G1 X96.137 Y115.504 E-.11545
G1 X95.839 Y115.445 E-.11513
G1 X95.692 Y115.16 E-.122
G1 X95.738 Y114.992 E-.06594
G1 X95.848 Y114.911 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X95.184 Y113.187 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X95.517 Y113.381 I.005 J.373 E.01209
G3 X95.282 Y113.878 I-.343 J.141 E.01839
G3 X94.838 Y113.533 I-.068 J-.371 E.0189
G3 X95.127 Y113.185 I.397 J.036 E.01432
; WIPE_START
G1 X95.421 Y113.259 E-.11523
G1 X95.517 Y113.381 E-.05911
G1 X95.517 Y113.685 E-.11526
G1 X95.282 Y113.878 E-.11545
G1 X94.985 Y113.818 E-.11513
G1 X94.838 Y113.533 E-.122
G1 X94.884 Y113.366 E-.06594
G1 X94.994 Y113.284 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X96.513 Y111.857 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X96.846 Y112.052 I.005 J.373 E.01209
G3 X96.612 Y112.548 I-.343 J.141 E.01839
G3 X96.167 Y112.204 I-.068 J-.371 E.0189
G3 X96.457 Y111.856 I.397 J.036 E.01432
; WIPE_START
G1 X96.751 Y111.93 E-.11523
G1 X96.846 Y112.052 E-.05911
G1 X96.847 Y112.355 E-.11526
G1 X96.612 Y112.548 E-.11545
G1 X96.315 Y112.489 E-.11513
G1 X96.167 Y112.204 E-.122
G1 X96.214 Y112.036 E-.06594
G1 X96.323 Y111.955 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X97.367 Y113.484 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X97.701 Y113.679 I.005 J.373 E.01209
G3 X97.466 Y114.175 I-.343 J.141 E.01839
G3 X97.022 Y113.83 I-.068 J-.371 E.0189
G3 X97.311 Y113.483 I.397 J.036 E.01432
; WIPE_START
G1 X97.605 Y113.556 E-.11523
G1 X97.701 Y113.679 E-.05911
G1 X97.701 Y113.982 E-.11526
G1 X97.466 Y114.175 E-.11545
G1 X97.169 Y114.116 E-.11513
G1 X97.022 Y113.83 E-.122
G1 X97.068 Y113.663 E-.06594
G1 X97.177 Y113.582 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X98.388 Y114.944 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X98.721 Y115.139 I.005 J.373 E.01209
G3 X98.486 Y115.635 I-.343 J.141 E.01839
G3 X98.042 Y115.291 I-.068 J-.371 E.0189
G3 X98.331 Y114.943 I.397 J.036 E.01432
; WIPE_START
G1 X98.625 Y115.017 E-.11523
G1 X98.721 Y115.139 E-.05911
G1 X98.721 Y115.442 E-.11526
G1 X98.486 Y115.635 E-.11545
G1 X98.189 Y115.576 E-.11513
G1 X98.042 Y115.291 E-.122
G1 X98.088 Y115.123 E-.06594
G1 X98.198 Y115.042 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X100.219 Y114.353 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X100.552 Y114.548 I.005 J.373 E.01209
G3 X100.318 Y115.044 I-.343 J.141 E.01839
G3 X99.873 Y114.7 I-.068 J-.371 E.0189
G3 X100.162 Y114.352 I.397 J.036 E.01432
; WIPE_START
G1 X100.456 Y114.426 E-.11523
G1 X100.552 Y114.548 E-.05911
G1 X100.552 Y114.851 E-.11526
G1 X100.318 Y115.044 E-.11545
G1 X100.02 Y114.985 E-.11513
G1 X99.873 Y114.7 E-.122
G1 X99.919 Y114.532 E-.06594
G1 X100.029 Y114.451 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X101.195 Y115.858 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X101.529 Y116.053 I.005 J.373 E.01209
G3 X101.294 Y116.549 I-.343 J.141 E.01839
G3 X100.85 Y116.204 I-.068 J-.371 E.0189
G3 X101.139 Y115.856 I.397 J.036 E.01432
; WIPE_START
G1 X101.433 Y115.93 E-.11523
G1 X101.529 Y116.053 E-.05911
G1 X101.529 Y116.356 E-.11526
G1 X101.294 Y116.549 E-.11545
G1 X100.997 Y116.489 E-.11513
G1 X100.85 Y116.204 E-.122
G1 X100.896 Y116.037 E-.06594
G1 X101.005 Y115.955 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X102.524 Y114.528 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X102.858 Y114.723 I.005 J.373 E.01209
G3 X102.623 Y115.219 I-.343 J.141 E.01839
G3 X102.179 Y114.875 I-.068 J-.371 E.0189
G3 X102.468 Y114.527 I.397 J.036 E.01432
; WIPE_START
G1 X102.762 Y114.601 E-.11523
G1 X102.858 Y114.723 E-.05911
G1 X102.858 Y115.027 E-.11526
G1 X102.623 Y115.219 E-.11545
G1 X102.326 Y115.16 E-.11513
G1 X102.179 Y114.875 E-.122
G1 X102.225 Y114.707 E-.06594
G1 X102.335 Y114.626 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X101.548 Y113.024 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X101.882 Y113.219 I.005 J.373 E.01209
G3 X101.647 Y113.715 I-.343 J.141 E.01839
G3 X101.203 Y113.37 I-.068 J-.371 E.0189
G3 X101.492 Y113.023 I.397 J.036 E.01432
; WIPE_START
G1 X101.786 Y113.096 E-.11523
G1 X101.882 Y113.219 E-.05911
G1 X101.882 Y113.522 E-.11526
G1 X101.647 Y113.715 E-.11545
G1 X101.35 Y113.656 E-.11513
G1 X101.203 Y113.37 E-.122
G1 X101.249 Y113.203 E-.06594
G1 X101.358 Y113.122 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X100.08 Y112.011 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X100.414 Y112.206 I.005 J.373 E.01209
G3 X100.179 Y112.702 I-.343 J.141 E.01839
G3 X99.735 Y112.357 I-.068 J-.371 E.0189
G3 X100.024 Y112.01 I.397 J.036 E.01432
; WIPE_START
G1 X100.318 Y112.083 E-.11523
G1 X100.414 Y112.206 E-.05911
G1 X100.414 Y112.509 E-.11526
G1 X100.179 Y112.702 E-.11545
G1 X99.882 Y112.643 E-.11513
G1 X99.735 Y112.357 E-.122
G1 X99.781 Y112.19 E-.06594
G1 X99.89 Y112.109 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X98.574 Y111.037 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X98.907 Y111.232 I.005 J.373 E.01209
G3 X98.672 Y111.728 I-.343 J.141 E.01839
G3 X98.228 Y111.383 I-.068 J-.371 E.0189
G3 X98.517 Y111.036 I.397 J.036 E.01432
; WIPE_START
G1 X98.811 Y111.109 E-.11523
G1 X98.907 Y111.232 E-.05911
G1 X98.907 Y111.535 E-.11526
G1 X98.672 Y111.728 E-.11545
G1 X98.375 Y111.669 E-.11513
G1 X98.228 Y111.383 E-.122
G1 X98.274 Y111.216 E-.06594
G1 X98.384 Y111.135 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X97.071 Y110.059 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X97.404 Y110.254 I.005 J.373 E.01209
G3 X97.17 Y110.75 I-.343 J.141 E.01839
G3 X96.725 Y110.405 I-.068 J-.371 E.0189
G3 X97.015 Y110.058 I.397 J.036 E.01432
; WIPE_START
G1 X97.309 Y110.131 E-.11523
G1 X97.404 Y110.254 E-.05911
G1 X97.405 Y110.557 E-.11526
G1 X97.17 Y110.75 E-.11545
G1 X96.873 Y110.691 E-.11513
G1 X96.725 Y110.405 E-.122
G1 X96.772 Y110.238 E-.06594
G1 X96.881 Y110.157 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X95.586 Y109.063 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X95.92 Y109.258 I.005 J.373 E.01209
G3 X95.685 Y109.754 I-.343 J.141 E.01839
G3 X95.241 Y109.409 I-.068 J-.371 E.0189
G3 X95.53 Y109.062 I.397 J.036 E.01432
; WIPE_START
G1 X95.824 Y109.135 E-.11523
G1 X95.92 Y109.258 E-.05911
G1 X95.92 Y109.561 E-.11526
G1 X95.685 Y109.754 E-.11545
G1 X95.388 Y109.695 E-.11513
G1 X95.241 Y109.409 E-.122
G1 X95.287 Y109.242 E-.06594
G1 X95.397 Y109.161 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X97.604 Y108.285 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X97.937 Y108.48 I.005 J.373 E.01209
G3 X97.703 Y108.976 I-.343 J.141 E.01839
G3 X97.259 Y108.632 I-.068 J-.371 E.0189
G3 X97.548 Y108.284 I.397 J.036 E.01432
; WIPE_START
G1 X97.842 Y108.358 E-.11523
G1 X97.937 Y108.48 E-.0591
G1 X97.938 Y108.784 E-.11526
G1 X97.703 Y108.976 E-.11545
G1 X97.406 Y108.917 E-.11513
G1 X97.259 Y108.632 E-.122
G1 X97.305 Y108.465 E-.06594
G1 X97.414 Y108.383 E-.05187
; WIPE_END
G1 E-.04 F1800
G1 X99.096 Y109.275 Z.8 F30000
M73 P34 R15
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X99.429 Y109.469 I.005 J.373 E.01209
G3 X99.195 Y109.965 I-.343 J.141 E.01839
G3 X98.75 Y109.621 I-.068 J-.371 E.0189
G3 X99.039 Y109.273 I.397 J.036 E.01432
; WIPE_START
G1 X99.333 Y109.347 E-.11523
G1 X99.429 Y109.469 E-.05911
G1 X99.429 Y109.773 E-.11526
G1 X99.195 Y109.965 E-.11545
G1 X98.897 Y109.906 E-.11513
G1 X98.75 Y109.621 E-.122
G1 X98.796 Y109.454 E-.06594
G1 X98.906 Y109.372 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X100.597 Y110.254 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X100.931 Y110.449 I.005 J.373 E.01209
G3 X100.696 Y110.945 I-.343 J.141 E.01839
G3 X100.252 Y110.6 I-.068 J-.371 E.0189
G3 X100.541 Y110.252 I.397 J.036 E.01432
; WIPE_START
G1 X100.835 Y110.326 E-.11523
G1 X100.931 Y110.449 E-.05911
G1 X100.931 Y110.752 E-.11526
G1 X100.696 Y110.945 E-.11545
G1 X100.399 Y110.885 E-.11513
G1 X100.252 Y110.6 E-.122
G1 X100.298 Y110.433 E-.06594
G1 X100.407 Y110.351 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X102.271 Y111.061 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X102.604 Y111.256 I.005 J.373 E.01209
G3 X102.369 Y111.752 I-.343 J.141 E.01839
G3 X101.925 Y111.408 I-.068 J-.371 E.0189
G3 X102.214 Y111.06 I.397 J.036 E.01432
; WIPE_START
G1 X102.508 Y111.133 E-.11523
G1 X102.604 Y111.256 E-.05911
G1 X102.604 Y111.559 E-.11526
G1 X102.369 Y111.752 E-.11545
G1 X102.072 Y111.693 E-.11513
G1 X101.925 Y111.408 E-.122
G1 X101.971 Y111.24 E-.06594
G1 X102.081 Y111.159 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X103.266 Y112.546 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X103.599 Y112.741 I.005 J.373 E.01209
G3 X103.365 Y113.237 I-.343 J.141 E.01839
G3 X102.92 Y112.893 I-.068 J-.371 E.0189
G3 X103.21 Y112.545 I.397 J.036 E.01432
; WIPE_START
G1 X103.504 Y112.619 E-.11523
G1 X103.599 Y112.741 E-.05911
G1 X103.6 Y113.045 E-.11526
G1 X103.365 Y113.237 E-.11545
G1 X103.068 Y113.178 E-.11513
G1 X102.92 Y112.893 E-.122
G1 X102.967 Y112.726 E-.06594
G1 X103.076 Y112.644 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X104.285 Y114.008 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X104.618 Y114.203 I.005 J.373 E.01209
G3 X104.384 Y114.699 I-.343 J.141 E.01839
G3 X103.939 Y114.355 I-.068 J-.371 E.0189
G3 X104.228 Y114.007 I.397 J.036 E.01432
; WIPE_START
G1 X104.523 Y114.081 E-.11523
G1 X104.618 Y114.203 E-.05911
G1 X104.619 Y114.506 E-.11526
G1 X104.384 Y114.699 E-.11545
G1 X104.087 Y114.64 E-.11513
G1 X103.939 Y114.355 E-.122
G1 X103.985 Y114.187 E-.06594
G1 X104.095 Y114.106 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X105.242 Y115.532 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X105.575 Y115.727 I.005 J.373 E.01209
G3 X105.341 Y116.223 I-.343 J.141 E.01839
G3 X104.896 Y115.878 I-.068 J-.371 E.0189
G3 X105.185 Y115.531 I.397 J.036 E.01432
; WIPE_START
G1 X105.48 Y115.604 E-.11523
G1 X105.575 Y115.727 E-.05911
G1 X105.576 Y116.03 E-.11526
G1 X105.341 Y116.223 E-.11545
G1 X105.044 Y116.164 E-.11513
G1 X104.896 Y115.878 E-.122
G1 X104.942 Y115.711 E-.06594
G1 X105.052 Y115.63 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X104.722 Y117.293 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X105.055 Y117.488 I.005 J.373 E.01209
G3 X104.82 Y117.984 I-.343 J.141 E.01839
G3 X104.376 Y117.639 I-.068 J-.371 E.0189
G3 X104.665 Y117.291 I.397 J.036 E.01432
; WIPE_START
G1 X104.959 Y117.365 E-.11523
G1 X105.055 Y117.488 E-.05911
G1 X105.055 Y117.791 E-.11526
G1 X104.82 Y117.984 E-.11545
G1 X104.523 Y117.924 E-.11513
G1 X104.376 Y117.639 E-.122
G1 X104.422 Y117.472 E-.06594
G1 X104.532 Y117.39 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X103.261 Y116.273 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X103.594 Y116.468 I.005 J.373 E.01209
G3 X103.36 Y116.964 I-.343 J.141 E.01839
G3 X102.915 Y116.619 I-.068 J-.371 E.0189
G3 X103.204 Y116.271 I.397 J.036 E.01432
; WIPE_START
G1 X103.498 Y116.345 E-.11523
G1 X103.594 Y116.468 E-.05911
G1 X103.594 Y116.771 E-.11526
G1 X103.36 Y116.964 E-.11545
G1 X103.062 Y116.904 E-.11513
G1 X102.915 Y116.619 E-.122
G1 X102.961 Y116.452 E-.06594
G1 X103.071 Y116.37 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X101.719 Y117.814 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X102.053 Y118.009 I.005 J.373 E.01209
G3 X101.818 Y118.505 I-.343 J.141 E.01839
G3 X101.374 Y118.161 I-.068 J-.371 E.0189
G3 X101.663 Y117.813 I.397 J.036 E.01432
; WIPE_START
G1 X101.957 Y117.886 E-.11523
G1 X102.053 Y118.009 E-.05911
G1 X102.053 Y118.312 E-.11526
G1 X101.818 Y118.505 E-.11545
G1 X101.521 Y118.446 E-.11513
G1 X101.374 Y118.161 E-.122
G1 X101.42 Y117.993 E-.06594
G1 X101.529 Y117.912 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X100.007 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X100.34 Y118.763 I.005 J.373 E.01209
G3 X100.106 Y119.259 I-.343 J.141 E.01839
G3 X99.661 Y118.915 I-.068 J-.371 E.0189
G3 X99.951 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X100.245 Y118.641 E-.11523
G1 X100.34 Y118.763 E-.05911
G1 X100.341 Y119.066 E-.11526
G1 X100.106 Y119.259 E-.11545
G1 X99.809 Y119.2 E-.11513
G1 X99.661 Y118.915 E-.122
G1 X99.708 Y118.747 E-.06594
G1 X99.817 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X98.965 Y116.847 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X99.298 Y117.042 I.005 J.373 E.01209
G3 X99.064 Y117.538 I-.343 J.141 E.01839
G3 X98.619 Y117.194 I-.068 J-.371 E.0189
G3 X98.909 Y116.846 I.397 J.036 E.01432
; WIPE_START
G1 X99.203 Y116.92 E-.11523
G1 X99.298 Y117.042 E-.05911
G1 X99.299 Y117.346 E-.11526
G1 X99.064 Y117.538 E-.11545
G1 X98.767 Y117.479 E-.11513
G1 X98.619 Y117.194 E-.122
G1 X98.666 Y117.027 E-.06594
G1 X98.775 Y116.945 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X103.364 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X103.698 Y118.763 I.005 J.373 E.01209
G3 X103.463 Y119.259 I-.343 J.141 E.01839
G3 X103.019 Y118.915 I-.068 J-.371 E.0189
G3 X103.308 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X103.602 Y118.641 E-.11523
G1 X103.698 Y118.763 E-.05911
G1 X103.698 Y119.066 E-.11526
G1 X103.463 Y119.259 E-.11545
G1 X103.166 Y119.2 E-.11513
G1 X103.019 Y118.915 E-.122
G1 X103.065 Y118.747 E-.06594
G1 X103.175 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X106.228 Y118.267 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X106.561 Y118.462 I.005 J.373 E.01209
G3 X106.326 Y118.958 I-.343 J.141 E.01839
G3 X105.882 Y118.614 I-.068 J-.371 E.0189
G3 X106.171 Y118.266 I.397 J.036 E.01432
; WIPE_START
G1 X106.465 Y118.34 E-.11523
G1 X106.561 Y118.462 E-.05911
G1 X106.561 Y118.766 E-.11526
G1 X106.326 Y118.958 E-.11545
G1 X106.029 Y118.899 E-.11513
G1 X105.882 Y118.614 E-.122
G1 X105.928 Y118.446 E-.06594
G1 X106.038 Y118.365 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X107.999 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X108.333 Y118.763 I.005 J.373 E.01209
G3 X108.098 Y119.259 I-.343 J.141 E.01839
G3 X107.654 Y118.915 I-.068 J-.371 E.0189
G3 X107.943 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X108.237 Y118.641 E-.11523
G1 X108.333 Y118.763 E-.05911
G1 X108.333 Y119.066 E-.11526
G1 X108.098 Y119.259 E-.11545
G1 X107.801 Y119.2 E-.11513
G1 X107.654 Y118.915 E-.122
G1 X107.7 Y118.747 E-.06594
G1 X107.809 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X109.503 Y117.473 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X109.836 Y117.668 I.005 J.373 E.01209
G3 X109.601 Y118.164 I-.343 J.141 E.01839
G3 X109.157 Y117.82 I-.068 J-.371 E.0189
G3 X109.446 Y117.472 I.397 J.036 E.01432
; WIPE_START
G1 X109.74 Y117.546 E-.11523
G1 X109.836 Y117.668 E-.05911
G1 X109.836 Y117.971 E-.11526
G1 X109.601 Y118.164 E-.11545
G1 X109.304 Y118.105 E-.11513
G1 X109.157 Y117.82 E-.122
G1 X109.203 Y117.652 E-.06594
G1 X109.313 Y117.571 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X111.016 Y118.441 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X111.349 Y118.636 I.005 J.373 E.01209
G3 X111.115 Y119.132 I-.343 J.141 E.01839
G3 X110.67 Y118.787 I-.068 J-.371 E.0189
G3 X110.959 Y118.439 I.397 J.036 E.01432
; WIPE_START
G1 X111.253 Y118.513 E-.11523
G1 X111.349 Y118.636 E-.05911
G1 X111.349 Y118.939 E-.11526
G1 X111.115 Y119.132 E-.11545
G1 X110.817 Y119.072 E-.11513
G1 X110.67 Y118.787 E-.122
G1 X110.716 Y118.62 E-.06594
G1 X110.826 Y118.538 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X112.813 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X113.146 Y118.763 I.005 J.373 E.01209
G3 X112.912 Y119.259 I-.343 J.141 E.01839
G3 X112.467 Y118.915 I-.068 J-.371 E.0189
G3 X112.756 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X113.051 Y118.641 E-.11523
G1 X113.146 Y118.763 E-.05911
G1 X113.147 Y119.066 E-.11526
G1 X112.912 Y119.259 E-.11545
G1 X112.615 Y119.2 E-.11513
G1 X112.467 Y118.915 E-.122
G1 X112.513 Y118.747 E-.06594
G1 X112.623 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X114.379 Y117.559 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X114.712 Y117.753 I.005 J.373 E.01209
G3 X114.478 Y118.249 I-.343 J.141 E.01839
G3 X114.033 Y117.905 I-.068 J-.371 E.0189
G3 X114.322 Y117.557 I.397 J.036 E.01432
; WIPE_START
G1 X114.616 Y117.631 E-.11523
G1 X114.712 Y117.753 E-.05911
G1 X114.712 Y118.057 E-.11526
G1 X114.478 Y118.249 E-.11545
G1 X114.18 Y118.19 E-.11513
G1 X114.033 Y117.905 E-.122
G1 X114.079 Y117.738 E-.06594
G1 X114.189 Y117.656 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X112.84 Y116.616 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X113.174 Y116.811 I.005 J.373 E.01209
G3 X112.939 Y117.307 I-.343 J.141 E.01839
G3 X112.495 Y116.963 I-.068 J-.371 E.0189
G3 X112.784 Y116.615 I.397 J.036 E.01432
; WIPE_START
G1 X113.078 Y116.688 E-.11523
G1 X113.174 Y116.811 E-.05911
G1 X113.174 Y117.114 E-.11526
G1 X112.939 Y117.307 E-.11545
G1 X112.642 Y117.248 E-.11513
G1 X112.495 Y116.963 E-.122
G1 X112.541 Y116.795 E-.06594
G1 X112.65 Y116.714 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X111.256 Y115.72 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X111.59 Y115.915 I.005 J.373 E.01209
G3 X111.355 Y116.411 I-.343 J.141 E.01839
G3 X110.911 Y116.066 I-.068 J-.371 E.0189
G3 X111.2 Y115.718 I.397 J.036 E.01432
; WIPE_START
G1 X111.494 Y115.792 E-.11523
G1 X111.59 Y115.915 E-.05911
G1 X111.59 Y116.218 E-.11526
G1 X111.355 Y116.411 E-.11545
G1 X111.058 Y116.351 E-.11513
G1 X110.911 Y116.066 E-.122
G1 X110.957 Y115.899 E-.06594
G1 X111.066 Y115.817 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X110.3 Y114.195 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X110.633 Y114.39 I.005 J.373 E.01209
G3 X110.399 Y114.886 I-.343 J.141 E.01839
G3 X109.954 Y114.541 I-.068 J-.371 E.0189
G3 X110.243 Y114.194 I.397 J.036 E.01432
; WIPE_START
G1 X110.538 Y114.267 E-.11523
G1 X110.633 Y114.39 E-.05911
G1 X110.634 Y114.693 E-.11526
G1 X110.399 Y114.886 E-.11545
G1 X110.102 Y114.827 E-.11513
G1 X109.954 Y114.541 E-.122
G1 X110 Y114.374 E-.06594
G1 X110.11 Y114.293 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X109.276 Y112.739 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X109.609 Y112.934 I.005 J.373 E.01209
G3 X109.374 Y113.43 I-.343 J.141 E.01839
G3 X108.93 Y113.085 I-.068 J-.371 E.0189
G3 X109.219 Y112.737 I.397 J.036 E.01432
; WIPE_START
G1 X109.513 Y112.811 E-.11523
G1 X109.609 Y112.934 E-.05911
G1 X109.609 Y113.237 E-.11526
G1 X109.374 Y113.43 E-.11545
G1 X109.077 Y113.37 E-.11513
G1 X108.93 Y113.085 E-.122
G1 X108.976 Y112.918 E-.06594
G1 X109.086 Y112.837 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X108.287 Y111.247 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X108.62 Y111.442 I.005 J.373 E.01209
G3 X108.386 Y111.938 I-.343 J.141 E.01839
G3 X107.941 Y111.593 I-.068 J-.371 E.0189
G3 X108.23 Y111.245 I.397 J.036 E.01432
; WIPE_START
G1 X108.525 Y111.319 E-.11523
G1 X108.62 Y111.442 E-.05911
G1 X108.621 Y111.745 E-.11526
G1 X108.386 Y111.938 E-.11545
G1 X108.089 Y111.878 E-.11513
G1 X107.941 Y111.593 E-.122
G1 X107.987 Y111.426 E-.06594
G1 X108.097 Y111.344 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X106.798 Y110.211 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X107.076 Y110.948 I.019 J.414 E.03099
G3 X106.389 Y110.875 I-.328 J-.186 E.02604
G3 X106.741 Y110.21 I.745 J-.032 E.02351
; WIPE_START
G1 X107.022 Y110.264 E-.10887
G1 X107.241 Y110.522 E-.12848
G1 X107.076 Y110.948 E-.17383
G1 X106.907 Y111.131 E-.09454
G1 X106.607 Y111.128 E-.11409
G1 X106.389 Y110.875 E-.12674
G1 X106.397 Y110.841 E-.01345
; WIPE_END
G1 E-.04 F1800
G1 X108.113 Y108.94 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X108.446 Y109.135 I.005 J.373 E.01209
G3 X108.212 Y109.631 I-.343 J.141 E.01839
G3 X107.767 Y109.286 I-.068 J-.371 E.0189
G3 X108.056 Y108.939 I.397 J.036 E.01432
; WIPE_START
G1 X108.351 Y109.012 E-.11523
G1 X108.446 Y109.135 E-.05911
G1 X108.447 Y109.438 E-.11526
G1 X108.212 Y109.631 E-.11545
G1 X107.915 Y109.572 E-.11513
G1 X107.767 Y109.286 E-.122
G1 X107.813 Y109.119 E-.06594
G1 X107.923 Y109.038 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X109.616 Y109.917 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X109.95 Y110.112 I.005 J.373 E.01209
G3 X109.715 Y110.608 I-.343 J.141 E.01839
G3 X109.271 Y110.264 I-.068 J-.371 E.0189
G3 X109.56 Y109.916 I.397 J.036 E.01432
; WIPE_START
G1 X109.854 Y109.99 E-.11523
G1 X109.95 Y110.112 E-.05911
G1 X109.95 Y110.415 E-.11526
G1 X109.715 Y110.608 E-.11545
G1 X109.418 Y110.549 E-.11513
G1 X109.271 Y110.264 E-.122
G1 X109.317 Y110.096 E-.06594
G1 X109.426 Y110.015 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X110.605 Y111.41 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X110.938 Y111.604 I.005 J.373 E.01209
G3 X110.704 Y112.1 I-.343 J.141 E.01839
G3 X110.259 Y111.756 I-.068 J-.371 E.0189
G3 X110.548 Y111.408 I.397 J.036 E.01432
; WIPE_START
G1 X110.842 Y111.482 E-.11523
G1 X110.938 Y111.604 E-.05911
G1 X110.938 Y111.908 E-.11526
G1 X110.704 Y112.1 E-.11545
G1 X110.406 Y112.041 E-.11513
G1 X110.259 Y111.756 E-.122
G1 X110.305 Y111.589 E-.06594
G1 X110.415 Y111.507 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X111.629 Y112.866 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X111.963 Y113.061 I.005 J.373 E.01209
G3 X111.728 Y113.557 I-.343 J.141 E.01839
G3 X111.284 Y113.212 I-.068 J-.371 E.0189
G3 X111.573 Y112.864 I.397 J.036 E.01432
; WIPE_START
G1 X111.867 Y112.938 E-.11523
G1 X111.963 Y113.061 E-.05911
G1 X111.963 Y113.364 E-.11526
G1 X111.728 Y113.557 E-.11545
G1 X111.431 Y113.497 E-.11513
G1 X111.284 Y113.212 E-.122
G1 X111.33 Y113.045 E-.06594
G1 X111.439 Y112.963 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X112.585 Y114.39 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X112.919 Y114.585 I.005 J.373 E.01209
G3 X112.684 Y115.081 I-.343 J.141 E.01839
G3 X112.24 Y114.737 I-.068 J-.371 E.0189
G3 X112.529 Y114.389 I.397 J.036 E.01432
; WIPE_START
G1 X112.823 Y114.463 E-.11523
G1 X112.919 Y114.585 E-.05911
G1 X112.919 Y114.889 E-.11526
G1 X112.684 Y115.081 E-.11545
G1 X112.387 Y115.022 E-.11513
G1 X112.24 Y114.737 E-.122
G1 X112.286 Y114.569 E-.06594
G1 X112.396 Y114.488 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X114.17 Y115.287 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X114.503 Y115.482 I.005 J.373 E.01209
G3 X114.268 Y115.978 I-.343 J.141 E.01839
G3 X113.824 Y115.633 I-.068 J-.371 E.0189
G3 X114.113 Y115.285 I.397 J.036 E.01432
; WIPE_START
G1 X114.407 Y115.359 E-.11523
G1 X114.503 Y115.482 E-.05911
G1 X114.503 Y115.785 E-.11526
G1 X114.268 Y115.978 E-.11545
G1 X113.971 Y115.918 E-.11513
G1 X113.824 Y115.633 E-.122
G1 X113.87 Y115.466 E-.06594
G1 X113.98 Y115.385 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X115.708 Y116.229 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X116.041 Y116.424 I.005 J.373 E.01209
G3 X115.807 Y116.92 I-.343 J.141 E.01839
G3 X115.362 Y116.576 I-.068 J-.371 E.0189
G3 X115.652 Y116.228 I.397 J.036 E.01432
; WIPE_START
G1 X115.946 Y116.301 E-.11523
G1 X116.041 Y116.424 E-.05911
G1 X116.042 Y116.727 E-.11526
G1 X115.807 Y116.92 E-.11545
G1 X115.51 Y116.861 E-.11513
G1 X115.362 Y116.576 E-.122
G1 X115.409 Y116.408 E-.06594
G1 X115.518 Y116.327 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X117.214 Y117.204 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X117.548 Y117.399 I.005 J.373 E.01209
G3 X117.313 Y117.895 I-.343 J.141 E.01839
G3 X116.869 Y117.55 I-.068 J-.371 E.0189
G3 X117.158 Y117.202 I.397 J.036 E.01432
; WIPE_START
G1 X117.452 Y117.276 E-.11523
G1 X117.548 Y117.399 E-.05911
G1 X117.548 Y117.702 E-.11526
G1 X117.313 Y117.895 E-.11545
G1 X117.016 Y117.835 E-.11513
G1 X116.869 Y117.55 E-.122
G1 X116.915 Y117.383 E-.06594
G1 X117.024 Y117.301 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X115.885 Y118.533 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X116.218 Y118.728 I.005 J.373 E.01209
G3 X115.984 Y119.224 I-.343 J.141 E.01839
G3 X115.539 Y118.879 I-.068 J-.371 E.0189
G3 X115.828 Y118.532 I.397 J.036 E.01432
; WIPE_START
G1 X116.123 Y118.605 E-.11523
G1 X116.218 Y118.728 E-.05911
G1 X116.219 Y119.031 E-.11526
G1 X115.984 Y119.224 E-.11545
G1 X115.687 Y119.165 E-.11513
G1 X115.539 Y118.879 E-.122
G1 X115.585 Y118.712 E-.06594
G1 X115.695 Y118.631 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X118.831 Y118.067 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X119.165 Y118.262 I.005 J.373 E.01209
G3 X118.93 Y118.758 I-.343 J.141 E.01839
G3 X118.486 Y118.414 I-.068 J-.371 E.0189
G3 X118.775 Y118.066 I.397 J.036 E.01432
; WIPE_START
G1 X119.069 Y118.14 E-.11523
G1 X119.165 Y118.262 E-.05911
G1 X119.165 Y118.565 E-.11526
G1 X118.93 Y118.758 E-.11545
G1 X118.633 Y118.699 E-.11513
G1 X118.486 Y118.414 E-.122
G1 X118.532 Y118.246 E-.06594
G1 X118.642 Y118.165 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X120.588 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X120.921 Y118.763 I.005 J.373 E.01209
G3 X120.687 Y119.259 I-.343 J.141 E.01839
G3 X120.242 Y118.915 I-.068 J-.371 E.0189
G3 X120.531 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X120.825 Y118.641 E-.11523
G1 X120.921 Y118.763 E-.05911
G1 X120.921 Y119.066 E-.11526
G1 X120.687 Y119.259 E-.11545
G1 X120.389 Y119.2 E-.11513
G1 X120.242 Y118.915 E-.122
G1 X120.288 Y118.747 E-.06594
G1 X120.398 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X122.368 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X122.701 Y118.763 I.005 J.373 E.01209
G3 X122.466 Y119.259 I-.343 J.141 E.01839
G3 X122.022 Y118.915 I-.068 J-.371 E.0189
G3 X122.311 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X122.605 Y118.641 E-.11523
G1 X122.701 Y118.763 E-.05911
G1 X122.701 Y119.066 E-.11526
G1 X122.466 Y119.259 E-.11545
G1 X122.169 Y119.2 E-.11513
G1 X122.022 Y118.915 E-.122
G1 X122.068 Y118.747 E-.06594
G1 X122.178 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X124.069 Y117.791 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X124.402 Y117.986 I.005 J.373 E.01209
G3 X124.168 Y118.482 I-.343 J.141 E.01839
G3 X123.723 Y118.137 I-.068 J-.371 E.0189
G3 X124.013 Y117.79 I.397 J.036 E.01432
; WIPE_START
G1 X124.307 Y117.863 E-.11523
G1 X124.402 Y117.986 E-.05911
G1 X124.403 Y118.289 E-.11526
G1 X124.168 Y118.482 E-.11545
G1 X123.871 Y118.423 E-.11513
G1 X123.723 Y118.137 E-.122
G1 X123.77 Y117.97 E-.06594
G1 X123.879 Y117.889 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X125.705 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X126.038 Y118.763 I.005 J.373 E.01209
G3 X125.804 Y119.259 I-.343 J.141 E.01839
G3 X125.359 Y118.915 I-.068 J-.371 E.0189
G3 X125.648 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X125.942 Y118.641 E-.11523
G1 X126.038 Y118.763 E-.05911
G1 X126.038 Y119.066 E-.11526
G1 X125.804 Y119.259 E-.11545
G1 X125.506 Y119.2 E-.11513
G1 X125.359 Y118.915 E-.122
G1 X125.405 Y118.747 E-.06594
G1 X125.515 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X127.059 Y117.282 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X127.393 Y117.476 I.005 J.373 E.01209
G3 X127.158 Y117.972 I-.343 J.141 E.01839
G3 X126.714 Y117.628 I-.068 J-.371 E.0189
G3 X127.003 Y117.28 I.397 J.036 E.01432
; WIPE_START
G1 X127.297 Y117.354 E-.11523
G1 X127.393 Y117.476 E-.05911
G1 X127.393 Y117.78 E-.11526
G1 X127.158 Y117.972 E-.11545
G1 X126.861 Y117.913 E-.11513
G1 X126.714 Y117.628 E-.122
G1 X126.76 Y117.461 E-.06594
G1 X126.869 Y117.379 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X128.584 Y118.238 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X128.917 Y118.432 I.005 J.373 E.01209
G3 X128.683 Y118.928 I-.343 J.141 E.01839
G3 X128.238 Y118.584 I-.068 J-.371 E.0189
G3 X128.528 Y118.236 I.397 J.036 E.01432
; WIPE_START
G1 X128.822 Y118.31 E-.11523
G1 X128.917 Y118.432 E-.05911
G1 X128.918 Y118.736 E-.11526
G1 X128.683 Y118.928 E-.11545
G1 X128.386 Y118.869 E-.11513
G1 X128.238 Y118.584 E-.12201
G1 X128.285 Y118.417 E-.06593
G1 X128.394 Y118.335 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X130.389 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X130.722 Y118.763 I.005 J.373 E.01209
G3 X130.488 Y119.259 I-.343 J.141 E.01839
G3 X130.043 Y118.915 I-.068 J-.371 E.0189
G3 X130.332 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X130.627 Y118.641 E-.11523
G1 X130.722 Y118.763 E-.05911
G1 X130.722 Y119.066 E-.11526
G1 X130.488 Y119.259 E-.11545
G1 X130.19 Y119.2 E-.11513
G1 X130.043 Y118.915 E-.12201
G1 X130.089 Y118.747 E-.06593
G1 X130.199 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X131.864 Y117.438 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X132.197 Y117.633 I.005 J.373 E.01209
G3 X131.963 Y118.129 I-.343 J.141 E.01839
G3 X131.518 Y117.785 I-.068 J-.371 E.0189
G3 X131.808 Y117.437 I.397 J.036 E.01432
; WIPE_START
G1 X132.102 Y117.511 E-.11523
G1 X132.197 Y117.633 E-.05911
G1 X132.198 Y117.936 E-.11526
G1 X131.963 Y118.129 E-.11545
G1 X131.666 Y118.07 E-.11513
G1 X131.518 Y117.785 E-.12201
G1 X131.565 Y117.617 E-.06593
G1 X131.674 Y117.536 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X133.389 Y118.394 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X133.722 Y118.589 I.005 J.373 E.01209
G3 X133.488 Y119.085 I-.343 J.141 E.01839
G3 X133.043 Y118.741 I-.068 J-.371 E.0189
G3 X133.332 Y118.393 I.397 J.036 E.01432
; WIPE_START
G1 X133.626 Y118.467 E-.11523
G1 X133.722 Y118.589 E-.05911
G1 X133.722 Y118.892 E-.11526
G1 X133.488 Y119.085 E-.11545
G1 X133.19 Y119.026 E-.11513
G1 X133.043 Y118.741 E-.12201
G1 X133.089 Y118.573 E-.06593
G1 X133.199 Y118.492 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X135.223 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X135.556 Y118.763 I.005 J.373 E.01209
G3 X135.321 Y119.259 I-.343 J.141 E.01839
G3 X134.877 Y118.915 I-.068 J-.371 E.0189
G3 X135.166 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X135.46 Y118.641 E-.11523
G1 X135.556 Y118.763 E-.05911
G1 X135.556 Y119.066 E-.11526
G1 X135.321 Y119.259 E-.11545
G1 X135.024 Y119.2 E-.11513
G1 X134.877 Y118.915 E-.12201
G1 X134.923 Y118.747 E-.06593
G1 X135.033 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X136.754 Y117.51 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X137.087 Y117.705 I.005 J.373 E.01209
G3 X136.853 Y118.201 I-.343 J.141 E.01839
G3 X136.408 Y117.856 I-.068 J-.371 E.0189
G3 X136.697 Y117.509 I.397 J.036 E.01432
; WIPE_START
G1 X136.991 Y117.582 E-.11523
G1 X137.087 Y117.705 E-.05911
G1 X137.087 Y118.008 E-.11526
G1 X136.853 Y118.201 E-.11545
G1 X136.555 Y118.142 E-.11513
G1 X136.408 Y117.856 E-.12201
G1 X136.454 Y117.689 E-.06593
G1 X136.564 Y117.608 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X138.278 Y118.466 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X138.612 Y118.661 I.005 J.373 E.01209
G3 X138.377 Y119.157 I-.343 J.141 E.01839
G3 X137.933 Y118.812 I-.068 J-.371 E.0189
G3 X138.222 Y118.465 I.397 J.036 E.01432
; WIPE_START
G1 X138.516 Y118.538 E-.11523
G1 X138.612 Y118.661 E-.05911
G1 X138.612 Y118.964 E-.11526
G1 X138.377 Y119.157 E-.11545
G1 X138.08 Y119.098 E-.11513
G1 X137.933 Y118.812 E-.12201
G1 X137.979 Y118.645 E-.06593
G1 X138.089 Y118.564 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X140.121 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X140.454 Y118.763 I.005 J.373 E.01209
G3 X140.219 Y119.259 I-.343 J.141 E.01839
G3 X139.775 Y118.915 I-.068 J-.371 E.0189
G3 X140.064 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X140.358 Y118.641 E-.11523
G1 X140.454 Y118.763 E-.05911
G1 X140.454 Y119.066 E-.11526
G1 X140.219 Y119.259 E-.11545
G1 X139.922 Y119.2 E-.11513
G1 X139.775 Y118.915 E-.12201
G1 X139.821 Y118.747 E-.06593
G1 X139.931 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X141.678 Y117.547 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X142.012 Y117.742 I.005 J.373 E.01209
G3 X141.777 Y118.238 I-.343 J.141 E.01839
G3 X141.333 Y117.893 I-.068 J-.371 E.0189
G3 X141.622 Y117.546 I.397 J.036 E.01432
; WIPE_START
G1 X141.916 Y117.619 E-.11523
G1 X142.012 Y117.742 E-.05911
G1 X142.012 Y118.045 E-.11526
G1 X141.777 Y118.238 E-.11545
G1 X141.48 Y118.179 E-.11513
G1 X141.333 Y117.893 E-.12201
G1 X141.379 Y117.726 E-.06593
G1 X141.489 Y117.645 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X143.203 Y118.503 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X143.537 Y118.698 I.005 J.373 E.01209
G3 X143.302 Y119.194 I-.343 J.141 E.01839
G3 X142.858 Y118.849 I-.068 J-.371 E.0189
G3 X143.147 Y118.502 I.397 J.036 E.01432
; WIPE_START
G1 X143.441 Y118.575 E-.11523
G1 X143.537 Y118.698 E-.05911
G1 X143.537 Y119.001 E-.11526
G1 X143.302 Y119.194 E-.11545
G1 X143.005 Y119.135 E-.11513
G1 X142.858 Y118.849 E-.12201
G1 X142.904 Y118.682 E-.06593
G1 X143.013 Y118.601 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X145.049 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X145.382 Y118.763 I.005 J.373 E.01209
G3 X145.147 Y119.259 I-.343 J.141 E.01839
G3 X144.703 Y118.915 I-.068 J-.371 E.0189
G3 X144.992 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X145.286 Y118.641 E-.11523
G1 X145.382 Y118.763 E-.05911
G1 X145.382 Y119.066 E-.11526
G1 X145.147 Y119.259 E-.11545
G1 X144.85 Y119.2 E-.11513
G1 X144.703 Y118.915 E-.12201
G1 X144.749 Y118.747 E-.06593
G1 X144.859 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X146.62 Y117.567 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X146.953 Y117.762 I.005 J.373 E.01209
G3 X146.719 Y118.258 I-.343 J.141 E.01839
G3 X146.274 Y117.913 I-.068 J-.371 E.0189
G3 X146.563 Y117.565 I.397 J.036 E.01432
; WIPE_START
G1 X146.858 Y117.639 E-.11523
G1 X146.953 Y117.762 E-.05911
G1 X146.954 Y118.065 E-.11526
G1 X146.719 Y118.258 E-.11545
G1 X146.422 Y118.198 E-.11513
G1 X146.274 Y117.913 E-.12201
G1 X146.321 Y117.746 E-.06593
G1 X146.43 Y117.664 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X148.145 Y118.523 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X148.478 Y118.718 I.005 J.373 E.01209
G3 X148.244 Y119.214 I-.343 J.141 E.01839
G3 X147.799 Y118.869 I-.068 J-.371 E.0189
G3 X148.088 Y118.521 I.397 J.036 E.01432
; WIPE_START
G1 X148.382 Y118.595 E-.11523
G1 X148.478 Y118.718 E-.05911
G1 X148.478 Y119.021 E-.11526
G1 X148.244 Y119.214 E-.11545
G1 X147.946 Y119.154 E-.11513
G1 X147.799 Y118.869 E-.12201
G1 X147.845 Y118.702 E-.06593
G1 X147.955 Y118.62 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X149.479 Y117.198 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X149.812 Y117.393 I.005 J.373 E.01209
G3 X149.578 Y117.889 I-.343 J.141 E.01839
G3 X149.133 Y117.545 I-.068 J-.371 E.0189
G3 X149.423 Y117.197 I.397 J.036 E.01432
; WIPE_START
G1 X149.717 Y117.271 E-.11523
G1 X149.812 Y117.393 E-.05911
G1 X149.813 Y117.697 E-.11526
G1 X149.578 Y117.889 E-.11545
G1 X149.281 Y117.83 E-.11513
G1 X149.133 Y117.545 E-.12201
G1 X149.18 Y117.377 E-.06593
G1 X149.289 Y117.296 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X151.016 Y118.333 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X151.186 Y118.974 I-.168 J.388 E.02273
G3 X150.549 Y118.6 I-.341 J-.148 E.03752
G3 X150.96 Y118.326 I.481 J.277 E.01524
; WIPE_START
G1 X151.169 Y118.396 E-.08372
G1 X151.245 Y118.533 E-.05966
G1 X151.269 Y118.757 E-.08538
G1 X151.186 Y118.974 E-.0885
G1 X150.943 Y119.215 E-.13004
G1 X150.729 Y119.191 E-.08195
G1 X150.45 Y118.936 E-.14351
G1 X150.515 Y118.715 E-.08724
; WIPE_END
G1 E-.04 F1800
G1 X154.062 Y118.524 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G1 X154.064 Y118.524 E.00005
G3 X154.141 Y119.254 I.077 J.361 E.03685
G3 X153.652 Y119.142 I-.082 J-.768 E.01523
G3 X154.006 Y118.515 I.315 J-.235 E.02708
; WIPE_START
G1 X154.064 Y118.524 E-.02217
G1 X154.405 Y118.589 E-.1321
G1 X154.543 Y118.909 E-.13246
G1 X154.424 Y119.164 E-.10697
G1 X154.141 Y119.254 E-.11268
G1 X153.742 Y119.223 E-.15199
G1 X153.652 Y119.142 E-.04627
G1 X153.6 Y119.006 E-.05537
; WIPE_END
G1 E-.04 F1800
G1 X155.257 Y117.612 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X155.591 Y117.807 I.005 J.373 E.01209
G3 X155.356 Y118.303 I-.343 J.141 E.01839
G3 X154.912 Y117.958 I-.068 J-.371 E.0189
G3 X155.201 Y117.611 I.397 J.036 E.01432
; WIPE_START
G1 X155.495 Y117.684 E-.11523
G1 X155.591 Y117.807 E-.05911
G1 X155.591 Y118.11 E-.11526
G1 X155.356 Y118.303 E-.11545
G1 X155.059 Y118.244 E-.11513
G1 X154.912 Y117.958 E-.12201
G1 X154.958 Y117.791 E-.06593
G1 X155.068 Y117.71 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X153.643 Y116.734 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X153.988 Y116.929 I.015 J.375 E.01244
G1 X154.02 Y117.07 E.00429
G3 X153.528 Y117.432 I-.388 J-.012 E.02093
G2 X152.862 Y117.889 I1.663 J3.132 E.02411
G3 X152.689 Y117.199 I-.076 J-.348 E.03266
G2 X153.457 Y116.794 I-.008 J-.946 E.0269
G3 X153.586 Y116.733 I.29 J.447 E.00426
; WIPE_START
G1 X153.892 Y116.807 E-.11943
G1 X153.988 Y116.929 E-.05925
G1 X154.02 Y117.07 E-.05472
G1 X153.892 Y117.355 E-.1189
G1 X153.753 Y117.425 E-.05924
G1 X153.528 Y117.432 E-.08541
G1 X152.958 Y117.824 E-.26305
; WIPE_END
G1 E-.04 F1800
G1 X153.18 Y115.014 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X153.513 Y115.209 I.005 J.373 E.01209
G3 X153.278 Y115.705 I-.343 J.141 E.01839
G3 X152.834 Y115.361 I-.068 J-.371 E.0189
G3 X153.123 Y115.013 I.397 J.036 E.01432
; WIPE_START
G1 X153.417 Y115.087 E-.11523
G1 X153.513 Y115.209 E-.05911
G1 X153.513 Y115.513 E-.11526
G1 X153.278 Y115.705 E-.11545
G1 X152.981 Y115.646 E-.11513
G1 X152.834 Y115.361 E-.12201
G1 X152.88 Y115.193 E-.06593
G1 X152.99 Y115.112 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X154.076 Y113.142 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X154.492 Y113.604 I-.831 J1.167 E.01867
G3 X153.969 Y113.999 I-.367 J.058 E.02392
G3 X153.558 Y113.554 I.811 J-1.164 E.01818
G3 X154.028 Y113.112 I.571 J.136 E.02036
; WIPE_START
G1 X154.264 Y113.286 E-.11153
G1 X154.492 Y113.604 E-.14866
G1 X154.389 Y113.935 E-.13186
G1 X154.073 Y114.037 E-.12614
G1 X153.969 Y113.999 E-.04223
G1 X153.698 Y113.767 E-.13566
G1 X153.605 Y113.626 E-.06392
; WIPE_END
G1 E-.04 F1800
G1 X155.405 Y111.812 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X155.821 Y112.274 I-.831 J1.167 E.01867
G3 X155.299 Y112.669 I-.367 J.058 E.02392
G3 X154.887 Y112.225 I.811 J-1.164 E.01818
G3 X155.357 Y111.782 I.571 J.136 E.02036
; WIPE_START
G1 X155.593 Y111.956 E-.11153
G1 X155.821 Y112.274 E-.14866
G1 X155.719 Y112.606 E-.13186
G1 X155.403 Y112.708 E-.12614
G1 X155.299 Y112.669 E-.04223
G1 X155.027 Y112.437 E-.13566
G1 X154.935 Y112.297 E-.06392
; WIPE_END
G1 E-.04 F1800
G1 X156.798 Y110.903 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G1 X156.878 Y110.906 E.00241
G3 X157.125 Y111.404 I-.102 J.361 E.01868
G3 X156.434 Y111.222 I-.325 J-.171 E.02935
G3 X156.741 Y110.901 I.432 J.105 E.01388
; WIPE_START
G1 X156.878 Y110.906 E-.05222
G1 X157.125 Y111.106 E-.12068
G1 X157.125 Y111.404 E-.11356
G1 X156.894 Y111.596 E-.11412
G1 X156.738 Y111.603 E-.05914
G1 X156.487 Y111.434 E-.11524
G1 X156.434 Y111.222 E-.08275
G1 X156.478 Y111.079 E-.05705
G1 X156.576 Y111.012 E-.04524
; WIPE_END
G1 E-.04 F1800
G1 X155.835 Y109.324 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X156.168 Y109.519 I.005 J.373 E.01209
G3 X155.934 Y110.015 I-.343 J.141 E.01839
G3 X155.489 Y109.67 I-.068 J-.371 E.0189
G3 X155.778 Y109.323 I.397 J.036 E.01432
; WIPE_START
G1 X156.072 Y109.396 E-.11523
G1 X156.168 Y109.519 E-.05911
G1 X156.168 Y109.822 E-.11526
G1 X155.934 Y110.015 E-.11545
G1 X155.636 Y109.956 E-.11513
G1 X155.489 Y109.67 E-.12201
G1 X155.535 Y109.503 E-.06593
G1 X155.645 Y109.422 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X154.139 Y110.048 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X154.472 Y110.243 I.005 J.373 E.01209
G3 X154.237 Y110.739 I-.343 J.141 E.01839
G3 X153.793 Y110.394 I-.068 J-.371 E.0189
G3 X154.082 Y110.047 I.397 J.036 E.01432
; WIPE_START
G1 X154.376 Y110.12 E-.11523
G1 X154.472 Y110.243 E-.05911
G1 X154.472 Y110.546 E-.11526
G1 X154.237 Y110.739 E-.11545
G1 X153.94 Y110.68 E-.11513
G1 X153.793 Y110.394 E-.12201
G1 X153.839 Y110.227 E-.06593
G1 X153.949 Y110.146 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X153.584 Y108.122 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
M73 P35 R15
G3 X153.917 Y108.317 I.005 J.373 E.01209
G3 X153.683 Y108.813 I-.343 J.141 E.01839
G3 X153.238 Y108.468 I-.068 J-.371 E.0189
G3 X153.527 Y108.121 I.397 J.036 E.01432
; WIPE_START
G1 X153.821 Y108.194 E-.11523
G1 X153.917 Y108.317 E-.05911
G1 X153.917 Y108.62 E-.11526
G1 X153.683 Y108.813 E-.11545
G1 X153.385 Y108.754 E-.11513
G1 X153.238 Y108.468 E-.12201
G1 X153.284 Y108.301 E-.06593
G1 X153.394 Y108.22 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X152.13 Y107.095 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X152.463 Y107.29 I.005 J.373 E.01209
G3 X152.229 Y107.786 I-.343 J.141 E.01839
G3 X151.784 Y107.442 I-.068 J-.371 E.0189
G3 X152.073 Y107.094 I.397 J.036 E.01432
; WIPE_START
G1 X152.367 Y107.168 E-.11523
G1 X152.463 Y107.29 E-.05911
G1 X152.463 Y107.594 E-.11526
G1 X152.229 Y107.786 E-.11545
G1 X151.931 Y107.727 E-.11513
G1 X151.784 Y107.442 E-.12201
G1 X151.83 Y107.274 E-.06593
G1 X151.94 Y107.193 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X150.295 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X150.629 Y106.89 I.005 J.373 E.01209
G3 X150.394 Y107.386 I-.343 J.141 E.01839
G3 X149.95 Y107.042 I-.068 J-.371 E.0189
G3 X150.239 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X150.533 Y106.768 E-.11523
G1 X150.629 Y106.89 E-.05911
G1 X150.629 Y107.194 E-.11526
G1 X150.394 Y107.386 E-.11546
G1 X150.097 Y107.327 E-.11513
G1 X149.95 Y107.042 E-.12201
G1 X149.996 Y106.874 E-.06593
G1 X150.106 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X148.527 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X148.86 Y107.51 I.005 J.373 E.01209
G3 X148.626 Y108.006 I-.343 J.141 E.01839
G3 X148.181 Y107.662 I-.068 J-.371 E.0189
G3 X148.47 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X148.765 Y107.388 E-.11523
G1 X148.86 Y107.51 E-.05911
G1 X148.86 Y107.813 E-.11526
G1 X148.626 Y108.006 E-.11545
G1 X148.329 Y107.947 E-.11513
G1 X148.181 Y107.662 E-.12201
G1 X148.227 Y107.494 E-.06593
G1 X148.337 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X146.647 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X146.98 Y107.51 I.005 J.373 E.01209
G3 X146.746 Y108.006 I-.343 J.141 E.01839
G3 X146.301 Y107.662 I-.068 J-.371 E.0189
G3 X146.59 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X146.885 Y107.388 E-.11523
G1 X146.98 Y107.51 E-.05911
G1 X146.981 Y107.813 E-.11526
G1 X146.746 Y108.006 E-.11545
G1 X146.449 Y107.947 E-.11513
G1 X146.301 Y107.662 E-.12201
G1 X146.347 Y107.494 E-.06593
G1 X146.457 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X144.857 Y106.927 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X145.19 Y107.121 I.005 J.373 E.01209
G3 X144.955 Y107.617 I-.343 J.141 E.01839
G3 X144.511 Y107.273 I-.068 J-.371 E.0189
G3 X144.8 Y106.925 I.397 J.036 E.01432
; WIPE_START
G1 X145.094 Y106.999 E-.11523
G1 X145.19 Y107.121 E-.05911
G1 X145.19 Y107.425 E-.11526
G1 X144.955 Y107.617 E-.11545
G1 X144.658 Y107.558 E-.11513
G1 X144.511 Y107.273 E-.12201
G1 X144.557 Y107.106 E-.06593
G1 X144.667 Y107.024 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X142.992 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X143.325 Y106.89 I.005 J.373 E.01209
G3 X143.09 Y107.386 I-.343 J.141 E.01839
G3 X142.646 Y107.042 I-.068 J-.371 E.0189
G3 X142.935 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X143.229 Y106.768 E-.11523
G1 X143.325 Y106.89 E-.05911
G1 X143.325 Y107.194 E-.11526
G1 X143.09 Y107.386 E-.11546
G1 X142.793 Y107.327 E-.11513
G1 X142.646 Y107.042 E-.12201
G1 X142.692 Y106.874 E-.06593
G1 X142.802 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X141.223 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X141.557 Y107.51 I.005 J.373 E.01209
G3 X141.322 Y108.006 I-.343 J.141 E.01839
G3 X140.878 Y107.662 I-.068 J-.371 E.0189
G3 X141.167 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X141.461 Y107.388 E-.11523
G1 X141.557 Y107.51 E-.05911
G1 X141.557 Y107.813 E-.11526
G1 X141.322 Y108.006 E-.11545
G1 X141.025 Y107.947 E-.11513
G1 X140.878 Y107.662 E-.12201
G1 X140.924 Y107.494 E-.06593
G1 X141.033 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X139.443 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X139.777 Y107.51 I.005 J.373 E.01209
G3 X139.542 Y108.006 I-.343 J.141 E.01839
G3 X139.098 Y107.662 I-.068 J-.371 E.0189
G3 X139.387 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X139.681 Y107.388 E-.11523
G1 X139.777 Y107.51 E-.05911
G1 X139.777 Y107.813 E-.11526
G1 X139.542 Y108.006 E-.11545
G1 X139.245 Y107.947 E-.11513
G1 X139.098 Y107.662 E-.12201
G1 X139.144 Y107.494 E-.06593
G1 X139.253 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X137.675 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X138.008 Y106.89 I.005 J.373 E.01209
G3 X137.773 Y107.386 I-.343 J.141 E.01839
G3 X137.329 Y107.042 I-.068 J-.371 E.0189
G3 X137.618 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X137.912 Y106.768 E-.11523
G1 X138.008 Y106.89 E-.05911
G1 X138.008 Y107.194 E-.11526
G1 X137.773 Y107.386 E-.11546
G1 X137.476 Y107.327 E-.11513
G1 X137.329 Y107.042 E-.12201
G1 X137.375 Y106.874 E-.06593
G1 X137.485 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X135.906 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X136.24 Y107.51 I.005 J.373 E.01209
G3 X136.005 Y108.006 I-.343 J.141 E.01839
G3 X135.561 Y107.662 I-.068 J-.371 E.0189
G3 X135.85 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X136.144 Y107.388 E-.11523
G1 X136.24 Y107.51 E-.05911
G1 X136.24 Y107.813 E-.11526
G1 X136.005 Y108.006 E-.11545
G1 X135.708 Y107.947 E-.11513
G1 X135.561 Y107.662 E-.12201
G1 X135.607 Y107.494 E-.06593
G1 X135.716 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X134.026 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X134.36 Y107.51 I.005 J.373 E.01209
G3 X134.125 Y108.006 I-.343 J.141 E.01839
G3 X133.681 Y107.662 I-.068 J-.371 E.0189
G3 X133.97 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X134.264 Y107.388 E-.11523
G1 X134.36 Y107.51 E-.05911
G1 X134.36 Y107.813 E-.11526
G1 X134.125 Y108.006 E-.11545
G1 X133.828 Y107.947 E-.11513
G1 X133.681 Y107.662 E-.12201
G1 X133.727 Y107.494 E-.06593
G1 X133.836 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X132.186 Y107.193 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X132.519 Y107.388 I.005 J.373 E.01209
G3 X132.285 Y107.884 I-.343 J.141 E.01839
G3 X131.84 Y107.54 I-.068 J-.371 E.0189
G3 X132.129 Y107.192 I.397 J.036 E.01432
; WIPE_START
G1 X132.424 Y107.266 E-.11523
G1 X132.519 Y107.388 E-.05911
G1 X132.52 Y107.692 E-.11526
G1 X132.285 Y107.884 E-.11545
G1 X131.988 Y107.825 E-.11513
G1 X131.84 Y107.54 E-.12201
G1 X131.886 Y107.373 E-.06593
G1 X131.996 Y107.291 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X130.377 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X130.71 Y106.89 I.005 J.373 E.01209
G3 X130.476 Y107.386 I-.343 J.141 E.01839
G3 X130.032 Y107.042 I-.068 J-.371 E.0189
G3 X130.321 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X130.615 Y106.768 E-.11523
G1 X130.71 Y106.89 E-.05911
G1 X130.711 Y107.194 E-.11526
G1 X130.476 Y107.386 E-.11546
G1 X130.179 Y107.327 E-.11513
G1 X130.032 Y107.042 E-.12201
G1 X130.078 Y106.874 E-.06593
G1 X130.187 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X128.609 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X128.942 Y107.51 I.005 J.373 E.01209
G3 X128.707 Y108.006 I-.343 J.141 E.01839
G3 X128.263 Y107.662 I-.068 J-.371 E.0189
G3 X128.552 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X128.846 Y107.388 E-.11523
G1 X128.942 Y107.51 E-.05911
G1 X128.942 Y107.813 E-.11526
G1 X128.707 Y108.006 E-.11545
G1 X128.41 Y107.947 E-.11513
G1 X128.263 Y107.662 E-.12201
G1 X128.309 Y107.494 E-.06593
G1 X128.419 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X126.829 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X127.162 Y107.51 I.005 J.373 E.01209
G3 X126.927 Y108.006 I-.343 J.141 E.01839
G3 X126.483 Y107.662 I-.068 J-.371 E.0189
G3 X126.772 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X127.066 Y107.388 E-.11523
G1 X127.162 Y107.51 E-.05911
G1 X127.162 Y107.813 E-.11526
G1 X126.927 Y108.006 E-.11545
G1 X126.63 Y107.947 E-.11513
G1 X126.483 Y107.662 E-.122
G1 X126.529 Y107.494 E-.06594
G1 X126.639 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X125.049 Y106.888 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X125.382 Y107.083 I.005 J.373 E.01209
G3 X125.148 Y107.579 I-.343 J.141 E.01839
G3 X124.703 Y107.235 I-.068 J-.371 E.0189
G3 X124.992 Y106.887 I.397 J.036 E.01432
; WIPE_START
G1 X125.287 Y106.961 E-.11523
G1 X125.382 Y107.083 E-.05911
G1 X125.383 Y107.386 E-.11526
G1 X125.148 Y107.579 E-.11545
G1 X124.851 Y107.52 E-.11513
G1 X124.703 Y107.235 E-.122
G1 X124.749 Y107.067 E-.06594
G1 X124.859 Y106.986 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X123.18 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X123.513 Y106.89 I.005 J.373 E.01209
G3 X123.278 Y107.386 I-.343 J.141 E.01839
G3 X122.834 Y107.042 I-.068 J-.371 E.0189
G3 X123.123 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X123.417 Y106.768 E-.11523
G1 X123.513 Y106.89 E-.05911
G1 X123.513 Y107.194 E-.11526
G1 X123.278 Y107.386 E-.11545
G1 X122.981 Y107.327 E-.11513
G1 X122.834 Y107.042 E-.122
G1 X122.88 Y106.874 E-.06594
G1 X122.99 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X121.411 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X121.744 Y107.51 I.005 J.373 E.01209
G3 X121.51 Y108.006 I-.343 J.141 E.01839
G3 X121.065 Y107.662 I-.068 J-.371 E.0189
G3 X121.354 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X121.649 Y107.388 E-.11523
G1 X121.744 Y107.51 E-.05911
G1 X121.745 Y107.813 E-.11526
G1 X121.51 Y108.006 E-.11545
G1 X121.213 Y107.947 E-.11513
G1 X121.065 Y107.662 E-.122
G1 X121.111 Y107.494 E-.06594
G1 X121.221 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X119.631 Y107.315 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X119.964 Y107.51 I.005 J.373 E.01209
G3 X119.73 Y108.006 I-.343 J.141 E.01839
G3 X119.285 Y107.662 I-.068 J-.371 E.0189
G3 X119.574 Y107.314 I.397 J.036 E.01432
; WIPE_START
G1 X119.869 Y107.388 E-.11523
G1 X119.964 Y107.51 E-.05911
G1 X119.965 Y107.813 E-.11526
G1 X119.73 Y108.006 E-.11545
G1 X119.433 Y107.947 E-.11513
G1 X119.285 Y107.662 E-.122
G1 X119.332 Y107.494 E-.06594
G1 X119.441 Y107.413 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X117.863 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X118.196 Y106.89 I.005 J.373 E.01209
G3 X117.961 Y107.386 I-.343 J.141 E.01839
G3 X117.517 Y107.042 I-.068 J-.371 E.0189
G3 X117.806 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X118.1 Y106.768 E-.11523
G1 X118.196 Y106.89 E-.05911
G1 X118.196 Y107.194 E-.11526
G1 X117.961 Y107.386 E-.11545
G1 X117.664 Y107.327 E-.11513
G1 X117.517 Y107.042 E-.122
G1 X117.563 Y106.874 E-.06594
G1 X117.673 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X115.976 Y107.535 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X116.131 Y108.082 I-.052 J.31 E.02114
G3 X115.549 Y108.303 I-.47 J-.361 E.01953
G3 X115.745 Y107.527 I.203 J-.361 E.03224
G1 X115.921 Y107.522 E.00525
; WIPE_START
G1 X116.161 Y107.621 E-.09866
G1 X116.209 Y107.719 E-.0414
G1 X116.131 Y108.082 E-.14119
G1 X115.962 Y108.233 E-.08629
G1 X115.72 Y108.339 E-.10036
G1 X115.549 Y108.303 E-.0662
G1 X115.355 Y108.078 E-.11275
G1 X115.318 Y107.864 E-.08283
G1 X115.373 Y107.806 E-.03032
; WIPE_END
G1 E-.04 F1800
G1 X115.796 Y109.485 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X116.13 Y109.68 I.005 J.373 E.01209
G3 X115.895 Y110.176 I-.343 J.141 E.01839
G3 X115.451 Y109.831 I-.068 J-.371 E.0189
G3 X115.74 Y109.484 I.397 J.036 E.01432
; WIPE_START
G1 X116.034 Y109.557 E-.11523
G1 X116.13 Y109.68 E-.05911
G1 X116.13 Y109.983 E-.11526
G1 X115.895 Y110.176 E-.11545
G1 X115.598 Y110.117 E-.11513
G1 X115.451 Y109.831 E-.122
G1 X115.497 Y109.664 E-.06594
G1 X115.607 Y109.583 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X114.727 Y111.008 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X115.061 Y111.203 I.005 J.373 E.01209
G3 X114.826 Y111.699 I-.343 J.141 E.01839
G3 X114.382 Y111.355 I-.068 J-.371 E.0189
G3 X114.671 Y111.007 I.397 J.036 E.01432
; WIPE_START
G1 X114.965 Y111.08 E-.11523
G1 X115.061 Y111.203 E-.05911
G1 X115.061 Y111.506 E-.11526
G1 X114.826 Y111.699 E-.11545
G1 X114.529 Y111.64 E-.11513
G1 X114.382 Y111.355 E-.122
G1 X114.428 Y111.187 E-.06594
G1 X114.537 Y111.106 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X113.702 Y109.553 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X114.035 Y109.747 I.005 J.373 E.01209
G3 X113.801 Y110.244 I-.343 J.141 E.01839
G3 X113.356 Y109.899 I-.068 J-.371 E.0189
G3 X113.646 Y109.551 I.397 J.036 E.01432
; WIPE_START
G1 X113.94 Y109.625 E-.11523
G1 X114.035 Y109.747 E-.05911
G1 X114.036 Y110.051 E-.11526
G1 X113.801 Y110.244 E-.11545
G1 X113.504 Y110.184 E-.11513
G1 X113.356 Y109.899 E-.122
G1 X113.403 Y109.732 E-.06594
G1 X113.512 Y109.65 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X112.703 Y108.071 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X113.036 Y108.266 I.005 J.373 E.01209
G3 X112.801 Y108.762 I-.343 J.141 E.01839
G3 X112.357 Y108.418 I-.068 J-.371 E.0189
G3 X112.646 Y108.07 I.397 J.036 E.01432
; WIPE_START
G1 X112.94 Y108.144 E-.11523
G1 X113.036 Y108.266 E-.05911
G1 X113.036 Y108.57 E-.11526
G1 X112.801 Y108.762 E-.11545
G1 X112.504 Y108.703 E-.11513
G1 X112.357 Y108.418 E-.122
G1 X112.403 Y108.25 E-.06594
G1 X112.513 Y108.169 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X110.946 Y108.588 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X111.279 Y108.783 I.005 J.373 E.01209
G3 X111.044 Y109.279 I-.343 J.141 E.01839
G3 X110.6 Y108.934 I-.068 J-.371 E.0189
G3 X110.889 Y108.587 I.397 J.036 E.01432
; WIPE_START
G1 X111.183 Y108.66 E-.11523
G1 X111.279 Y108.783 E-.05911
G1 X111.279 Y109.086 E-.11526
G1 X111.044 Y109.279 E-.11545
G1 X110.747 Y109.22 E-.11513
G1 X110.6 Y108.934 E-.122
G1 X110.646 Y108.767 E-.06594
G1 X110.756 Y108.686 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X109.442 Y107.611 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X109.776 Y107.805 I.005 J.373 E.01209
G3 X109.541 Y108.301 I-.343 J.141 E.01839
G3 X109.097 Y107.957 I-.068 J-.371 E.0189
G3 X109.386 Y107.609 I.397 J.036 E.01432
; WIPE_START
G1 X109.68 Y107.683 E-.11523
G1 X109.776 Y107.805 E-.05911
G1 X109.776 Y108.109 E-.11526
G1 X109.541 Y108.301 E-.11545
G1 X109.244 Y108.242 E-.11513
G1 X109.097 Y107.957 E-.122
G1 X109.143 Y107.79 E-.06594
G1 X109.252 Y107.708 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X108.368 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X108.701 Y106.89 I.005 J.373 E.01209
G3 X108.466 Y107.386 I-.343 J.141 E.01839
G3 X108.022 Y107.042 I-.068 J-.371 E.0189
G3 X108.311 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X108.605 Y106.768 E-.11523
G1 X108.701 Y106.89 E-.05911
G1 X108.701 Y107.194 E-.11526
G1 X108.466 Y107.386 E-.11545
G1 X108.169 Y107.327 E-.11513
G1 X108.022 Y107.042 E-.122
G1 X108.068 Y106.874 E-.06594
G1 X108.178 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X106.502 Y107.351 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X106.952 Y107.72 I-.488 J1.055 E.0175
G3 X106.265 Y108.075 I-.383 J.102 E.03196
G3 X106.453 Y107.324 I.179 J-.355 E.03191
; WIPE_START
G1 X106.774 Y107.524 E-.1438
G1 X106.952 Y107.72 E-.10051
G1 X106.927 Y108.011 E-.11128
G1 X106.767 Y108.184 E-.08936
G1 X106.619 Y108.236 E-.05934
G1 X106.265 Y108.075 E-.1478
G1 X106.061 Y107.888 E-.10499
G1 X106.059 Y107.881 E-.00292
; WIPE_END
G1 E-.04 F1800
G1 X104.921 Y108.552 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G1 X105.002 Y108.554 E.00241
G3 X105.248 Y109.053 I-.101 J.36 E.01869
G3 X104.566 Y108.89 I-.321 J-.166 E.02858
G3 X104.865 Y108.551 I.396 J.048 E.01432
; WIPE_START
G1 X105.002 Y108.554 E-.05227
G1 X105.249 Y108.753 E-.12026
G1 X105.248 Y109.053 E-.11418
G1 X105.017 Y109.245 E-.11443
G1 X104.862 Y109.251 E-.05874
G1 X104.616 Y109.078 E-.11456
G1 X104.566 Y108.89 E-.07359
G1 X104.616 Y108.726 E-.06527
G1 X104.716 Y108.655 E-.04671
; WIPE_END
G1 E-.04 F1800
G1 X104.384 Y110.299 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X104.718 Y110.494 I.005 J.373 E.01209
G3 X104.483 Y110.99 I-.343 J.141 E.01839
G3 X104.039 Y110.646 I-.068 J-.371 E.0189
G3 X104.328 Y110.298 I.397 J.036 E.01432
; WIPE_START
G1 X104.622 Y110.372 E-.11523
G1 X104.718 Y110.494 E-.05911
G1 X104.718 Y110.797 E-.11526
G1 X104.483 Y110.99 E-.11545
G1 X104.186 Y110.931 E-.11513
G1 X104.039 Y110.646 E-.122
G1 X104.085 Y110.478 E-.06594
G1 X104.194 Y110.397 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X103.048 Y109.044 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X103.381 Y109.239 I.005 J.373 E.01209
G3 X103.146 Y109.735 I-.343 J.141 E.01839
G3 X102.702 Y109.39 I-.068 J-.371 E.0189
G3 X102.991 Y109.042 I.397 J.036 E.01432
; WIPE_START
G1 X103.285 Y109.116 E-.11523
G1 X103.381 Y109.239 E-.05911
G1 X103.381 Y109.542 E-.11526
G1 X103.146 Y109.735 E-.11545
G1 X102.849 Y109.675 E-.11513
G1 X102.702 Y109.39 E-.122
G1 X102.748 Y109.223 E-.06594
G1 X102.858 Y109.141 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X101.574 Y108.037 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X101.907 Y108.232 I.005 J.373 E.01209
G3 X101.672 Y108.728 I-.343 J.141 E.01839
G3 X101.228 Y108.383 I-.068 J-.371 E.0189
G3 X101.517 Y108.036 I.397 J.036 E.01432
; WIPE_START
G1 X101.811 Y108.109 E-.11523
G1 X101.907 Y108.232 E-.05911
G1 X101.907 Y108.535 E-.11526
G1 X101.672 Y108.728 E-.11545
G1 X101.375 Y108.669 E-.11513
G1 X101.228 Y108.383 E-.122
G1 X101.274 Y108.216 E-.06594
G1 X101.384 Y108.135 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X100.067 Y107.063 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X100.4 Y107.258 I.005 J.373 E.01209
G3 X100.165 Y107.754 I-.343 J.141 E.01839
G3 X99.721 Y107.41 I-.068 J-.371 E.0189
G3 X100.01 Y107.062 I.397 J.036 E.01432
; WIPE_START
G1 X100.304 Y107.136 E-.11523
G1 X100.4 Y107.258 E-.05911
G1 X100.4 Y107.562 E-.11526
G1 X100.165 Y107.754 E-.11545
G1 X99.868 Y107.695 E-.11513
G1 X99.721 Y107.41 E-.122
G1 X99.767 Y107.242 E-.06594
G1 X99.877 Y107.161 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X103.784 Y107.067 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X104.117 Y107.262 I.005 J.373 E.01209
G3 X103.883 Y107.758 I-.343 J.141 E.01839
G3 X103.438 Y107.413 I-.068 J-.371 E.0189
G3 X103.728 Y107.066 I.397 J.036 E.01432
; WIPE_START
G1 X104.022 Y107.139 E-.11523
G1 X104.117 Y107.262 E-.05911
G1 X104.118 Y107.565 E-.11526
G1 X103.883 Y107.758 E-.11545
G1 X103.586 Y107.699 E-.11513
G1 X103.438 Y107.413 E-.122
G1 X103.485 Y107.246 E-.06594
G1 X103.594 Y107.165 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X105.125 Y111.928 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X105.458 Y112.123 I.005 J.373 E.01209
G3 X105.224 Y112.619 I-.343 J.141 E.01839
G3 X104.78 Y112.274 I-.068 J-.371 E.0189
G3 X105.069 Y111.926 I.397 J.036 E.01432
; WIPE_START
G1 X105.363 Y112 E-.11523
G1 X105.458 Y112.123 E-.05911
G1 X105.459 Y112.426 E-.11526
G1 X105.224 Y112.619 E-.11545
G1 X104.927 Y112.559 E-.11513
G1 X104.78 Y112.274 E-.122
G1 X104.826 Y112.107 E-.06594
G1 X104.935 Y112.025 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X106.958 Y112.576 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X107.291 Y112.771 I.005 J.373 E.01209
G3 X107.056 Y113.267 I-.343 J.141 E.01839
G3 X106.612 Y112.922 I-.068 J-.371 E.0189
G3 X106.901 Y112.575 I.397 J.036 E.01432
; WIPE_START
G1 X107.195 Y112.648 E-.11523
G1 X107.291 Y112.771 E-.05911
G1 X107.291 Y113.074 E-.11526
G1 X107.056 Y113.267 E-.11545
G1 X106.759 Y113.208 E-.11513
G1 X106.612 Y112.922 E-.122
G1 X106.658 Y112.755 E-.06594
G1 X106.768 Y112.674 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X107.946 Y114.068 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X108.28 Y114.263 I.005 J.373 E.01209
G3 X108.045 Y114.759 I-.343 J.141 E.01839
G3 X107.601 Y114.415 I-.068 J-.371 E.0189
G3 X107.89 Y114.067 I.397 J.036 E.01432
; WIPE_START
G1 X108.184 Y114.14 E-.11523
G1 X108.28 Y114.263 E-.05911
G1 X108.28 Y114.566 E-.11526
G1 X108.045 Y114.759 E-.11545
G1 X107.748 Y114.7 E-.11513
G1 X107.601 Y114.415 E-.122
G1 X107.647 Y114.247 E-.06594
G1 X107.756 Y114.166 E-.05188
; WIPE_END
G1 E-.04 F1800
M73 P35 R14
G1 X108.971 Y115.524 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X109.304 Y115.719 I.005 J.373 E.01209
G3 X109.069 Y116.215 I-.343 J.141 E.01839
G3 X108.625 Y115.871 I-.068 J-.371 E.0189
G3 X108.914 Y115.523 I.397 J.036 E.01432
; WIPE_START
G1 X109.208 Y115.597 E-.11523
G1 X109.304 Y115.719 E-.05911
G1 X109.304 Y116.023 E-.11526
G1 X109.069 Y116.215 E-.11545
G1 X108.772 Y116.156 E-.11513
G1 X108.625 Y115.871 E-.122
G1 X108.671 Y115.703 E-.06594
G1 X108.781 Y115.622 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X106.773 Y116.481 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X107.107 Y116.676 I.005 J.373 E.01209
G3 X106.872 Y117.172 I-.343 J.141 E.01839
G3 X106.428 Y116.828 I-.068 J-.371 E.0189
G3 X106.717 Y116.48 I.397 J.036 E.01432
; WIPE_START
G1 X107.011 Y116.554 E-.11523
G1 X107.107 Y116.676 E-.05911
G1 X107.107 Y116.979 E-.11526
G1 X106.872 Y117.172 E-.11545
G1 X106.575 Y117.113 E-.11513
G1 X106.428 Y116.828 E-.122
G1 X106.474 Y116.66 E-.06594
G1 X106.584 Y116.579 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X112.57 Y111.844 Z.8 F30000
G1 X112.959 Y111.536 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X113.292 Y111.731 I.005 J.373 E.01209
G3 X113.057 Y112.227 I-.343 J.141 E.01839
G3 X112.613 Y111.883 I-.068 J-.371 E.0189
G3 X112.902 Y111.535 I.397 J.036 E.01432
; WIPE_START
G1 X113.196 Y111.609 E-.11523
G1 X113.292 Y111.731 E-.05911
G1 X113.292 Y112.035 E-.11526
G1 X113.057 Y112.227 E-.11545
G1 X112.76 Y112.168 E-.11513
G1 X112.613 Y111.883 E-.122
G1 X112.659 Y111.716 E-.06594
G1 X112.769 Y111.634 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X111.934 Y110.08 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X112.268 Y110.275 I.005 J.373 E.01209
G3 X112.033 Y110.771 I-.343 J.141 E.01839
G3 X111.589 Y110.427 I-.068 J-.371 E.0189
G3 X111.878 Y110.079 I.397 J.036 E.01432
; WIPE_START
G1 X112.172 Y110.152 E-.11523
G1 X112.268 Y110.275 E-.05911
G1 X112.268 Y110.578 E-.11526
G1 X112.033 Y110.771 E-.11545
G1 X111.736 Y110.712 E-.11513
G1 X111.589 Y110.427 E-.122
G1 X111.635 Y110.259 E-.06594
G1 X111.744 Y110.178 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X111.485 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X111.818 Y106.89 I.005 J.373 E.01209
G3 X111.584 Y107.386 I-.343 J.141 E.01839
G3 X111.139 Y107.042 I-.068 J-.371 E.0189
G3 X111.428 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X111.723 Y106.768 E-.11523
G1 X111.818 Y106.89 E-.05911
G1 X111.819 Y107.194 E-.11526
G1 X111.584 Y107.386 E-.11545
G1 X111.287 Y107.327 E-.11513
G1 X111.139 Y107.042 E-.122
G1 X111.185 Y106.874 E-.06594
G1 X111.295 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X114.032 Y106.742 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X114.365 Y106.937 I.005 J.373 E.01209
G3 X114.131 Y107.433 I-.343 J.141 E.01839
G3 X113.686 Y107.088 I-.068 J-.371 E.0189
G3 X113.975 Y106.741 I.397 J.036 E.01432
; WIPE_START
G1 X114.27 Y106.814 E-.11523
G1 X114.365 Y106.937 E-.05911
G1 X114.365 Y107.24 E-.11526
G1 X114.131 Y107.433 E-.11545
G1 X113.834 Y107.374 E-.11513
G1 X113.686 Y107.088 E-.122
G1 X113.732 Y106.921 E-.06594
G1 X113.842 Y106.84 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X115.701 Y112.515 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X116.034 Y112.71 I.005 J.373 E.01209
G3 X115.8 Y113.206 I-.343 J.141 E.01839
G3 X115.355 Y112.862 I-.068 J-.371 E.0189
G3 X115.644 Y112.514 I.397 J.036 E.01432
; WIPE_START
G1 X115.939 Y112.588 E-.11523
G1 X116.034 Y112.71 E-.05911
G1 X116.035 Y113.013 E-.11526
G1 X115.8 Y113.206 E-.11545
G1 X115.503 Y113.147 E-.11513
G1 X115.355 Y112.862 E-.122
G1 X115.401 Y112.694 E-.06594
G1 X115.511 Y112.613 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X113.915 Y113.061 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X114.248 Y113.256 I.005 J.373 E.01209
G3 X114.014 Y113.752 I-.343 J.141 E.01839
G3 X113.569 Y113.407 I-.068 J-.371 E.0189
G3 X113.858 Y113.06 I.397 J.036 E.01432
; WIPE_START
G1 X114.152 Y113.133 E-.11523
G1 X114.248 Y113.256 E-.05911
G1 X114.248 Y113.559 E-.11526
G1 X114.014 Y113.752 E-.11545
G1 X113.716 Y113.693 E-.11513
G1 X113.569 Y113.407 E-.122
G1 X113.615 Y113.24 E-.06594
G1 X113.725 Y113.159 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X115.796 Y114.352 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X116.13 Y114.547 I.005 J.373 E.01209
G3 X115.895 Y115.043 I-.343 J.141 E.01839
G3 X115.451 Y114.698 I-.068 J-.371 E.0189
G3 X115.74 Y114.35 I.397 J.036 E.01432
; WIPE_START
G1 X116.034 Y114.424 E-.11523
G1 X116.13 Y114.547 E-.05911
G1 X116.13 Y114.85 E-.11526
G1 X115.895 Y115.043 E-.11545
G1 X115.598 Y114.983 E-.11513
G1 X115.451 Y114.698 E-.122
G1 X115.497 Y114.531 E-.06594
G1 X115.607 Y114.449 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X108.476 Y111.729 Z.8 F30000
G1 X95.285 Y106.695 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X95.618 Y106.89 I.005 J.373 E.01209
G3 X95.383 Y107.386 I-.343 J.141 E.01839
G3 X94.939 Y107.042 I-.068 J-.371 E.0189
G3 X95.228 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X95.522 Y106.768 E-.11523
G1 X95.618 Y106.89 E-.05911
G1 X95.618 Y107.194 E-.11526
G1 X95.383 Y107.386 E-.11545
G1 X95.086 Y107.327 E-.11513
G1 X94.939 Y107.042 E-.122
G1 X94.985 Y106.874 E-.06594
G1 X95.095 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X102.727 Y106.892 Z.8 F30000
G1 X155.37 Y107.576 Z.8
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X155.703 Y107.771 I.005 J.373 E.01209
G3 X155.469 Y108.267 I-.343 J.141 E.01839
G3 X155.024 Y107.923 I-.068 J-.371 E.0189
G3 X155.313 Y107.575 I.397 J.036 E.01432
; WIPE_START
G1 X155.608 Y107.649 E-.11523
G1 X155.703 Y107.771 E-.05911
G1 X155.704 Y108.075 E-.11526
G1 X155.469 Y108.267 E-.11545
G1 X155.172 Y108.208 E-.11513
G1 X155.024 Y107.923 E-.12201
G1 X155.07 Y107.755 E-.06593
G1 X155.18 Y107.674 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X157.301 Y108.126 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X157.659 Y108.49 I-.014 J.371 E.01676
G3 X157.092 Y108.769 I-.362 J-.019 E.02287
G3 X157.245 Y108.125 I.236 J-.284 E.02443
; WIPE_START
G1 X157.535 Y108.208 E-.11465
G1 X157.659 Y108.49 E-.117
G1 X157.522 Y108.764 E-.1165
G1 X157.383 Y108.831 E-.05866
G1 X157.092 Y108.769 E-.11307
G1 X156.945 Y108.488 E-.12056
G1 X156.991 Y108.312 E-.06907
G1 X157.098 Y108.233 E-.05049
; WIPE_END
G1 E-.04 F1800
G1 X158.424 Y109.719 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X158.757 Y109.914 I.005 J.373 E.01209
G3 X158.523 Y110.41 I-.343 J.141 E.01839
G3 X158.078 Y110.066 I-.068 J-.371 E.0189
G3 X158.367 Y109.718 I.397 J.036 E.01432
; WIPE_START
G1 X158.662 Y109.791 E-.11523
G1 X158.757 Y109.914 E-.05911
G1 X158.758 Y110.217 E-.11526
G1 X158.523 Y110.41 E-.11545
G1 X158.226 Y110.351 E-.11513
G1 X158.078 Y110.066 E-.12201
G1 X158.124 Y109.898 E-.06593
G1 X158.234 Y109.817 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X158.92 Y111.468 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X159.254 Y111.663 I.005 J.373 E.01209
G3 X159.019 Y112.159 I-.343 J.141 E.01839
G3 X158.575 Y111.814 I-.068 J-.371 E.0189
G3 X158.864 Y111.467 I.397 J.036 E.01432
; WIPE_START
G1 X159.158 Y111.54 E-.11523
G1 X159.254 Y111.663 E-.05911
G1 X159.254 Y111.966 E-.11526
G1 X159.019 Y112.159 E-.11545
G1 X158.722 Y112.1 E-.11513
G1 X158.575 Y111.814 E-.12201
G1 X158.621 Y111.647 E-.06593
G1 X158.73 Y111.566 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X158.337 Y113.15 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X158.67 Y113.345 I.005 J.373 E.01209
G3 X158.435 Y113.841 I-.343 J.141 E.01839
G3 X157.991 Y113.496 I-.068 J-.371 E.0189
G3 X158.28 Y113.148 I.397 J.036 E.01432
; WIPE_START
G1 X158.574 Y113.222 E-.11523
G1 X158.67 Y113.345 E-.05911
G1 X158.67 Y113.648 E-.11526
G1 X158.435 Y113.841 E-.11545
G1 X158.138 Y113.781 E-.11513
G1 X157.991 Y113.496 E-.12201
G1 X158.037 Y113.329 E-.06593
G1 X158.147 Y113.247 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X158.245 Y115.108 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X158.751 Y115.494 I-.35 J.982 E.01925
G3 X158.041 Y115.835 I-.388 J.102 E.03297
G3 X158.193 Y115.087 I.187 J-.351 E.03043
; WIPE_START
G1 X158.574 Y115.293 E-.16456
G1 X158.751 Y115.494 E-.10154
G1 X158.745 Y115.736 E-.09206
G1 X158.595 Y115.911 E-.08773
G1 X158.393 Y115.996 E-.08328
G1 X158.041 Y115.835 E-.14699
G1 X157.874 Y115.691 E-.08384
; WIPE_END
G1 E-.04 F1800
G1 X156.916 Y116.437 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X157.421 Y116.823 I-.35 J.982 E.01925
G3 X156.711 Y117.165 I-.388 J.102 E.03297
G3 X156.864 Y116.417 I.187 J-.351 E.03043
; WIPE_START
G1 X157.245 Y116.622 E-.16455
G1 X157.421 Y116.823 E-.10155
G1 X157.416 Y117.065 E-.09207
G1 X157.266 Y117.241 E-.08772
G1 X157.063 Y117.325 E-.08329
G1 X156.711 Y117.165 E-.14699
G1 X156.544 Y117.02 E-.08384
; WIPE_END
G1 E-.04 F1800
G1 X156.152 Y114.528 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X156.486 Y114.723 I.005 J.373 E.01209
G3 X156.251 Y115.219 I-.343 J.141 E.01839
G3 X155.807 Y114.875 I-.068 J-.371 E.0189
G3 X156.096 Y114.527 I.397 J.036 E.01432
; WIPE_START
G1 X156.39 Y114.601 E-.11523
G1 X156.486 Y114.723 E-.05911
G1 X156.486 Y115.027 E-.11526
G1 X156.251 Y115.219 E-.11545
G1 X155.954 Y115.16 E-.11513
G1 X155.807 Y114.875 E-.12201
G1 X155.853 Y114.707 E-.06593
G1 X155.962 Y114.626 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X159.103 Y117.487 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X159.436 Y117.682 I.005 J.373 E.01209
G3 X159.202 Y118.178 I-.343 J.141 E.01839
G3 X158.757 Y117.834 I-.068 J-.371 E.0189
G3 X159.047 Y117.486 I.397 J.036 E.01432
; WIPE_START
G1 X159.341 Y117.56 E-.11523
G1 X159.436 Y117.682 E-.05911
G1 X159.437 Y117.985 E-.11526
G1 X159.202 Y118.178 E-.11545
G1 X158.905 Y118.119 E-.11513
G1 X158.757 Y117.834 E-.12201
G1 X158.804 Y117.666 E-.06593
G1 X158.913 Y117.585 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X157.589 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X157.922 Y118.763 I.005 J.373 E.01209
G3 X157.688 Y119.259 I-.343 J.141 E.01839
G3 X157.243 Y118.915 I-.068 J-.371 E.0189
G3 X157.532 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X157.827 Y118.641 E-.11523
G1 X157.922 Y118.763 E-.05911
G1 X157.923 Y119.066 E-.11526
G1 X157.688 Y119.259 E-.11545
G1 X157.391 Y119.2 E-.11513
G1 X157.243 Y118.915 E-.12201
G1 X157.289 Y118.747 E-.06593
G1 X157.399 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X160.691 Y118.568 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X161.025 Y118.763 I.005 J.373 E.01209
G3 X160.79 Y119.259 I-.343 J.141 E.01839
G3 X160.346 Y118.915 I-.068 J-.371 E.0189
G3 X160.635 Y118.567 I.397 J.036 E.01432
; WIPE_START
G1 X160.929 Y118.641 E-.11523
G1 X161.025 Y118.763 E-.05911
G1 X161.025 Y119.066 E-.11526
G1 X160.79 Y119.259 E-.11545
G1 X160.493 Y119.2 E-.11513
G1 X160.346 Y118.915 E-.12201
G1 X160.392 Y118.747 E-.06593
G1 X160.501 Y118.666 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X160.799 Y116.692 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X161.133 Y116.886 I.005 J.373 E.01209
G3 X160.898 Y117.383 I-.343 J.141 E.01839
G3 X160.454 Y117.038 I-.068 J-.371 E.0189
G3 X160.743 Y116.69 I.397 J.036 E.01432
; WIPE_START
G1 X161.037 Y116.764 E-.11523
G1 X161.133 Y116.886 E-.05911
G1 X161.133 Y117.19 E-.11526
G1 X160.898 Y117.383 E-.11545
G1 X160.601 Y117.323 E-.11513
G1 X160.454 Y117.038 E-.12201
G1 X160.5 Y116.871 E-.06593
G1 X160.61 Y116.789 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X160.461 Y114.889 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X160.794 Y115.084 I.005 J.373 E.01209
G3 X160.559 Y115.58 I-.343 J.141 E.01839
G3 X160.115 Y115.236 I-.068 J-.371 E.0189
G3 X160.404 Y114.888 I.397 J.036 E.01432
; WIPE_START
G1 X160.698 Y114.962 E-.11523
G1 X160.794 Y115.084 E-.05911
G1 X160.794 Y115.387 E-.11526
G1 X160.559 Y115.58 E-.11545
G1 X160.262 Y115.521 E-.11513
G1 X160.115 Y115.236 E-.12201
G1 X160.161 Y115.068 E-.06593
G1 X160.271 Y114.987 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X160.647 Y110.982 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X160.98 Y111.177 I.005 J.373 E.01209
G3 X160.745 Y111.673 I-.343 J.141 E.01839
G3 X160.301 Y111.329 I-.068 J-.371 E.0189
G3 X160.59 Y110.981 I.397 J.036 E.01432
; WIPE_START
G1 X160.884 Y111.054 E-.11523
G1 X160.98 Y111.177 E-.05911
G1 X160.98 Y111.48 E-.11526
G1 X160.745 Y111.673 E-.11545
G1 X160.448 Y111.614 E-.11513
G1 X160.301 Y111.329 E-.12201
G1 X160.347 Y111.161 E-.06593
G1 X160.457 Y111.08 E-.05188
; WIPE_END
G1 E-.04 F1800
M73 P36 R14
G1 X160.525 Y108.623 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X160.858 Y108.818 I.005 J.373 E.01209
G3 X160.624 Y109.314 I-.343 J.141 E.01839
G3 X160.179 Y108.969 I-.068 J-.371 E.0189
G3 X160.469 Y108.622 I.397 J.036 E.01432
; WIPE_START
G1 X160.763 Y108.695 E-.11523
G1 X160.858 Y108.818 E-.05911
G1 X160.859 Y109.121 E-.11526
G1 X160.624 Y109.314 E-.11545
G1 X160.327 Y109.255 E-.11513
G1 X160.179 Y108.969 E-.12201
G1 X160.226 Y108.802 E-.06593
G1 X160.335 Y108.721 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X160.65 Y106.695 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G3 X160.983 Y106.89 I.005 J.373 E.01209
G3 X160.749 Y107.386 I-.343 J.141 E.01839
G3 X160.304 Y107.042 I-.068 J-.371 E.0189
G3 X160.593 Y106.694 I.397 J.036 E.01432
; WIPE_START
G1 X160.887 Y106.768 E-.11523
G1 X160.983 Y106.89 E-.05911
G1 X160.983 Y107.194 E-.11526
G1 X160.749 Y107.386 E-.11546
G1 X160.451 Y107.327 E-.11513
G1 X160.304 Y107.042 E-.12201
G1 X160.35 Y106.874 E-.06593
G1 X160.46 Y106.793 E-.05188
; WIPE_END
G1 E-.04 F1800
G1 X158.956 Y107.084 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F6364.704
G1 X159.027 Y107.096 E.00213
G3 X159.318 Y107.666 I-1.154 J.95 E.01922
G3 X158.542 Y107.714 I-.393 J-.055 E.03238
G3 X158.9 Y107.074 I.291 J-.257 E.02856
; WIPE_START
G1 X159.027 Y107.096 E-.0487
G1 X159.318 Y107.666 E-.2433
G1 X159.155 Y107.948 E-.12399
G1 X158.943 Y108.027 E-.08601
G1 X158.77 Y107.997 E-.06671
G1 X158.542 Y107.714 E-.13818
G1 X158.488 Y107.585 E-.05312
; WIPE_END
G1 E-.04 F1800
G1 X153.645 Y113.485 Z.8 F30000
G1 X137.276 Y133.431 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6364.704
M204 S5000
G1 X137.278 Y133.475 E.00133
G1 F3591.595
G1 X137.282 Y133.659 E.0055
G1 F1800
G1 X137.287 Y133.844 E.0055
G1 F720
G1 X137.413 Y138.637 E.14283
G1 F600
G1 X137.418 Y138.822 E.0055
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X137.563 Y144.357 E.17806
G1 X122.437 Y144.357 E.48637
G1 X122.582 Y138.822 E.17806
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X122.587 Y138.637 E.0055
G1 X122.592 Y138.453 E.0055
G1 F720
G1 X122.718 Y133.659 E.14283
G1 F1800
G1 X122.722 Y133.475 E.0055
G1 F2175.909
G1 X122.724 Y133.431 E.00133
G1 F6364.704
G1 X123.124 Y133.431 E.01191
G1 X137.216 Y133.431 E.41977
; WIPE_START
M204 S10000
G1 X137.278 Y133.475 E-.02873
G1 X137.282 Y133.659 E-.07011
G1 X137.287 Y133.844 E-.07011
G1 X137.328 Y135.399 E-.59105
; WIPE_END
G1 E-.04 F1800
G1 X144.943 Y134.888 Z.8 F30000
G1 X149.902 Y134.555 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X149.926 Y134.546 E.00081
G3 X150.15 Y134.502 I.445 J1.67 E.00736
G1 X150.37 Y134.488 E.00708
G3 X149.712 Y134.619 I.001 J1.729 E.32757
G1 X149.845 Y134.574 E.00452
G1 X150.028 Y134.926 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.201 Y134.892 I.343 J1.291 E.00525
G1 X150.371 Y134.881 E.00507
G3 X149.971 Y134.943 I.001 J1.336 E.23798
; WIPE_START
M204 S10000
G1 X150.201 Y134.892 E-.08957
G1 X150.371 Y134.881 E-.06463
G1 X150.722 Y134.926 E-.13448
G1 X150.887 Y134.983 E-.06631
G1 X151.044 Y135.06 E-.06664
G1 X151.32 Y135.272 E-.13235
G1 X151.437 Y135.404 E-.06701
G1 X151.611 Y135.706 E-.13241
G1 X151.616 Y135.723 E-.0066
; WIPE_END
G1 E-.04 F1800
G1 X144.079 Y134.519 Z.8 F30000
G1 X137.67 Y133.495 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.398 Y133.495 E.73084
G1 X160.398 Y138.039 E.14612
G1 X160.398 Y138.439 E.01286
G1 F1800
G1 X160.398 Y138.631 E.00615
G1 F600
G1 X160.398 Y138.822 E.00615
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X160.398 Y144.543 E.18397
G1 F600
G1 X137.96 Y144.543 E.72153
G1 X137.81 Y138.822 E.18403
; FEATURE: Inner wall
G1 F1680
M204 S10000
G1 X137.805 Y138.631 E.00615
G1 F1800
G1 X137.805 Y138.631 E0
G1 F3668.672
G1 X137.8 Y138.439 E.00615
G1 F5895.652
G1 X137.789 Y138.039 E.01286
G1 X137.672 Y133.555 E.14425
; WIPE_START
G1 X139.672 Y133.55 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.079 Y134.331 Z.8 F30000
G1 X98.853 Y137.748 Z.8
G1 Z.4
G1 E.8 F1800
G1 F5895.652
G1 X98.649 Y137.731 E.00657
G3 X98.65 Y134.302 I.221 J-1.714 E.16039
G1 X98.87 Y134.288 E.00709
G3 X98.913 Y137.745 I.001 J1.729 E.1733
G1 X98.848 Y137.353 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.529 Y137.309 E.00959
G3 X98.701 Y134.692 I.342 J-1.292 E.10964
G1 X98.871 Y134.681 E.00507
G3 X98.908 Y137.353 I.001 J1.336 E.12397
; WIPE_START
M204 S10000
G1 X98.529 Y137.309 E-.14495
G1 X98.363 Y137.254 E-.06626
G1 X98.206 Y137.177 E-.06669
G1 X97.93 Y136.965 E-.13237
G1 X97.813 Y136.833 E-.06701
G1 X97.639 Y136.53 E-.13259
G1 X97.548 Y136.194 E-.13245
G1 X97.545 Y136.147 E-.01768
; WIPE_END
G1 E-.04 F1800
G1 X99.216 Y138.326 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X99.322 Y138.351 E.00351
G3 X99.576 Y138.439 I-.462 J1.736 E.00866
G1 X99.741 Y138.52 E.00588
G1 F3726.01
G1 X99.929 Y138.646 E.0073
G1 F1560
G1 X100.098 Y138.794 E.00721
G1 F600
G1 X100.122 Y138.822 E.00118
; FEATURE: Overhang wall

M204 S5000
G3 X97.628 Y138.822 I-1.247 J1.198 E.25984
; FEATURE: Inner wall
M204 S10000
G1 X97.652 Y138.794 E.00118
G1 X97.821 Y138.646 E.00721
G1 F1560
G1 X98.009 Y138.52 E.0073
G1 F3231.333
G1 X98.174 Y138.439 E.00588
G1 F5895.652
G1 X98.428 Y138.351 E.00865
G3 X98.648 Y138.303 I.533 J1.939 E.00726
G3 X99.099 Y138.307 I.213 J1.784 E.01455
G1 X99.157 Y138.316 E.00187
G1 X98.867 Y138.681 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X99.049 Y138.693 E.00545
G1 F1080
G1 X99.221 Y138.727 E.00523
G1 F600
G1 X99.386 Y138.783 E.00517
G1 X99.466 Y138.822 E.00265
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X98.284 Y138.822 I-.591 J1.193 E.22956
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X98.364 Y138.783 E.00265
G1 X98.529 Y138.727 E.00518
G1 X98.7 Y138.693 E.00521
G1 F960
G1 X98.807 Y138.685 E.00318
; WIPE_START
M204 S10000
G1 X99.049 Y138.693 E-.09214
G1 X99.221 Y138.727 E-.06678
G1 X99.386 Y138.783 E-.06601
G1 X99.466 Y138.822 E-.03384
G1 X99.689 Y138.958 E-.09931
G1 X99.82 Y139.073 E-.06628
G1 X99.937 Y139.205 E-.0669
G1 X100.111 Y139.507 E-.13255
G1 X100.202 Y139.844 E-.13282
G1 X100.202 Y139.853 E-.00336
; WIPE_END
G1 E-.04 F1800
G1 X107.537 Y137.745 Z.8 F30000
G1 X122.33 Y133.495 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X122.211 Y138.039 E.14618
G1 X122.2 Y138.439 E.01286
G1 F1800
G1 X122.195 Y138.631 E.00615
G1 F600.651
G1 X122.195 Y138.631 E0
G1 X122.19 Y138.822 E.00615
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X122.04 Y144.543 E.18403
G1 F600
G1 X95.602 Y144.543 E.85016
G1 X95.602 Y138.822 E.18397
; FEATURE: Inner wall
G1 F1680
M204 S10000
G1 X95.602 Y138.631 E.00615
G1 F3496.519
G1 X95.602 Y138.439 E.00615
G1 F5895.652
G1 X95.602 Y138.039 E.01286
G1 X95.602 Y133.495 E.14612
G1 X122.27 Y133.495 E.85754
; WIPE_START
G1 X122.244 Y135.495 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.862 Y135.022 Z.8 F30000
G1 X160.79 Y133.103 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X160.79 Y138.053 E.14743
G1 X160.79 Y138.453 E.01191
G1 F1763.841
G1 X160.79 Y138.637 E.0055
G1 F600
G1 X160.79 Y138.822 E.0055
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X160.79 Y144.935 E.19658
G1 F600
G1 X95.21 Y144.935 E2.10882
G1 X95.21 Y138.822 E.19658
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1680
G1 X95.21 Y138.637 E.0055
G1 F3421.198
G1 X95.21 Y138.453 E.0055
G1 F6364.704
G1 X95.21 Y138.053 E.01191
G1 X95.21 Y133.103 E.14743
G1 X160.73 Y133.103 E1.95162
; WIPE_START
M204 S10000
G1 X160.754 Y135.103 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.234 Y137.405 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42093
G1 F3000
G1 X152.06 Y137.405 E.24408
G3 X151.715 Y137.783 I-1.718 J-1.222 E.01532
G1 X160.065 Y137.783 E.24932
G1 X160.065 Y138.161 E.01129
G1 X138.126 Y138.161 E.6551
G1 X138.136 Y138.539 E.01129
G1 X160.065 Y138.539 E.6548
G1 X160.065 Y138.917 E.01129
G1 X138.146 Y138.917 E.65451
M73 P37 R14
G1 X138.155 Y139.295 E.01129
G1 X160.065 Y139.295 E.65421
G1 X160.065 Y139.673 E.01129
G1 X138.165 Y139.673 E.65392
G1 X138.175 Y140.051 E.01129
G1 X160.065 Y140.051 E.65362
G1 X160.065 Y140.429 E.01129
G1 X138.185 Y140.429 E.65333
G1 X138.195 Y140.807 E.01129
G1 X160.065 Y140.807 E.65303
G1 X160.065 Y141.185 E.01129
G1 X138.205 Y141.185 E.65274
G1 X138.215 Y141.563 E.01129
G1 X160.065 Y141.563 E.65244
G1 X160.065 Y141.941 E.01129
G1 X138.225 Y141.941 E.65214
G1 X138.235 Y142.319 E.01129
G1 X160.065 Y142.319 E.65185
G1 X160.065 Y142.697 E.01129
G1 X138.245 Y142.697 E.65155
G1 X138.254 Y143.075 E.01129
G1 X160.065 Y143.075 E.65126
G1 X160.065 Y143.453 E.01129
G1 X138.264 Y143.453 E.65096
G1 X138.274 Y143.831 E.01129
G1 X160.065 Y143.831 E.65067
G1 X160.065 Y144.209 E.01129
G1 X138.114 Y144.209 E.65544
G1 X137.766 Y144.646 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22865
G1 F12921.984
G1 X122.234 Y144.646 E.22788
; WIPE_START
G1 X124.234 Y144.646 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.166 J-.349 P1  F30000
G1 X122.064 Y137.405 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42093
G1 F3000
G1 X100.399 Y137.405 E.64691
G3 X99.943 Y137.783 I-1.621 J-1.493 E.01775
G1 X121.884 Y137.783 E.65517
G1 X121.874 Y138.161 E.01129
G1 X99.766 Y138.161 E.66016
G3 X100.285 Y138.516 I-.906 J1.884 E.01885
G1 X100.312 Y138.539 E.00107
G1 X121.864 Y138.539 E.64356
G1 X121.854 Y138.917 E.01129
G1 X100.616 Y138.917 E.63417
G3 X100.805 Y139.295 I-1.911 J1.192 E.01264
G1 X121.845 Y139.295 E.62823
G1 X121.835 Y139.673 E.01129
G1 X100.907 Y139.673 E.6249
G3 X100.937 Y140.051 I-2.519 J.39 E.01133
G1 X121.825 Y140.051 E.62371
G1 X121.815 Y140.429 E.01129
G1 X100.894 Y140.429 E.62469
G3 X100.784 Y140.807 I-1.532 J-.243 E.01179
G1 X121.805 Y140.807 E.6277
G1 X121.795 Y141.185 E.01129
G1 X100.574 Y141.185 E.63366
M73 P38 R14
G3 X100.238 Y141.563 I-1.699 J-1.171 E.01513
G1 X121.785 Y141.563 E.64339
G1 X121.775 Y141.941 E.01129
G1 X95.935 Y141.941 E.77158
G1 X95.935 Y142.319 E.01129
G1 X121.765 Y142.319 E.77129
G1 X121.755 Y142.697 E.01129
G1 X95.935 Y142.697 E.77099
G1 X95.935 Y143.075 E.01129
G1 X121.746 Y143.075 E.7707
G1 X121.736 Y143.453 E.01129
G1 X95.935 Y143.453 E.7704
G1 X95.935 Y143.831 E.01129
G1 X121.726 Y143.831 E.77011
G1 X121.716 Y144.209 E.01129
G1 X95.766 Y144.209 E.77488
; WIPE_START
G1 X97.766 Y144.209 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.971 J-.734 P1  F30000
G1 X95.766 Y141.563 Z.8
G1 Z.4
G1 E.8 F1800
G1 F3000
G1 X97.512 Y141.563 E.05214
G3 X97.176 Y141.185 I1.363 J-1.548 E.01513
G1 X95.935 Y141.185 E.03705
G1 X95.935 Y140.807 E.01129
G1 X96.966 Y140.807 E.03079
G3 X96.856 Y140.429 I1.423 J-.621 E.01179
G1 X95.935 Y140.429 E.02749
G1 X95.935 Y140.051 E.01129
G1 X96.812 Y140.051 E.02618
G3 X96.843 Y139.673 I2.612 J.025 E.01134
G1 X95.935 Y139.673 E.02711
G1 X95.935 Y139.295 E.01129
G1 X96.945 Y139.295 E.03014
G3 X97.134 Y138.917 I2.098 J.813 E.01264
G1 X95.935 Y138.917 E.03579
G1 X95.935 Y138.539 E.01129
G1 X97.438 Y138.539 E.04488
G1 X97.53 Y138.459 E.00364
G3 X97.984 Y138.161 I1.339 J1.549 E.01627
G1 X95.935 Y138.161 E.06119
G1 X95.935 Y137.783 E.01129
G1 X97.807 Y137.783 E.0559
G3 X97.351 Y137.405 I1.164 J-1.87 E.01775
G1 X95.766 Y137.405 E.04734
G1 X96.41 Y136.612 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47944
G1 F5498.03
G1 X96.392 Y136.353 E.00896
; LINE_WIDTH: 0.456229
G1 F5806.792
G1 X96.375 Y136.094 E.00848
G1 X96.405 Y135.498 E.01946
G1 X97.04 Y134.289 F30000
; LINE_WIDTH: 0.475406
G1 F5549.321
G1 X96.396 Y134.289 E.02201
G2 X96.408 Y135.439 I23.496 J.315 E.03928
G1 X96.655 Y134.825 E.02261
G1 X97.005 Y134.338 E.02047
G1 X97.674 Y133.887 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X95.994 Y133.887 E.05002
G1 X95.994 Y137.028 E.09353
G1 X97.013 Y137.028 E.03036
G1 X96.82 Y136.548 E.01541
G1 X96.753 Y136.043 E.01515
G1 X96.819 Y135.493 E.01651
G1 X97.026 Y134.979 E.01652
G1 X97.359 Y134.534 E.01654
G1 X97.636 Y134.317 E.01049
G1 X97.551 Y134.183 E.00473
G1 X97.65 Y133.943 E.00774
G1 X98.192 Y134.198 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406163
G1 F6607.157
G1 X98.335 Y133.959 E.008
; LINE_WIDTH: 0.468577
G1 F5638.346
G1 X98.358 Y133.923 E.00144
G1 X98.585 Y133.901 E.00764
; LINE_WIDTH: 0.436613
G1 F6096.12
G3 X99.137 Y133.899 I.297 J6.14 E.01719
; LINE_WIDTH: 0.468054
G1 F5645.289
G3 X99.392 Y133.923 I-.228 J3.787 E.00858
G1 X99.403 Y133.941 E.00072
; LINE_WIDTH: 0.445606
G1 F5959.98
M73 P39 R14
G1 X99.415 Y133.96 E.00069
; LINE_WIDTH: 0.406002
G1 F6610.088
G1 X99.558 Y134.198 E.00799
G1 X102.525 Y135.457 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54359
G1 F4793.577
G1 X120.255 Y135.457 E.70124
G1 X120.766 Y135.019 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X101.96 Y135.019 E.56016
G1 X102.093 Y135.535 E.01588
G1 X102.113 Y135.896 E.01079
G1 X120.743 Y135.896 E.5549
G1 X120.764 Y135.079 E.02437
G1 X121.153 Y134.641 F30000
G1 F6364.866
G1 X101.384 Y134.641 E.58883
G1 X101.573 Y135.033 E.01296
G1 X101.704 Y135.524 E.01512
G1 X101.74 Y136.27 E.02224
G1 X102.242 Y136.273 E.01497
G1 X121.11 Y136.273 E.562
G1 X121.152 Y134.701 E.04684
G1 X121.54 Y134.264 F30000
G1 F6364.866
G1 X100.634 Y134.264 E.62272
G1 X100.901 Y134.558 E.01182
G1 X101.152 Y134.994 E.01499
G1 X101.34 Y135.621 E.01951
G1 X101.359 Y136.27 E.01933
G1 X101.277 Y136.65 E.0116
G1 X121.478 Y136.65 E.60168
G1 X121.539 Y134.324 E.06931
G1 X121.927 Y133.887 F30000
G1 F6364.866
G1 X100.073 Y133.891 E.65094
G1 X100.199 Y134.185 E.00951
G1 X100.158 Y134.328 E.00443
G1 X100.544 Y134.707 E.01613
G1 X100.826 Y135.182 E.01645
G1 X100.976 Y135.719 E.01658
G1 X100.982 Y136.27 E.01642
G1 X100.845 Y136.808 E.01655
G1 X100.723 Y137.027 E.00747
G1 X121.845 Y137.028 E.62913
G1 X121.926 Y133.947 E.09178
; WIPE_START
G1 X121.873 Y135.947 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.456 Y136.813 Z.8 F30000
G1 X137.946 Y137.783 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42093
G1 F3000
G1 X149.035 Y137.783 E.33111
G3 X148.69 Y137.405 I1.374 J-1.601 E.01532
G1 X137.936 Y137.405 E.3211
G1 X138.073 Y133.887 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419337
G1 F6375.908
G1 X138.155 Y137.028 E.0934
G1 X148.43 Y137.028 E.30553
G1 X148.319 Y136.743 E.00908
G1 X148.254 Y136.243 E.015
G1 X148.319 Y135.694 E.01645
G1 X148.526 Y135.179 E.01651
G1 X148.859 Y134.734 E.01651
G1 X149.293 Y134.393 E.0164
G1 X149.808 Y134.194 E.01643
; LINE_WIDTH: 0.355791
G1 F7670.911
G1 X150.351 Y134.139 E.01348
G1 X150.898 Y134.187 E.01358
; LINE_WIDTH: 0.382175
G1 F7074.324
G1 X151.156 Y134.278 E.00734
; LINE_WIDTH: 0.419415
G1 F6374.596
G1 X151.415 Y134.369 E.00814
G1 X151.856 Y134.7 E.01641
G1 X152.2 Y135.136 E.01653
G1 X152.418 Y135.646 E.01648
G1 X152.497 Y136.194 E.01646
G1 X152.431 Y136.744 E.01648
G1 X152.316 Y137.028 E.0091
G1 X160.006 Y137.028 E.22869
G1 X160.006 Y133.887 E.09339
G1 X151.511 Y133.887 E.25265
G1 X151.007 Y133.868 E.015
; LINE_WIDTH: 0.356077
G1 F7663.9
G2 X149.83 Y133.862 I-.631 J9.032 E.02913
; LINE_WIDTH: 0.382228
G1 F7073.23
G1 X149.535 Y133.875 E.00793
; LINE_WIDTH: 0.419664
G1 F6370.383
G1 X149.239 Y133.887 E.0088
G1 X138.133 Y133.887 E.33052
G1 X138.46 Y134.264 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X138.522 Y136.65 E.07109
G1 X147.927 Y136.65 E.28012
G1 X147.88 Y136.145 E.01511
G1 X147.945 Y135.645 E.01503
G1 X148.178 Y135.034 E.01947
G1 X148.56 Y134.505 E.01944
G1 X148.841 Y134.264 E.01102
G1 X138.52 Y134.264 E.30743
G1 X138.847 Y134.641 F30000
G1 F6364.866
G1 X138.89 Y136.273 E.04862
G1 X147.506 Y136.273 E.25665
G1 X147.571 Y135.596 E.02027
G1 X147.83 Y134.889 E.02242
G1 X147.98 Y134.642 E.00862
G1 X138.907 Y134.641 E.27024
G1 X139.234 Y135.019 F30000
G1 F6364.866
G1 X139.257 Y135.896 E.02615
G1 X147.152 Y135.896 E.23516
G1 X147.287 Y135.212 E.02079
G1 X147.368 Y135.019 E.00623
G1 X139.294 Y135.019 E.24048
G1 X139.685 Y135.457 F30000
; LINE_WIDTH: 0.54358
G1 F4793.673
G1 X146.707 Y135.457 E.27773
G1 X151.909 Y134.264 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X152.19 Y134.505 E.01103
G1 X152.499 Y134.907 E.0151
G1 X152.766 Y135.501 E.01941
G1 X152.871 Y136.144 E.0194
G1 X152.823 Y136.65 E.01516
G1 X159.629 Y136.65 E.2027
G1 X159.629 Y134.264 E.07107
G1 X151.969 Y134.264 E.22816
G1 X152.77 Y134.641 F30000
G1 F6364.866
G1 X152.92 Y134.89 E.00864
G1 X153.114 Y135.357 E.01506
G1 X153.245 Y136.094 E.02231
G1 X153.245 Y136.273 E.00534
G1 X159.252 Y136.273 E.17892
G1 X159.252 Y134.641 E.04861
G1 X152.83 Y134.641 E.19127
G1 X153.382 Y135.019 F30000
G1 F6364.866
G1 X153.549 Y135.522 E.01581
G1 X153.599 Y135.896 E.01123
G1 X158.875 Y135.896 E.15714
G1 X158.875 Y135.019 E.02614
G1 X153.442 Y135.019 E.16181
G1 X153.983 Y135.457 F30000
; LINE_WIDTH: 0.54359
G1 F4793.577
G1 X158.376 Y135.457 E.17373
; WIPE_START
G1 X156.376 Y135.457 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.752 Y135.813 Z.8 F30000
G1 X99.326 Y138.117 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.116078
G1 F15000
G1 X99.159 Y138.06 E.00102
; LINE_WIDTH: 0.143821
G1 X99.13 Y138.045 E.00026
; LINE_WIDTH: 0.183101
G1 X99.099 Y138.018 E.00045
G1 X99.115 Y138.005 E.00023
; LINE_WIDTH: 0.165815
G1 X99.131 Y137.991 E.00021
; LINE_WIDTH: 0.143373
G1 X99.159 Y137.977 E.00025
; LINE_WIDTH: 0.116139
G1 X99.324 Y137.921 E.00101
G1 X99.099 Y138.018 F30000
; LINE_WIDTH: 0.188758
G1 F15000
G1 X98.651 Y138.019 E.00515
; LINE_WIDTH: 0.190944
G1 X98.635 Y138.005 E.00025
; LINE_WIDTH: 0.152376
G1 X98.591 Y137.977 E.00045
; LINE_WIDTH: 0.116088
G1 X98.426 Y137.921 E.00101
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X98.591 Y137.977 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/41
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.678 Y118.983
G1 Z.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X97.8 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X99.58 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X100.458 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X101.289 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X102.174 Y118.106 E.02635
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X102.938 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X103.815 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X103.626 Y116.352 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X102.919 Y116.352 E.02106
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X101.626 Y116.352 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X100.788 Y116.352 E.02498
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X99.424 Y117.229 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X98.53 Y117.229 E.02663
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X102.835 Y112.844 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X103.722 Y112.844 E.02642
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X104.672 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X103.922 Y114.598 E.02233
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X102.881 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X102.192 Y114.598 E.02055
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X100.661 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X99.8 Y114.598 E.02565
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X98.81 Y115.475 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X97.989 Y115.475 E.02444
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X97.423 Y116.352 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X96.717 Y116.352 E.02102
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X95.619 Y117.229 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X94.758 Y117.229 E.02563
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X94.786 Y113.721 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X95.605 Y113.721 E.02439
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X96.95 Y113.721 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X97.808 Y113.721 E.02554
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X96.905 Y111.967 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X96.145 Y111.967 E.02265
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X95.161 Y109.336 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X96.036 Y109.336 E.02606
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X96.675 Y110.213 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X97.491 Y110.213 E.02432
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X97.203 Y108.459 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X98.029 Y108.459 E.0246
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X99.665 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X100.492 Y107.582 E.02463
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X101.148 Y108.459 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X102.023 Y108.459 E.02605
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X102.618 Y109.336 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X103.502 Y109.336 E.02634
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X103.382 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X104.21 Y107.582 E.02468
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X105.794 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X106.997 Y107.582 E.03585
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X114.519 Y108.879 Z1 F30000
G1 X152.764 Y115.475 Z1
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X153.619 Y115.475 E.02547
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X153.52 Y113.721 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X154.667 Y113.721 E.03418
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X155.82 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X156.509 Y114.598 E.02055
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X157.622 Y115.475 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X158.908 Y115.475 E.0383
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X160.094 Y115.475 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X160.851 Y115.475 E.02254
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X160.403 Y117.229 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X161.22 Y117.229 E.02434
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X161.142 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X160.265 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X159.464 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X158.766 Y118.106 E.02079
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X158.04 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X157.162 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X157.69 Y117.229 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X156.572 Y117.229 E.03329
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X155.689 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X154.85 Y118.106 E.02498
G1 X154.844 Y118.983 F30000
G1 F4800
G1 X153.315 Y118.983 E.04553
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X153.247 Y117.229 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X154.085 Y117.229 E.02497
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X151.325 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X150.431 Y118.983 E.02662
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X148.584 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X147.729 Y118.983 E.02547
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X147.04 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X146.224 Y118.106 E.02431
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X145.499 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X144.622 Y118.983 E.02614
G1 X143.638 Y118.983 F30000
G1 F4800
G1 X142.792 Y118.983 E.02518
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X142.092 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X141.289 Y118.106 E.02393
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X140.572 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X139.694 Y118.983 E.02614
G1 X138.704 Y118.983 F30000
G1 F4800
G1 X137.877 Y118.983 E.02464
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X137.135 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X136.397 Y118.106 E.02199
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X135.673 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X134.796 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X133.776 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X133.025 Y118.983 E.02236
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X130.84 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
M73 P39 R13
G1 F4800
G1 X129.962 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X126.156 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X125.278 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X124.529 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X123.633 Y118.106 E.02669
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X122.819 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X121.941 Y118.983 E.02614
G1 X121.039 Y118.983 F30000
G1 F4800
G1 X120.161 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X112.721 Y117.28 Z1 F30000
G1 X112.498 Y117.229 Z1
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X113.207 Y117.229 E.0211
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X116.327 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X115.467 Y118.983 E.02562
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X114.797 Y118.106 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X113.985 Y118.106 E.02419
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X113.264 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X112.386 Y118.983 E.02614
G1 X111.435 Y118.983 F30000
G1 F4800
G1 X110.62 Y118.983 E.02427
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X108.45 Y118.983 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
M73 P40 R13
G1 X107.572 Y118.983 E.02614
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X107.548 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X108.369 Y114.598 E.02446
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X109.87 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X110.754 Y114.598 E.02632
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X112.176 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X113.019 Y114.598 E.02511
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X113.765 Y115.475 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X114.598 Y115.475 E.02482
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X115.328 Y116.352 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X116.112 Y116.352 E.02336
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X115.378 Y114.598 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X116.239 Y114.598 E.02567
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X116.164 Y112.844 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X115.262 Y112.844 E.02688
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X115.095 Y111.09 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X114.384 Y111.09 E.02118
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X113.406 Y111.967 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X112.536 Y111.967 E.02592
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X111.02 Y111.967 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X110.213 Y111.967 E.02404
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X109.664 Y112.844 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X108.911 Y112.844 E.02241
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X107.406 Y112.844 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X106.533 Y112.844 E.02599
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X107.128 Y111.09 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X106.406 Y111.09 E.02149
G3 X106.783 Y110.213 I.961 J-.107 E.02974
G1 X107.251 Y110.213 E.01395
G1 X107.681 Y109.336 F30000
G1 F4800
G1 X108.569 Y109.336 E.02643
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X109.185 Y110.213 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X110.071 Y110.213 E.02639
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X111.546 Y110.213 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X112.347 Y110.213 E.02386
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X112.269 Y108.459 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X113.16 Y108.459 E.02655
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X115.43 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X116.493 Y107.582 E.03166
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X119.207 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X120.079 Y107.582 E.02597
G1 X120.987 Y107.582 F30000
G1 F4800
G1 X121.859 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X126.405 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X127.277 Y107.582 E.02597
G1 X128.185 Y107.582 F30000
G1 F4800
G1 X129.057 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X131.753 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X132.644 Y107.582 E.02654
G1 X133.602 Y107.582 F30000
G1 F4800
G1 X134.474 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X135.482 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X136.354 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X139.019 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X139.891 Y107.582 E.02597
G1 X140.799 Y107.582 F30000
G1 F4800
G1 X141.671 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X146.223 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X147.095 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X148.103 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X148.975 Y107.582 E.02597
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X151.721 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X152.563 Y107.582 E.0251
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X153.143 Y108.459 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X154.049 Y108.459 E.027
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X153.74 Y110.213 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X154.562 Y110.213 E.02448
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X154.713 Y111.967 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X155.792 Y111.967 E.03216
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X156.352 Y111.09 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X157.337 Y111.09 E.02934
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X158.017 Y110.213 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X158.856 Y110.213 E.02499
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X161.037 Y111.09 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X160.28 Y111.09 E.02255
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X159.351 Y111.967 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X158.514 Y111.967 E.02492
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X158.74 Y113.721 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X157.957 Y113.721 E.02331
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X156.8 Y108.459 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X157.802 Y108.459 E.02986
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X158.332 Y107.582 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X159.413 Y107.582 E.03218
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X154.409 Y113.345 Z1 F30000
G1 X136.976 Y133.427 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6364.704
M204 S5000
G1 X136.978 Y133.472 E.00133
G1 F3591.595
G1 X136.982 Y133.656 E.0055
G1 F1800
G1 X136.987 Y133.84 E.0055
G1 F720
G1 X137.257 Y144.132 E.30665
G1 F1800
G1 X137.262 Y144.316 E.0055
G1 F2114.637
G1 X137.263 Y144.354 E.00112
G1 F6364.704
G1 X136.863 Y144.354 E.01191
G1 X122.737 Y144.354 E.42075
G1 X122.738 Y144.316 E.00112
G1 F3591.595
G1 X122.743 Y144.132 E.0055
G1 F1800
G1 X122.748 Y143.947 E.0055
G1 F720
G1 X123.018 Y133.656 E.30665
G1 F1800
G1 X123.022 Y133.472 E.0055
G1 F2175.911
G1 X123.024 Y133.427 E.00133
G1 F6364.704
G1 X123.424 Y133.427 E.01191
G1 X136.916 Y133.427 E.4019
; WIPE_START
M204 S10000
G1 X136.978 Y133.472 E-.02874
G1 X136.982 Y133.656 E-.07011
G1 X136.987 Y133.84 E-.07011
G1 X137.028 Y135.395 E-.59104
; WIPE_END
G1 E-.04 F1800
G1 X129.41 Y135.864 Z1 F30000
G1 X98.853 Y137.744 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.649 Y137.728 E.00657
G3 X98.65 Y134.299 I.22 J-1.715 E.16048
G1 X98.866 Y134.285 E.00696
G3 X98.913 Y137.742 I.003 J1.729 E.17332
G1 X98.85 Y137.349 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.529 Y137.306 E.00965
G3 X98.701 Y134.688 I.341 J-1.292 E.10971
G1 X98.867 Y134.678 E.00497
G3 X98.91 Y137.349 I.003 J1.336 E.12392
; WIPE_START
M204 S10000
G1 X98.529 Y137.306 E-.14573
G1 X98.364 Y137.251 E-.06617
G1 X98.206 Y137.174 E-.06678
G1 X97.93 Y136.961 E-.13235
G1 X97.813 Y136.829 E-.06705
G1 X97.639 Y136.527 E-.13258
G1 X97.548 Y136.19 E-.13252
G1 X97.545 Y136.146 E-.01683
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J-.007 P1  F30000
G1 X97.517 Y141.087 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.5 Y141.07 E.00078
G3 X98.648 Y138.3 I1.369 J-1.056 E.11671
G1 X98.856 Y138.286 E.00669
G3 X97.651 Y141.241 I.014 J1.729 E.21852
G1 X97.557 Y141.133 E.00463
G1 X97.788 Y140.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.714 Y140.686 E.00386
G3 X98.7 Y138.689 I1.155 J-.671 E.07839
G1 X98.858 Y138.678 E.00472
G3 X97.821 Y140.842 I.012 J1.336 E.1613
; WIPE_START
M204 S10000
G1 X97.714 Y140.686 E-.07198
G1 X97.639 Y140.527 E-.06676
G1 X97.55 Y140.197 E-.13016
G1 X97.536 Y140.016 E-.06894
G1 X97.583 Y139.669 E-.13285
G1 X97.639 Y139.503 E-.06654
G1 X97.813 Y139.201 E-.13256
G1 X97.981 Y139.033 E-.09021
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.267 J1.187 P1  F30000
G1 X122.63 Y133.492 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X122.34 Y144.539 E.35537
G1 X95.602 Y144.539 E.8598
G1 X95.602 Y133.492 E.35525
G1 X122.57 Y133.492 E.86718
; WIPE_START
G1 X122.528 Y135.491 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.156 Y135.229 Z1 F30000
G1 X149.902 Y134.551 Z1
G1 Z.6
G1 E.8 F1800
G1 F5895.652
G1 X149.926 Y134.543 E.00081
G3 X150.15 Y134.499 I.443 J1.671 E.00736
G1 X150.366 Y134.485 E.00696
G3 X149.712 Y134.615 I.003 J1.729 E.32768
G1 X149.845 Y134.57 E.00452
G1 X150.028 Y134.922 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.201 Y134.888 I.342 J1.292 E.00524
G1 X150.367 Y134.878 E.00497
G3 X149.971 Y134.939 I.002 J1.336 E.23807
; WIPE_START
M204 S10000
G1 X150.201 Y134.888 E-.08951
G1 X150.367 Y134.878 E-.06342
G1 X150.549 Y134.888 E-.06898
G1 X150.722 Y134.922 E-.0671
G1 X150.887 Y134.979 E-.06627
G1 X151.044 Y135.056 E-.06661
G1 X151.32 Y135.269 E-.13239
G1 X151.437 Y135.401 E-.067
G1 X151.611 Y135.703 E-.13239
G1 X151.616 Y135.719 E-.00632
; WIPE_END
G1 E-.04 F1800
G1 X149.97 Y133.492 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.42 Y133.492 E.11095
G1 X153.42 Y143.968 E.33687
G1 X160.398 Y143.968 E.22438
G1 X160.398 Y144.539 E.01838
G1 X137.66 Y144.539 E.73118
G1 X137.37 Y133.492 E.35537
G1 X149.91 Y133.492 E.40322
; WIPE_START
G1 X151.91 Y133.492 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.535 Y133.155 Z1 F30000
G1 X160.79 Y133.1 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X160.79 Y144.931 E.35243
G1 X95.21 Y144.931 E1.9534
G1 X95.21 Y133.1 E.35243
G1 X160.73 Y133.1 E1.95162
M204 S10000
G1 X160.103 Y133.307 F30000
; FEATURE: Top surface
G1 F6364.704
M204 S2000
G1 X160.583 Y133.786 E.02018
G1 X160.583 Y134.319
G1 X159.57 Y133.307 E.04265
G1 X159.037 Y133.307
G1 X160.583 Y134.853 E.06511
G1 X160.583 Y135.386
G1 X158.504 Y133.307 E.08757
G1 X157.97 Y133.307
G1 X160.583 Y135.919 E.11004
G1 X160.583 Y136.452
G1 X157.437 Y133.307 E.1325
G1 X156.904 Y133.307
G1 X160.583 Y136.986 E.15496
G1 X160.583 Y137.519
G1 X156.371 Y133.307 E.17743
G1 X155.837 Y133.307
G1 X160.583 Y138.052 E.19989
G1 X160.583 Y138.586
G1 X155.304 Y133.307 E.22235
G1 X154.771 Y133.307
G1 X160.583 Y139.119 E.24482
G1 X160.583 Y139.652
G1 X154.238 Y133.307 E.26728
G1 X153.704 Y133.307
G1 X160.583 Y140.185 E.28974
G1 X160.583 Y140.719
G1 X153.643 Y133.779 E.29234
G1 X153.643 Y134.312
G1 X160.583 Y141.252 E.29234
G1 X160.583 Y141.785
G1 X153.643 Y134.845 E.29234
G1 X153.643 Y135.378
G1 X160.583 Y142.318 E.29234
G1 X160.583 Y142.852
G1 X153.643 Y135.912 E.29234
G1 X153.643 Y136.445
G1 X160.583 Y143.385 E.29234
G1 X160.41 Y143.745
G1 X153.643 Y136.978 E.28506
G1 X153.643 Y137.511
G1 X159.877 Y143.745 E.2626
G1 X159.343 Y143.745
G1 X153.643 Y138.045 E.24013
G1 X153.643 Y138.578
G1 X158.81 Y143.745 E.21767
G1 X158.277 Y143.745
G1 X153.643 Y139.111 E.19521
G1 X153.643 Y139.644
M73 P41 R13
G1 X157.744 Y143.745 E.17275
G1 X157.21 Y143.745
G1 X153.643 Y140.178 E.15028
G1 X153.643 Y140.711
G1 X156.677 Y143.745 E.12782
G1 X156.144 Y143.745
G1 X153.643 Y141.244 E.10536
G1 X153.643 Y141.778
G1 X155.611 Y143.745 E.08289
G1 X155.077 Y143.745
G1 X153.643 Y142.311 E.06043
G1 X153.643 Y142.844
G1 X154.544 Y143.745 E.03797
G1 X154.011 Y143.745
G1 X153.643 Y143.377 E.0155
M204 S10000
G1 X153.217 Y144.254 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.20746
G1 F14586.119
G1 X160.194 Y144.254 E.09069
; WIPE_START
G1 X158.194 Y144.254 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.417 J-1.143 P1  F30000
G1 X153.257 Y142.451 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42148
G1 F6339.814
G1 X144.631 Y133.825 E.3648
G1 X144.095 Y133.825 E.01601
G1 X153.087 Y142.817 E.38027
G1 X153.087 Y143.352 E.01601
G1 X143.56 Y133.825 E.40291
G1 X143.024 Y133.825 E.01601
G1 X153.016 Y143.817 E.42255
G1 X152.884 Y143.817 E.00396
G1 X152.884 Y144.206 E.01165
G1 X152.87 Y144.206 E.0004
G1 X142.489 Y133.825 E.43903
G1 X141.954 Y133.825 E.01601
G1 X152.335 Y144.206 E.43903
G1 X151.8 Y144.206 E.01601
G1 X141.418 Y133.825 E.43903
G1 X140.883 Y133.825 E.01601
G1 X151.264 Y144.206 E.43903
G1 X150.729 Y144.206 E.01601
G1 X140.348 Y133.825 E.43903
G1 X139.812 Y133.825 E.01601
G1 X150.194 Y144.206 E.43903
G1 X149.658 Y144.206 E.01601
G1 X139.277 Y133.825 E.43903
G1 X138.742 Y133.825 E.01601
G1 X149.123 Y144.206 E.43903
G1 X148.587 Y144.206 E.01601
G1 X138.206 Y133.825 E.43903
G1 X137.712 Y133.825 E.01477
G1 X137.713 Y133.868 E.00127
G1 X148.052 Y144.206 E.43722
G1 X147.517 Y144.206 E.01601
G1 X137.728 Y134.417 E.41397
G1 X137.742 Y134.967 E.01645
G1 X146.981 Y144.206 E.39072
G1 X146.446 Y144.206 E.01601
G1 X137.757 Y135.517 E.36747
G1 X137.771 Y136.067 E.01645
G1 X145.911 Y144.206 E.34422
G1 X145.375 Y144.206 E.01601
G1 X137.785 Y136.616 E.32097
G1 X137.8 Y137.166 E.01645
G1 X144.84 Y144.206 E.29773
G1 X144.305 Y144.206 E.01601
G1 X137.814 Y137.716 E.27448
G1 X137.829 Y138.266 E.01645
G1 X143.769 Y144.206 E.25123
G1 X143.234 Y144.206 E.01601
G1 X137.843 Y138.815 E.22798
G1 X137.857 Y139.365 E.01645
G1 X142.698 Y144.206 E.20473
G1 X142.163 Y144.206 E.01601
G1 X137.872 Y139.915 E.18148
G1 X137.886 Y140.465 E.01645
G1 X141.628 Y144.206 E.15823
G1 X141.092 Y144.206 E.01601
G1 X137.901 Y141.015 E.13498
G1 X137.915 Y141.564 E.01645
G1 X140.557 Y144.206 E.11173
G1 X140.022 Y144.206 E.01601
G1 X137.929 Y142.114 E.08848
G1 X137.944 Y142.664 E.01645
G1 X139.486 Y144.206 E.06523
G1 X138.951 Y144.206 E.01601
G1 X137.958 Y143.214 E.04198
G1 X137.973 Y143.763 E.01645
G1 X138.585 Y144.376 E.02591
G1 X137.466 Y144.643 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22863
G1 F12923.375
G1 X122.534 Y144.643 E.21906
G1 X122.442 Y134.401 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42165
G1 F6336.968
G1 X121.866 Y133.825 E.02437
G1 X121.331 Y133.825 E.01602
G1 X122.263 Y134.758 E.03946
G1 X122.25 Y135.279 E.01562
G1 X120.795 Y133.825 E.06154
G1 X120.259 Y133.825 E.01602
G1 X122.236 Y135.801 E.08362
G1 X122.222 Y136.323 E.01562
G1 X119.724 Y133.825 E.1057
G1 X119.188 Y133.825 E.01602
G1 X122.209 Y136.845 E.12779
G1 X122.195 Y137.367 E.01562
G1 X118.653 Y133.825 E.14987
G1 X118.117 Y133.825 E.01602
G1 X122.181 Y137.889 E.17195
G1 X122.168 Y138.411 E.01562
G1 X117.581 Y133.825 E.19403
G1 X117.046 Y133.825 E.01602
G1 X122.154 Y138.933 E.21612
G1 X122.14 Y139.455 E.01562
G1 X116.51 Y133.825 E.2382
G1 X115.975 Y133.825 E.01602
G1 X122.127 Y139.977 E.26028
G1 X122.113 Y140.499 E.01562
G1 X115.439 Y133.825 E.28236
G1 X114.903 Y133.825 E.01602
G1 X122.099 Y141.021 E.30445
G1 X122.086 Y141.543 E.01562
G1 X114.368 Y133.825 E.32653
G1 X113.832 Y133.825 E.01602
G1 X122.072 Y142.065 E.34861
G1 X122.058 Y142.586 E.01562
G1 X113.297 Y133.825 E.37069
G1 X112.761 Y133.825 E.01602
G1 X122.044 Y143.108 E.39277
G1 X122.031 Y143.63 E.01562
G1 X112.225 Y133.825 E.41486
G1 X111.69 Y133.825 E.01602
G1 X122.017 Y144.152 E.43694
G1 X122.016 Y144.206 E.00161
G1 X121.536 Y144.206 E.01437
G1 X111.154 Y133.825 E.43922
G1 X110.619 Y133.825 E.01602
G1 X121 Y144.206 E.43922
G1 X120.464 Y144.206 E.01602
G1 X110.083 Y133.825 E.43922
G1 X109.547 Y133.825 E.01602
G1 X119.929 Y144.206 E.43922
G1 X119.393 Y144.206 E.01602
G1 X109.012 Y133.825 E.43922
G1 X108.476 Y133.825 E.01602
G1 X118.857 Y144.206 E.43922
G1 X118.322 Y144.206 E.01602
G1 X107.941 Y133.825 E.43922
G1 X107.405 Y133.825 E.01602
G1 X117.786 Y144.206 E.43922
G1 X117.251 Y144.206 E.01602
G1 X106.869 Y133.825 E.43922
G1 X106.334 Y133.825 E.01602
G1 X116.715 Y144.206 E.43922
G1 X116.179 Y144.206 E.01602
G1 X105.798 Y133.825 E.43922
G1 X105.263 Y133.825 E.01602
G1 X115.644 Y144.206 E.43922
G1 X115.108 Y144.206 E.01602
G1 X104.727 Y133.825 E.43922
G1 X104.191 Y133.825 E.01602
G1 X114.573 Y144.206 E.43922
G1 X114.037 Y144.206 E.01602
G1 X103.656 Y133.825 E.43922
G1 X103.12 Y133.825 E.01602
G1 X113.501 Y144.206 E.43922
G1 X112.966 Y144.206 E.01602
G1 X102.584 Y133.825 E.43922
G1 X102.049 Y133.825 E.01602
G1 X112.43 Y144.206 E.43922
G1 X111.895 Y144.206 E.01602
G1 X101.513 Y133.825 E.43922
G1 X100.978 Y133.825 E.01602
G1 X111.359 Y144.206 E.43922
G1 X110.823 Y144.206 E.01602
G1 X100.442 Y133.825 E.43922
G1 X100.006 Y133.825 E.01305
G1 X100.06 Y133.909 E.00301
G1 X100.045 Y133.963 E.00168
G1 X110.288 Y144.206 E.43336
G1 X109.752 Y144.206 E.01602
G1 X100.789 Y135.243 E.37921
G3 X100.933 Y135.923 I-2.038 J.787 E.02087
G1 X109.217 Y144.206 E.35046
G1 X108.681 Y144.206 E.01602
G1 X100.895 Y136.42 E.32942
G3 X100.77 Y136.831 I-2.443 J-.519 E.01286
G1 X108.145 Y144.206 E.31204
G1 X107.61 Y144.206 E.01602
G1 X100.578 Y137.175 E.2975
G3 X100.338 Y137.47 I-1.177 J-.709 E.01143
G1 X107.074 Y144.206 E.28498
G1 X106.539 Y144.206 E.01602
G1 X100.044 Y137.712 E.27478
G3 X99.757 Y137.877 I-.742 J-.956 E.00993
G1 X99.736 Y137.939 E.00198
G1 X106.003 Y144.206 E.26515
G1 X105.467 Y144.206 E.01602
G1 X100.901 Y139.64 E.19319
G3 X100.928 Y140.202 I-2.096 J.38 E.01688
G1 X104.932 Y144.206 E.16941
G1 X104.396 Y144.206 E.01602
G1 X100.837 Y140.647 E.1506
G3 X100.676 Y141.021 I-1.441 J-.397 E.01224
G1 X103.861 Y144.206 E.13475
G1 X103.325 Y144.206 E.01602
G1 X100.456 Y141.338 E.12137
G3 X100.187 Y141.604 I-1.198 J-.938 E.01136
G1 X102.789 Y144.206 E.11008
G1 X102.254 Y144.206 E.01602
G1 X99.869 Y141.822 E.10088
G3 X99.493 Y141.981 I-.808 J-1.384 E.01226
G1 X101.718 Y144.206 E.09413
G1 X101.183 Y144.206 E.01602
G1 X99.045 Y142.069 E.09042
G3 X98.478 Y142.037 I-.167 J-2.09 E.01705
G1 X100.647 Y144.206 E.09177
G1 X100.111 Y144.206 E.01602
G1 X95.935 Y140.03 E.17669
G1 X95.935 Y139.495 E.01602
G1 X96.853 Y140.413 E.03884
G3 X96.821 Y139.845 I2.058 J-.401 E.01706
G1 X95.935 Y138.959 E.03748
G1 X95.935 Y138.423 E.01602
G1 X96.909 Y139.397 E.0412
G3 X97.069 Y139.021 I1.43 J.386 E.01226
G1 X95.935 Y137.888 E.04796
G1 X95.935 Y137.352 E.01602
G1 X97.286 Y138.702 E.05713
G3 X97.553 Y138.435 I1.198 J.929 E.01136
G1 X95.935 Y136.817 E.06846
G1 X95.935 Y136.281 E.01602
M73 P42 R13
G1 X97.869 Y138.214 E.0818
G1 X97.995 Y138.152 E.00422
G1 X98.075 Y137.917 E.00743
G3 X96.953 Y136.763 I.825 J-1.924 E.04941
G1 X95.935 Y135.745 E.04306
G1 X95.935 Y135.21 E.01602
G1 X96.815 Y136.089 E.03721
G3 X96.858 Y135.596 I2.136 J-.062 E.01483
G1 X95.935 Y134.674 E.03902
G1 X95.935 Y134.139 E.01602
G1 X96.985 Y135.188 E.04441
G3 X97.178 Y134.846 I1.507 J.625 E.01179
G1 X96.157 Y133.825 E.04319
G1 X96.693 Y133.825 E.01602
G1 X97.419 Y134.551 E.03074
G3 X97.716 Y134.312 I1.088 J1.044 E.01142
G1 X97.059 Y133.655 E.02779
G1 X98.192 Y134.195 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406129
G1 F6607.781
G1 X98.335 Y133.956 E.008
; LINE_WIDTH: 0.468607
G1 F5637.953
G1 X98.359 Y133.92 E.00145
G1 X98.585 Y133.898 E.00764
; LINE_WIDTH: 0.436703
G1 F6094.732
G3 X99.136 Y133.896 I.298 J6.17 E.01714
; LINE_WIDTH: 0.467929
G1 F5646.942
G3 X99.391 Y133.92 I-.224 J3.755 E.00863
G1 X99.403 Y133.938 E.00072
; LINE_WIDTH: 0.445734
G1 F5958.089
G1 X99.415 Y133.956 E.00068
; LINE_WIDTH: 0.406117
G1 F6607.997
G1 X99.558 Y134.195 E.008
; WIPE_START
G1 X99.415 Y133.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.426 Y137.918 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.116092
G1 F15000
G1 X98.591 Y137.974 E.00101
; LINE_WIDTH: 0.152332
G1 X98.635 Y138.001 E.00045
; LINE_WIDTH: 0.190879
G1 X98.652 Y138.015 E.00025
; LINE_WIDTH: 0.189068
G1 X99.099 Y138.015 E.00516
G1 X99.324 Y137.918 F30000
; LINE_WIDTH: 0.119038
G1 F15000
G2 X99.138 Y137.983 I.182 J.815 E.00119
; LINE_WIDTH: 0.149802
G1 X99.131 Y137.987 E.00006
; LINE_WIDTH: 0.165472
G1 X99.115 Y138.001 E.00021
; LINE_WIDTH: 0.184197
G1 X99.099 Y138.015 E.00024
G1 X99.127 Y138.039 E.00042
; LINE_WIDTH: 0.145161
G1 X99.159 Y138.057 E.00029
; LINE_WIDTH: 0.116069
G1 X99.326 Y138.113 E.00102
; WIPE_START
G1 X99.159 Y138.057 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.212 J.113 P1  F30000
G1 X99.745 Y144.376 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42165
G1 F6336.968
G1 X95.935 Y140.566 E.1612
G1 X95.935 Y141.101 E.01602
G1 X99.04 Y144.206 E.13136
G1 X98.504 Y144.206 E.01602
G1 X95.935 Y141.637 E.1087
G1 X95.935 Y142.173 E.01602
G1 X97.969 Y144.206 E.08604
G1 X97.433 Y144.206 E.01602
G1 X95.935 Y142.708 E.06338
G1 X95.935 Y143.244 E.01602
G1 X96.898 Y144.206 E.04072
G1 X96.362 Y144.206 E.01602
G1 X95.766 Y143.61 E.02524
; WIPE_START
G1 X96.362 Y144.206 E-.32058
G1 X96.898 Y144.206 E-.20353
G1 X96.459 Y143.767 E-.2359
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.224 J1.196 P1  F30000
G1 X150.35 Y133.655 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.42148
G1 F6339.814
G1 X150.917 Y134.223 E.024
G2 X150.314 Y134.154 I-.476 J1.508 E.01828
G1 X149.984 Y133.825 E.01394
G1 X149.449 Y133.825 E.01601
G1 X149.844 Y134.22 E.01669
G2 X149.459 Y134.37 I.925 J2.936 E.01237
G1 X148.913 Y133.825 E.02305
G1 X148.378 Y133.825 E.01601
G1 X149.126 Y134.573 E.03162
G2 X148.849 Y134.831 I1.864 J2.277 E.01134
G1 X147.843 Y133.825 E.04254
G1 X147.307 Y133.825 E.01601
G1 X148.619 Y135.136 E.05545
G2 X148.443 Y135.496 I2.004 J1.201 E.01199
G1 X146.772 Y133.825 E.07067
G1 X146.237 Y133.825 E.01601
G1 X148.333 Y135.921 E.08864
G2 X148.325 Y136.449 I2.618 J.3 E.01582
G1 X145.701 Y133.825 E.11097
G1 X145.166 Y133.825 E.01601
G1 X153.087 Y141.746 E.33499
G1 X153.087 Y141.211 E.01601
G1 X150.14 Y138.264 E.12463
G2 X150.668 Y138.257 I.231 J-2.496 E.01583
G1 X153.087 Y140.675 E.10228
G1 X153.087 Y140.14 E.01601
G1 X151.093 Y138.146 E.08431
G2 X151.454 Y137.972 I-.846 J-2.209 E.012
G1 X153.087 Y139.605 E.06905
G1 X153.087 Y139.069 E.01601
G1 X151.759 Y137.741 E.05616
G2 X152.018 Y137.465 I-2.133 J-2.263 E.01133
G1 X153.087 Y138.534 E.0452
G1 X153.087 Y137.999 E.01601
G1 X152.22 Y137.132 E.03667
G2 X152.369 Y136.749 I-1.308 J-.73 E.01232
G1 X153.087 Y137.463 E.03028
G1 X153.087 Y136.928 E.01601
G1 X152.436 Y136.277 E.02753
G2 X152.366 Y135.672 I-1.5 J-.133 E.01835
G1 X153.087 Y136.392 E.03049
G1 X153.087 Y135.857 E.01601
G1 X151.055 Y133.825 E.08594
G1 X151.59 Y133.825 E.01601
G1 X153.087 Y135.322 E.0633
G1 X153.087 Y134.786 E.01601
G1 X152.126 Y133.825 E.04066
G1 X152.661 Y133.825 E.01601
G1 X153.257 Y134.421 E.02519
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6339.814
G1 X152.661 Y133.825 E-.32015
G1 X152.126 Y133.825 E-.20344
G1 X152.566 Y134.265 E-.23641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/41
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S160.65
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X152.558 Y119.085
G1 Z.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X152.558 Y117.545 E.04587
G1 X151.681 Y117.545 E.02612
G1 X151.681 Y118.915 E.04081
G1 X150.804 Y118.915 E.02612
G1 X150.804 Y117.545 E.04081
G1 X149.927 Y117.545 E.02612
G1 X149.927 Y118.915 E.04081
G1 X149.05 Y118.915 E.02612
G1 X149.05 Y117.545 E.04081
G1 X148.173 Y117.545 E.02612
G1 X148.173 Y118.915 E.04081
G1 X147.296 Y118.915 E.02612
G1 X147.296 Y117.545 E.04081
G1 X146.418 Y117.545 E.02612
G1 X146.418 Y118.915 E.04081
G1 X145.541 Y118.915 E.02612
G1 X145.541 Y117.545 E.04081
G1 X144.664 Y117.545 E.02612
G1 X144.664 Y118.915 E.04081
G1 X143.787 Y118.915 E.02612
G1 X143.787 Y117.545 E.04081
G1 X142.91 Y117.545 E.02612
G1 X142.91 Y118.915 E.04081
G1 X142.033 Y118.915 E.02612
G1 X142.033 Y117.545 E.04081
G1 X141.156 Y117.545 E.02612
G1 X141.156 Y118.915 E.04081
G1 X140.279 Y118.915 E.02612
G1 X140.279 Y117.545 E.04081
G1 X139.402 Y117.545 E.02612
G1 X139.402 Y118.915 E.04081
G1 X138.525 Y118.915 E.02612
G1 X138.525 Y117.545 E.04081
G1 X137.648 Y117.545 E.02612
G1 X137.648 Y118.915 E.04081
G1 X136.771 Y118.915 E.02612
G1 X136.771 Y117.545 E.04081
G1 X135.894 Y117.545 E.02612
G1 X135.894 Y118.915 E.04081
G1 X135.017 Y118.915 E.02612
G1 X135.017 Y117.545 E.04081
G1 X134.139 Y117.545 E.02612
G1 X134.139 Y118.915 E.04081
G1 X133.262 Y118.915 E.02612
G1 X133.262 Y117.545 E.04081
G1 X132.385 Y117.545 E.02612
G1 X132.385 Y118.915 E.04081
G1 X131.508 Y118.915 E.02612
G1 X131.508 Y117.545 E.04081
G1 X130.631 Y117.545 E.02612
G1 X130.631 Y118.915 E.04081
G1 X129.754 Y118.915 E.02612
G1 X129.754 Y117.545 E.04081
G1 X128.877 Y117.545 E.02612
G1 X128.877 Y118.915 E.04081
G1 X128 Y118.915 E.02612
G1 X128 Y117.545 E.04081
G1 X127.123 Y117.545 E.02612
G1 X127.123 Y118.915 E.04081
G1 X126.246 Y118.915 E.02612
G1 X126.246 Y117.545 E.04081
G1 X125.369 Y117.545 E.02612
G1 X125.369 Y118.915 E.04081
G1 X124.492 Y118.915 E.02612
G1 X124.492 Y117.545 E.04081
G1 X123.615 Y117.545 E.02612
G1 X123.615 Y118.915 E.04081
G1 X122.738 Y118.915 E.02612
G1 X122.738 Y117.545 E.04081
G1 X121.861 Y117.545 E.02612
G1 X121.861 Y118.915 E.04081
G1 X120.983 Y118.915 E.02612
G1 X120.983 Y117.545 E.04081
G1 X120.106 Y117.545 E.02612
G1 X120.106 Y118.915 E.04081
G1 X119.229 Y118.915 E.02612
G1 X119.229 Y117.545 E.04081
G1 X118.352 Y117.545 E.02612
G1 X118.352 Y118.915 E.04081
G1 X117.475 Y118.915 E.02612
G1 X117.475 Y117.545 E.04081
G1 X116.598 Y117.545 E.02612
G1 X116.598 Y118.915 E.04081
G1 X115.721 Y118.915 E.02612
G1 X115.721 Y107.042 E.35366
G1 X116.598 Y107.042 E.02612
G1 X116.598 Y107.662 E.01847
G1 X117.475 Y107.662 E.02612
G1 X117.475 Y107.042 E.01847
G1 X118.352 Y107.042 E.02612
G1 X118.352 Y107.662 E.01847
G1 X119.229 Y107.662 E.02612
G1 X119.229 Y107.042 E.01847
G1 X120.106 Y107.042 E.02612
G1 X120.106 Y107.662 E.01847
G1 X120.983 Y107.662 E.02612
G1 X120.983 Y107.042 E.01847
G1 X121.861 Y107.042 E.02612
G1 X121.861 Y107.662 E.01847
G1 X122.738 Y107.662 E.02612
G1 X122.738 Y107.042 E.01847
G1 X123.615 Y107.042 E.02612
G1 X123.615 Y107.662 E.01847
G1 X124.492 Y107.662 E.02612
G1 X124.492 Y107.042 E.01847
G1 X125.369 Y107.042 E.02612
G1 X125.369 Y107.662 E.01847
G1 X126.246 Y107.662 E.02612
G1 X126.246 Y107.042 E.01847
G1 X127.123 Y107.042 E.02612
G1 X127.123 Y107.662 E.01847
G1 X128 Y107.662 E.02612
G1 X128 Y107.042 E.01847
G1 X128.877 Y107.042 E.02612
G1 X128.877 Y107.662 E.01847
G1 X129.754 Y107.662 E.02612
G1 X129.754 Y107.042 E.01847
G1 X130.631 Y107.042 E.02612
G1 X130.631 Y107.662 E.01847
G1 X131.508 Y107.662 E.02612
G1 X131.508 Y107.042 E.01847
G1 X132.385 Y107.042 E.02612
G1 X132.385 Y107.662 E.01847
G1 X133.262 Y107.662 E.02612
G1 X133.262 Y107.042 E.01847
G1 X134.139 Y107.042 E.02612
G1 X134.139 Y107.662 E.01847
G1 X135.017 Y107.662 E.02612
G1 X135.017 Y107.042 E.01847
G1 X135.894 Y107.042 E.02612
G1 X135.894 Y107.662 E.01847
G1 X136.771 Y107.662 E.02612
G1 X136.771 Y107.042 E.01847
G1 X137.648 Y107.042 E.02612
G1 X137.648 Y107.662 E.01847
G1 X138.525 Y107.662 E.02612
G1 X138.525 Y107.042 E.01847
G1 X139.402 Y107.042 E.02612
G1 X139.402 Y107.662 E.01847
G1 X140.279 Y107.662 E.02612
G1 X140.279 Y107.042 E.01847
G1 X141.156 Y107.042 E.02612
G1 X141.156 Y107.662 E.01847
G1 X142.033 Y107.662 E.02612
G1 X142.033 Y107.042 E.01847
G1 X142.91 Y107.042 E.02612
G1 X142.91 Y107.662 E.01847
G1 X143.787 Y107.662 E.02612
G1 X143.787 Y107.042 E.01847
G1 X144.664 Y107.042 E.02612
G1 X144.664 Y107.662 E.01847
G1 X145.541 Y107.662 E.02612
G1 X145.541 Y107.042 E.01847
G1 X146.418 Y107.042 E.02612
G1 X146.418 Y107.662 E.01847
G1 X147.296 Y107.662 E.02612
G1 X147.296 Y107.042 E.01847
G1 X148.173 Y107.042 E.02612
G1 X148.173 Y107.662 E.01847
G1 X149.05 Y107.662 E.02612
G1 X149.05 Y107.042 E.01847
G1 X149.927 Y107.042 E.02612
G1 X149.927 Y107.662 E.01847
G1 X150.804 Y107.662 E.02612
G1 X150.804 Y107.042 E.01847
G1 X151.681 Y107.042 E.02612
G1 X151.681 Y107.662 E.01847
G1 X152.558 Y107.662 E.02612
G1 X152.558 Y107.042 E.01847
G1 X153.435 Y107.042 E.02612
G1 X153.435 Y118.915 E.35366
G1 X154.312 Y118.915 E.02612
G1 X154.312 Y107.042 E.35366
G1 X155.189 Y107.042 E.02612
G1 X155.189 Y118.915 E.35366
G1 X156.066 Y118.915 E.02612
G1 X156.066 Y114.759 E.12381
G2 X156.943 Y115.282 I1.072 J-.801 E.03121
G1 X156.943 Y118.915 E.10823
G1 X157.82 Y118.915 E.02612
G1 X157.82 Y115.093 E.11383
G2 X157.82 Y112.864 I-.714 J-1.115 E.07896
G1 X157.82 Y111.093 E.05272
G3 X157.098 Y111.296 I-.715 J-1.16 E.02263
G2 X156.943 Y111.033 I-.31 J.005 E.0095
G1 X156.943 Y112.676 E.04894
G2 X156.066 Y113.198 I.193 J1.321 E.0312
G1 X156.066 Y110.758 E.07268
G3 X156.066 Y109.198 I1.111 J-.78 E.0495
G1 X156.066 Y107.042 E.06424
G1 X156.943 Y107.042 E.02612
G1 X156.943 Y108.675 E.04865
G3 X157.301 Y108.767 I.086 J.405 E.01139
G3 X157.82 Y108.864 I.182 J.466 E.01659
G1 X157.82 Y107.042 E.05426
G1 X158.697 Y107.042 E.02612
G1 X158.697 Y118.915 E.35366
G1 X159.575 Y118.915 E.02612
G1 X159.575 Y107.042 E.35366
G1 X160.452 Y107.042 E.02612
G1 X160.452 Y119.085 E.35871
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X153.005 Y117.412 Z1.2 F30000
G1 X106.073 Y106.872 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4800
G1 X106.073 Y108.943 E.06169
G2 X105.196 Y108.925 I-.467 J1.334 E.02657
G1 X105.196 Y107.042 E.05608
G1 X104.319 Y107.042 E.02612
G1 X104.319 Y118.915 E.35366
G1 X105.196 Y118.915 E.02612
G1 X105.196 Y111.42 E.22325
G2 X106.073 Y111.414 I.428 J-1.407 E.02653
G1 X106.073 Y118.915 E.22344
G1 X106.95 Y118.915 E.02612
G1 X106.95 Y107.042 E.35366
G1 X107.827 Y107.042 E.02612
G1 X107.827 Y118.915 E.35366
G1 X108.704 Y118.915 E.02612
G1 X108.704 Y107.042 E.35366
G1 X109.582 Y107.042 E.02612
G1 X109.582 Y118.915 E.35366
G1 X110.459 Y118.915 E.02612
G1 X110.459 Y107.042 E.35366
G1 X111.336 Y107.042 E.02612
G1 X111.336 Y118.915 E.35366
G1 X112.213 Y118.915 E.02612
G1 X112.213 Y107.042 E.35366
G1 X113.09 Y107.042 E.02612
G1 X113.09 Y118.915 E.35366
G1 X113.967 Y118.915 E.02612
G1 X113.967 Y107.042 E.35366
G1 X114.844 Y107.042 E.02612
G1 X114.844 Y119.085 E.35871
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X107.211 Y119.085 Z1.2 F30000
G1 X103.442 Y119.085 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F4800
G1 X103.442 Y107.042 E.35871
G1 X102.565 Y107.042 E.02612
G1 X102.565 Y118.915 E.35366
G1 X101.688 Y118.915 E.02612
G1 X101.688 Y107.042 E.35366
G1 X100.811 Y107.042 E.02612
G1 X100.811 Y118.915 E.35366
G1 X99.934 Y118.915 E.02612
G1 X99.934 Y107.042 E.35366
G1 X99.057 Y107.042 E.02612
G1 X99.057 Y118.915 E.35366
G1 X98.18 Y118.915 E.02612
G1 X98.18 Y107.042 E.35366
G1 X97.303 Y107.042 E.02612
G1 X97.303 Y118.915 E.35366
G1 X96.425 Y118.915 E.02612
G1 X96.425 Y107.042 E.35366
G1 X95.548 Y107.042 E.02612
G1 X95.548 Y119.085 E.35871
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X102.755 Y121.597 Z1.2 F30000
G1 X136.676 Y133.424 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6364.704
M204 S5000
G1 X136.678 Y133.468 E.00133
G1 F3591.595
G1 X136.682 Y133.652 E.0055
M106 S229.5
G1 F1800
M106 S160.65
M106 S229.5
G1 X136.687 Y133.837 E.0055
M106 S160.65
M106 S229.5
G1 F720
G1 X136.957 Y144.128 E.30665
M106 S160.65
M106 S229.5
G1 F1800
G1 X136.962 Y144.313 E.0055
M106 S160.65
M106 S229.5
M106 S160.65
G1 F2114.637
G1 X136.963 Y144.35 E.00112
G1 F6364.704
G1 X136.563 Y144.35 E.01191
G1 X123.037 Y144.35 E.40288
G1 X123.038 Y144.313 E.00112
G1 F3591.595
G1 X123.043 Y144.128 E.0055
M106 S229.5
G1 F1800
M106 S160.65
M106 S229.5
G1 X123.048 Y143.944 E.0055
M106 S160.65
M106 S229.5
G1 F720
G1 X123.318 Y133.652 E.30665
M106 S160.65
M106 S229.5
G1 F1800
G1 X123.322 Y133.468 E.0055
M106 S160.65
M106 S229.5
M106 S160.65
G1 F2175.911
G1 X123.324 Y133.424 E.00133
G1 F6364.704
G1 X123.724 Y133.424 E.01191
G1 X136.616 Y133.424 E.38403
; WIPE_START
M204 S10000
G1 X136.678 Y133.468 E-.02874
G1 X136.682 Y133.652 E-.07011
G1 X136.687 Y133.837 E-.07011
G1 X136.728 Y135.392 E-.59104
; WIPE_END
G1 E-.04 F1800
G1 X129.11 Y135.864 Z1.2 F30000
G1 X98.853 Y137.741 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.649 Y137.725 E.00657
G3 X98.65 Y134.295 I.218 J-1.715 E.16058
G1 X98.862 Y134.282 E.00684
G3 X98.913 Y137.738 I.005 J1.729 E.17333
G1 X98.852 Y137.346 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.529 Y137.303 E.00972
G3 X98.701 Y134.685 I.34 J-1.292 E.1098
G1 X98.864 Y134.674 E.00487
G3 X98.912 Y137.346 I.004 J1.336 E.12387
; WIPE_START
M204 S10000
G1 X98.529 Y137.303 E-.14655
G1 X98.364 Y137.247 E-.0662
G1 X98.206 Y137.17 E-.06676
G1 X97.93 Y136.958 E-.13236
G1 X97.813 Y136.826 E-.067
G1 X97.639 Y136.523 E-.13264
G1 X97.548 Y136.186 E-.13251
G1 X97.546 Y136.144 E-.01598
; WIPE_END
G1 E-.04 F1800
M73 P43 R13
G1 X97.488 Y141.046 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.384 Y140.873 E.00648
G3 X98.811 Y138.285 I1.499 J-.86 E.11394
G3 X99.323 Y138.341 I.053 J1.91 E.01662
G3 X97.53 Y141.088 I-.44 J1.672 E.21032
G1 X97.788 Y140.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.649 Y140.52 E.00887
G3 X98.837 Y138.676 I1.237 J-.508 E.07663
G3 X99.05 Y138.686 I.072 J.783 E.00635
G3 X97.827 Y140.829 I-.165 J1.326 E.15654
; WIPE_START
M204 S10000
G1 X97.649 Y140.52 E-.13547
G1 X97.548 Y140.187 E-.13203
G1 X97.537 Y140.012 E-.06681
G1 X97.548 Y139.837 E-.06661
G1 X97.639 Y139.5 E-.13258
G1 X97.813 Y139.197 E-.13259
G1 X97.93 Y139.066 E-.06685
G1 X97.986 Y139.022 E-.02707
; WIPE_END
G1 E-.04 F1800
G1 X105.437 Y137.369 Z1.2 F30000
G1 X122.93 Y133.488 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X122.64 Y144.536 E.35537
G1 X95.602 Y144.536 E.86945
G1 X95.602 Y133.488 E.35525
G1 X122.87 Y133.488 E.87683
; WIPE_START
G1 X122.828 Y135.488 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.456 Y135.223 Z1.2 F30000
G1 X149.902 Y134.548 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F5895.652
G1 X149.926 Y134.539 E.00081
G3 X150.15 Y134.495 I.442 J1.671 E.00736
G1 X150.362 Y134.482 E.00684
G3 X149.712 Y134.611 I.005 J1.729 E.32779
G1 X149.845 Y134.567 E.00452
G1 X150.028 Y134.919 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.201 Y134.885 I.34 J1.292 E.00525
G1 X150.364 Y134.874 E.00487
G3 X149.971 Y134.935 I.004 J1.336 E.23816
; WIPE_START
M204 S10000
G1 X150.201 Y134.885 E-.08952
G1 X150.364 Y134.874 E-.06217
G1 X150.548 Y134.885 E-.07013
G1 X150.722 Y134.919 E-.0672
G1 X150.887 Y134.976 E-.06626
G1 X151.044 Y135.053 E-.06661
G1 X151.32 Y135.265 E-.13239
G1 X151.437 Y135.397 E-.06696
G1 X151.611 Y135.699 E-.13241
G1 X151.616 Y135.715 E-.00633
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.488 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.492 E.32169
G1 X160.398 Y143.492 E.20908
G1 X160.398 Y144.536 E.03356
G1 X137.36 Y144.536 E.74082
G1 X137.07 Y133.488 E.35537
G1 X153.836 Y133.488 E.53912
G1 X154.288 Y133.673 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.1 E.28079
G1 X160.79 Y143.1 E.19367
G1 X160.79 Y144.928 E.05445
G1 X95.21 Y144.928 E1.9534
G1 X95.21 Y133.096 E.35243
G1 X160.79 Y133.096 E1.9534
G1 X160.79 Y133.673 E.01719
G1 X154.348 Y133.673 E.19189
M204 S10000
G1 X154.092 Y133.385 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22798
G1 F12968.767
G1 X160.594 Y133.385 E.09505
; WIPE_START
G1 X158.594 Y133.385 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.442 Y138.474 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.539219
G1 F4835.802
G1 X153.444 Y134 E.17541
; WIPE_START
G1 X153.443 Y136 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.396 Y138.93 Z1.2 F30000
G1 X140.387 Y141.428 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.57259
G1 F4531.123
G1 X150.728 Y141.428 E.43266
G1 X139.922 Y140.975 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X139.946 Y141.881 E.02702
G1 X151.241 Y141.881 E.33646
G1 X151.241 Y140.975 E.02701
G1 X139.982 Y140.975 E.33538
G1 X139.535 Y140.598 F30000
G1 F6364.866
G1 X139.578 Y142.258 E.04949
G1 X151.619 Y142.258 E.35863
G1 X151.619 Y140.598 E.04947
G1 X139.595 Y140.598 E.35814
G1 X139.148 Y140.221 F30000
G1 F6364.866
G1 X139.211 Y142.636 E.07196
G1 X151.996 Y142.636 E.3808
G1 X151.996 Y140.221 E.07193
G1 X139.208 Y140.221 E.3809
G1 X138.761 Y139.843 F30000
G1 F6364.866
G1 X138.844 Y143.013 E.09443
G1 X152.286 Y143.013 E.4004
G1 X152.331 Y142.837 E.0054
G1 X152.373 Y142.812 E.00144
G1 X152.373 Y139.843 E.08843
G1 X138.821 Y139.843 E.40366
G1 X138.374 Y139.466 F30000
G1 F6364.866
G1 X138.476 Y143.39 E.1169
G1 X152.567 Y143.39 E.4197
G1 X152.662 Y143.018 E.01143
G1 X152.75 Y142.966 E.00304
G1 X152.75 Y139.466 E.10424
G1 X138.434 Y139.466 E.42642
G1 X137.985 Y139.036 F30000
G1 F6364.866
G1 X138.109 Y143.767 E.14095
G1 X152.923 Y143.767 E.44126
G3 X152.993 Y143.199 I1.145 J-.148 E.01721
G1 X153.127 Y143.12 E.00464
G1 X153.127 Y139.08 E.12033
G1 X138.116 Y139.089 E.44711
G1 X138.041 Y139.059 E.00242
G1 X137.438 Y133.847 F30000
; LINE_WIDTH: 0.352975
G1 F7740.562
G1 X137.559 Y138.446 E.11269
; LINE_WIDTH: 0.369725
G1 F7343.83
G1 X137.586 Y138.837 E.01012
; LINE_WIDTH: 0.419738
G1 F6369.135
G1 X137.613 Y139.229 E.01167
G1 X137.742 Y144.144 E.14636
G1 X153.3 Y144.144 E.46312
G1 X153.3 Y143.471 E.02004
G1 X153.324 Y143.38 E.00278
G1 X153.504 Y143.267 E.00633
G1 X153.504 Y139.113 E.12366
; LINE_WIDTH: 0.440485
G1 F6036.749
G1 X153.483 Y138.9 E.00671
; LINE_WIDTH: 0.481475
G1 F5472.518
G1 X153.463 Y138.687 E.00741
; LINE_WIDTH: 0.522465
G1 F5004.744
G1 X153.442 Y138.474 E.0081
; LINE_WIDTH: 0.519195
G1 F5039.105
G1 X153.345 Y138.571 E.00517
; LINE_WIDTH: 0.471665
G1 F5597.732
G1 X153.247 Y138.667 E.00465
; LINE_WIDTH: 0.420085
G1 F6363.268
G1 X153.103 Y138.712 E.00447
G1 X138.116 Y138.712 E.44653
G1 X137.988 Y138.655 E.00418
; LINE_WIDTH: 0.396895
G1 F6780.14
G1 X137.929 Y138.56 E.00312
; LINE_WIDTH: 0.353346
G1 F7731.332
G3 X137.869 Y138.438 I.087 J-.119 E.00347
G1 X137.749 Y133.847 E.11262
G1 X137.498 Y133.847 E.00613
G1 X138.125 Y134.54 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X138.168 Y136.168 E.05236
G1 X140.32 Y138.32 E.09788
G1 X138.708 Y138.32 E.05186
G1 X143.191 Y133.837 E.2039
G1 X143.512 Y133.837 E.01033
G1 X147.996 Y138.32 E.2039
G1 X146.384 Y138.32 E.05186
G1 X148.307 Y136.397 E.08748
G3 X150.56 Y134.144 I2.096 J-.157 E.11626
G1 X150.867 Y133.837 E.01398
G1 X151.188 Y133.837 E.01033
G1 X152.993 Y135.641 E.08205
G1 X152.993 Y137.269 E.05236
G1 X153.693 Y144.014 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.67964
G1 F3769.318
G1 X160.194 Y144.014 E.32702
G1 X137.166 Y144.639 F30000
; LINE_WIDTH: 0.22861
G1 F12924.767
G1 X122.834 Y144.639 E.21023
G1 X121.815 Y136.837 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X121.857 Y135.209 E.05236
G1 X120.485 Y133.837 E.06242
G1 X120.163 Y133.837 E.01033
G1 X115.68 Y138.32 E.2039
G1 X117.292 Y138.32 E.05186
G1 X112.809 Y133.837 E.2039
G1 X112.488 Y133.837 E.01033
G1 X108.004 Y138.32 E.20391
G1 X109.616 Y138.32 E.05186
G1 X105.133 Y133.837 E.2039
G1 X104.812 Y133.837 E.01033
G1 X100.328 Y138.32 E.2039
G1 X101.941 Y138.32 E.05186
G1 X100.674 Y137.054 E.0576
G2 X100.885 Y135.48 I-1.85 J-1.05 E.05232
G1 X99.558 Y134.191 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406367
G1 F6603.448
G1 X99.415 Y133.952 E.00801
; LINE_WIDTH: 0.445954
G1 F5954.831
G1 X99.403 Y133.934 E.00068
; LINE_WIDTH: 0.467838
G1 F5648.151
G1 X99.391 Y133.916 E.00072
G2 X99.134 Y133.892 I-.48 J3.737 E.00867
; LINE_WIDTH: 0.43682
G1 F6092.918
G2 X98.585 Y133.894 I-.252 J6.19 E.01711
; LINE_WIDTH: 0.468617
G1 F5637.823
G1 X98.359 Y133.916 E.00764
G1 X98.335 Y133.953 E.00145
; LINE_WIDTH: 0.406019
G1 F6609.768
G1 X98.192 Y134.191 E.00799
; WIPE_START
G1 X98.335 Y133.953 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.426 Y137.914 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.116081
G1 F15000
G1 X98.591 Y137.97 E.00101
; LINE_WIDTH: 0.152362
G1 X98.635 Y137.998 E.00045
; LINE_WIDTH: 0.190939
G1 X98.651 Y138.012 E.00025
; LINE_WIDTH: 0.188444
G1 X99.099 Y138.012 E.00514
G1 X99.115 Y137.998 F30000
; LINE_WIDTH: 0.165587
G1 F15000
G1 X99.131 Y137.984 E.00021
; LINE_WIDTH: 0.149845
G1 X99.138 Y137.98 E.00006
; LINE_WIDTH: 0.119031
G3 X99.324 Y137.914 I.366 J.742 E.00119
G1 X99.326 Y138.11 F30000
; LINE_WIDTH: 0.116104
G1 F15000
G1 X99.159 Y138.053 E.00102
; LINE_WIDTH: 0.142564
G1 X99.133 Y138.04 E.00023
; LINE_WIDTH: 0.181968
G1 X99.099 Y138.012 E.00049
G1 X99.115 Y137.998 E.00024
G1 X122.562 Y133.847 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.353413
G1 F7729.652
G1 X122.251 Y133.847 E.00761
G1 X122.131 Y138.438 E.11265
G1 X122.097 Y138.558 E.00305
; LINE_WIDTH: 0.419845
G1 F6367.318
G3 X121.884 Y138.712 I-.269 J-.147 E.00809
G1 X100.554 Y138.712 E.63508
G1 X100.826 Y139.176 E.01601
G1 X100.976 Y139.712 E.01655
G1 X100.982 Y140.263 E.01643
G1 X100.845 Y140.802 E.01654
G1 X100.574 Y141.284 E.01648
G1 X100.186 Y141.68 E.0165
G1 X99.71 Y141.962 E.01648
G1 X99.175 Y142.113 E.01654
G1 X98.624 Y142.119 E.01641
G1 X98.081 Y141.98 E.01669
G3 X97.05 Y141.094 I.956 J-2.156 E.04105
G1 X96.832 Y140.585 E.01649
G1 X96.753 Y140.036 E.0165
G1 X96.819 Y139.486 E.01649
G1 X97.026 Y138.973 E.01647
G1 X97.359 Y138.528 E.01655
G1 X97.792 Y138.187 E.01643
G1 X97.991 Y138.091 E.00656
G1 X97.971 Y138.037 E.00172
G1 X98.005 Y137.936 E.00317
G1 X97.792 Y137.836 E.00699
G1 X97.394 Y137.53 E.01497
G1 X97.05 Y137.093 E.01656
G1 X96.832 Y136.584 E.01648
G1 X96.753 Y136.036 E.01648
G1 X96.819 Y135.486 E.0165
G1 X97.026 Y134.972 E.01651
G1 X97.359 Y134.527 E.01653
G1 X97.636 Y134.31 E.01049
G1 X97.551 Y134.176 E.00473
G1 X97.649 Y133.88 E.00927
G1 X95.994 Y133.88 E.04927
G1 X95.994 Y144.144 E.30559
G1 X122.258 Y144.144 E.782
G1 X122.387 Y139.229 E.1464
G1 X122.417 Y138.698 E.01583
; LINE_WIDTH: 0.353906
G1 F7717.389
G1 X122.441 Y138.446 E.00621
G1 X122.56 Y133.907 E.11155
G1 X122.015 Y139.036 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X121.884 Y139.089 E.00421
G1 X101.195 Y139.089 E.61625
G1 X101.34 Y139.614 E.01622
G1 X101.359 Y140.263 E.01935
G1 X101.229 Y140.823 E.01713
G1 X101.153 Y141.035 E.00671
G1 X100.901 Y141.473 E.01504
G1 X100.452 Y141.947 E.01945
G1 X99.898 Y142.289 E.01938
G1 X99.273 Y142.477 E.01945
G1 X98.624 Y142.496 E.01934
G1 X97.983 Y142.344 E.01963
G1 X97.454 Y142.063 E.01784
G1 X97.063 Y141.729 E.0153
G1 X96.751 Y141.324 E.01524
; LINE_WIDTH: 0.432943
G1 F6153.491
G1 X96.606 Y141.031 E.01006
; LINE_WIDTH: 0.458848
G1 F5770.236
G1 X96.46 Y140.739 E.01073
; LINE_WIDTH: 0.48516
G1 F5426.918
G1 X96.41 Y140.617 E.0046
; LINE_WIDTH: 0.478888
G1 F5504.998
G1 X96.391 Y140.937 E.01104
; LINE_WIDTH: 0.420181
G1 F6361.652
G1 X96.371 Y141.257 E.00955
G1 X96.371 Y143.767 E.0748
G1 X121.891 Y143.767 E.76051
G1 X122.013 Y139.096 E.13924
G1 X121.626 Y139.466 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X101.691 Y139.466 E.5938
G1 X101.736 Y139.76 E.00885
G1 X101.736 Y140.263 E.01498
G1 X101.594 Y140.921 E.02005
G1 X101.479 Y141.224 E.00964
G1 X101.227 Y141.661 E.01504
G1 X100.718 Y142.214 E.02239
G1 X100.087 Y142.615 E.02228
; LINE_WIDTH: 0.434298
G1 F6132.187
G1 X99.733 Y142.742 E.01163
; LINE_WIDTH: 0.479344
G1 F5499.243
G3 X99.126 Y142.908 I-.74 J-1.513 E.02181
G1 X98.624 Y142.908 E.01731
; LINE_WIDTH: 0.50013
G1 F5249.229
G1 X98.367 Y142.885 E.00933
; LINE_WIDTH: 0.488
G1 F5392.289
G1 X98.126 Y142.796 E.00902
; LINE_WIDTH: 0.421411
G1 F6340.97
G3 X96.748 Y141.965 I1.11 J-3.396 E.04852
G1 X96.748 Y143.39 E.04261
G1 X97.795 Y143.39 E.03128
; LINE_WIDTH: 0.44266
G1 F6003.903
G1 X98.05 Y143.367 E.0081
; LINE_WIDTH: 0.49724
G1 F5282.628
G1 X98.306 Y143.344 E.00921
G1 X99.126 Y143.355 E.02944
; LINE_WIDTH: 0.47219
G1 F5590.887
G1 X99.538 Y143.372 E.01399
; LINE_WIDTH: 0.420268
G1 F6360.181
G1 X99.951 Y143.39 E.0123
G1 X121.524 Y143.39 E.64304
G1 X121.625 Y139.526 E.1152
G1 X121.239 Y139.843 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X102.113 Y139.843 E.56968
G1 X102.069 Y140.605 E.02271
G3 X100.105 Y143.013 I-3.181 J-.589 E.09654
G1 X121.156 Y143.013 E.62703
G1 X121.238 Y139.903 E.09264
G1 X120.852 Y140.221 F30000
G1 F6364.866
G1 X102.491 Y140.221 E.54692
G3 X101.364 Y142.636 I-3.551 J-.186 E.08136
G1 X120.789 Y142.636 E.57859
G1 X120.851 Y140.281 E.07017
G1 X120.465 Y140.598 F30000
G1 F6364.866
G1 X102.824 Y140.598 E.52547
G1 X102.686 Y141.213 E.01879
G1 X102.459 Y141.789 E.01843
G1 X102.182 Y142.258 E.01624
M73 P44 R13
G1 X120.422 Y142.258 E.54327
G1 X120.464 Y140.658 E.0477
G1 X120.078 Y140.975 F30000
G1 F6364.866
G1 X103.141 Y140.975 E.5045
G3 X102.826 Y141.881 I-3.603 J-.744 E.02867
G1 X120.054 Y141.881 E.51317
G1 X120.077 Y141.035 E.02523
G1 X103.489 Y141.428 F30000
; LINE_WIDTH: 0.57256
G1 F4531.38
G1 X119.553 Y141.428 E.67209
G1 X97.258 Y142.854 F30000
; LINE_WIDTH: 0.61356
G1 F4205.804
G2 X97.263 Y142.968 I-.032 J.059 E.01273
G1 X96.409 Y139.432 F30000
; LINE_WIDTH: 0.477945
G1 F5516.925
G1 X96.392 Y139.684 E.00869
; LINE_WIDTH: 0.456364
G1 F5804.897
G1 X96.375 Y139.936 E.00826
G1 X96.407 Y140.557 E.0203
G1 X96.801 Y137.965 F30000
; LINE_WIDTH: 0.47134
G1 F5601.979
G2 X96.794 Y138.058 I-.027 J.045 E.0072
G1 X97.401 Y138.012 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X97.06 Y137.725 E.01329
G1 X96.751 Y137.322 E.01512
; LINE_WIDTH: 0.432943
G1 F6153.491
G1 X96.605 Y137.03 E.01005
; LINE_WIDTH: 0.458848
G1 F5770.236
G1 X96.46 Y136.738 E.01072
; LINE_WIDTH: 0.48516
G1 F5426.918
G1 X96.41 Y136.616 E.0046
; LINE_WIDTH: 0.478888
G1 F5504.998
G1 X96.391 Y136.936 E.01103
; LINE_WIDTH: 0.427498
G1 F6240.613
G1 X96.371 Y137.256 E.00973
G1 X96.371 Y138.767 E.04592
G1 X96.393 Y139.272 E.01534
; LINE_WIDTH: 0.461694
G1 F5731.026
G1 X96.409 Y139.432 E.00531
G1 X96.677 Y138.828 E.02185
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X97.06 Y138.299 E.01946
G1 X97.355 Y138.05 E.0115
G1 X96.408 Y135.431 F30000
; LINE_WIDTH: 0.47786
G1 F5518.003
G1 X96.392 Y135.684 E.00869
; LINE_WIDTH: 0.456335
G1 F5805.315
G1 X96.375 Y135.936 E.00826
G1 X96.407 Y136.556 E.02027
G1 X97.04 Y134.283 F30000
; LINE_WIDTH: 0.475411
G1 F5549.252
G1 X96.396 Y134.282 E.022
G2 X96.408 Y135.431 I23.457 J.315 E.03928
G1 X96.655 Y134.817 E.0226
G1 X97.005 Y134.331 E.02046
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5549.252
G1 X96.655 Y134.817 E-.22757
G1 X96.408 Y135.431 E-.25143
G1 X96.4 Y134.692 E-.28101
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/41
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S206.55
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X95.019 Y109.336
G1 Z1
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X104.617 Y109.336 E.2859
G2 X104.31 Y110.213 I1.02 J.849 E.02828
G1 X95.188 Y110.213 E.27171
G1 X95.188 Y111.09 E.02612
G1 X104.678 Y111.09 E.28265
G2 X106.572 Y111.09 I.947 J-.942 E.06274
M73 P44 R12
G1 X115.809 Y111.09 E.27511
G1 X115.809 Y110.213 E.02612
G1 X106.939 Y110.213 E.2642
G2 X106.633 Y109.336 I-1.319 J-.032 E.02827
G1 X115.809 Y109.336 E.27331
G1 X115.809 Y108.459 E.02612
G1 X95.188 Y108.459 E.6142
G1 X95.188 Y107.582 E.02612
G1 X160.981 Y107.582 E1.95974
G1 X160.981 Y108.459 F30000
G1 F4800
G1 X153.191 Y108.459 E.23203
G1 X153.191 Y109.336 E.02612
G1 X155.978 Y109.336 E.083
G2 X155.832 Y110.213 I1.332 J.671 E.02689
G1 X153.191 Y110.213 E.07866
G1 X153.191 Y111.09 E.02612
G1 X156.424 Y111.09 E.09629
G2 X157.826 Y111.09 I.701 J-1.169 E.04385
G1 X160.812 Y111.09 E.08893
G1 X160.812 Y110.213 E.02612
G1 X158.418 Y110.213 E.0713
G2 X158.272 Y109.336 I-1.466 J-.207 E.0269
G1 X160.981 Y109.336 E.08069
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X160.981 Y111.967 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F4800
G1 X153.191 Y111.967 E.23203
G1 X153.191 Y112.844 E.02612
G1 X156.459 Y112.844 E.09733
G2 X155.837 Y113.721 I.676 J1.139 E.03298
G1 X153.191 Y113.721 E.0788
G1 X153.191 Y114.598 E.02612
G1 X155.966 Y114.598 E.08265
G2 X158.284 Y114.598 I1.159 J-.637 E.08415
G1 X160.812 Y114.598 E.07529
G1 X160.812 Y113.721 E.02612
G1 X158.413 Y113.721 E.07144
G2 X157.791 Y112.844 I-1.299 J.262 E.03298
G1 X160.981 Y112.844 E.09503
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X153.734 Y115.24 Z1.4 F30000
G1 X153.022 Y115.475 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4800
G1 X160.812 Y115.475 E.23203
G1 X160.812 Y116.352 E.02612
G1 X153.191 Y116.352 E.22698
G1 X153.191 Y117.229 E.02612
G1 X160.812 Y117.229 E.22698
G1 X160.812 Y118.106 E.02612
G1 X95.188 Y118.106 E1.95469
G1 X95.188 Y117.229 E.02612
G1 X115.809 Y117.229 E.6142
G1 X115.809 Y116.352 E.02612
G1 X95.188 Y116.352 E.6142
G1 X95.188 Y115.475 E.02612
G1 X115.809 Y115.475 E.6142
G1 X115.809 Y114.598 E.02612
G1 X95.188 Y114.598 E.6142
G1 X95.188 Y113.721 E.02612
G1 X115.809 Y113.721 E.6142
G1 X115.809 Y112.844 E.02612
G1 X95.188 Y112.844 E.6142
G1 X95.188 Y111.967 E.02612
G1 X115.978 Y111.967 E.61926
; WIPE_START
; WIPE_END
G1 E-.8 F1800
G1 X121.237 Y117.498 Z1.4 F30000
G1 X136.376 Y133.42 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6364.704
M204 S5000
G1 X136.378 Y133.465 E.00133
G1 F3591.595
G1 X136.382 Y133.649 E.0055
M106 S229.5
G1 F1800
M106 S206.55
M106 S229.5
G1 X136.387 Y133.833 E.0055
M106 S206.55
M106 S229.5
G1 F720
G1 X136.657 Y144.125 E.30665
M106 S206.55
M106 S229.5
G1 F1800
G1 X136.662 Y144.309 E.0055
M106 S206.55
M106 S229.5
M106 S206.55
G1 F2114.637
G1 X136.663 Y144.347 E.00112
G1 F6364.704
G1 X136.263 Y144.347 E.01191
G1 X123.337 Y144.347 E.38501
G1 X123.338 Y144.309 E.00112
G1 F3591.595
G1 X123.343 Y144.125 E.0055
M106 S229.5
G1 F1800
M106 S206.55
M106 S229.5
G1 X123.348 Y143.94 E.0055
M106 S206.55
M106 S229.5
G1 F720
G1 X123.618 Y133.649 E.30665
M106 S206.55
M106 S229.5
G1 F1800
G1 X123.622 Y133.465 E.0055
M106 S206.55
M106 S229.5
M106 S206.55
G1 F2175.911
G1 X123.624 Y133.42 E.00133
G1 F6364.704
G1 X124.024 Y133.42 E.01191
G1 X136.316 Y133.42 E.36616
; WIPE_START
M204 S10000
G1 X136.378 Y133.465 E-.02874
G1 X136.382 Y133.649 E-.07011
G1 X136.387 Y133.833 E-.07011
G1 X136.428 Y135.388 E-.59104
; WIPE_END
G1 E-.04 F1800
G1 X128.81 Y135.865 Z1.4 F30000
G1 X98.897 Y137.737 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.875 Y137.735 E.00071
G3 X98.65 Y134.292 I-.009 J-1.729 E.16796
G1 X98.859 Y134.278 E.00672
G3 X99.1 Y137.719 I.007 J1.729 E.16728
G1 X98.957 Y137.732 E.00464
G1 X98.854 Y137.343 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.529 Y137.3 E.00979
G3 X98.701 Y134.681 I.338 J-1.293 E.10988
G1 X98.861 Y134.671 E.00478
G3 X98.914 Y137.342 I.006 J1.336 E.1238
; WIPE_START
M204 S10000
G1 X98.529 Y137.3 E-.1474
G1 X98.364 Y137.244 E-.06624
G1 X98.206 Y137.167 E-.06675
G1 X97.93 Y136.954 E-.13237
G1 X97.813 Y136.822 E-.06699
G1 X97.639 Y136.52 E-.13263
G1 X97.548 Y136.183 E-.13252
G1 X97.546 Y136.143 E-.01511
; WIPE_END
G1 E-.04 F1800
G1 X97.515 Y141.078 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.509 Y141.056 E.00071
G3 X98.803 Y138.282 I1.375 J-1.048 E.12089
G3 X99.323 Y138.337 I.064 J1.888 E.01687
G3 X97.658 Y141.227 I-.439 J1.672 E.20416
G1 X97.556 Y141.121 E.00474
G1 X97.794 Y140.789 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.645 Y140.518 E.00921
G3 X98.83 Y138.673 I1.235 J-.509 E.07654
G3 X99.221 Y138.717 I.034 J1.489 E.01178
G3 X97.831 Y140.836 I-.341 J1.292 E.15073
; WIPE_START
M204 S10000
G1 X97.645 Y140.518 E-.13996
G1 X97.548 Y140.184 E-.1322
G1 X97.537 Y140.008 E-.0668
G1 X97.548 Y139.833 E-.06661
G1 X97.639 Y139.496 E-.13258
G1 X97.813 Y139.194 E-.1326
G1 X97.93 Y139.062 E-.06684
G1 X97.976 Y139.026 E-.0224
; WIPE_END
G1 E-.04 F1800
G1 X105.431 Y137.39 Z1.4 F30000
G1 X123.23 Y133.485 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X122.94 Y144.532 E.35537
G1 X95.602 Y144.532 E.87909
G1 X95.602 Y133.485 E.35525
G1 X123.17 Y133.485 E.88647
; WIPE_START
G1 X123.128 Y135.484 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.756 Y135.216 Z1.4 F30000
G1 X149.902 Y134.544 Z1.4
G1 Z1
G1 E.8 F1800
G1 F5895.652
G1 X149.926 Y134.535 E.00081
G3 X150.15 Y134.492 I.44 J1.672 E.00735
G1 X150.359 Y134.478 E.00672
G3 X149.712 Y134.607 I.007 J1.729 E.32789
G1 X149.845 Y134.563 E.00452
G1 X150.028 Y134.915 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.201 Y134.881 I.339 J1.292 E.00525
G1 X150.361 Y134.871 E.00478
G3 X149.971 Y134.931 I.006 J1.336 E.23825
; WIPE_START
M204 S10000
G1 X150.201 Y134.881 E-.0895
G1 X150.361 Y134.871 E-.06092
G1 X150.548 Y134.881 E-.07129
G1 X150.722 Y134.915 E-.06729
G1 X150.887 Y134.972 E-.06627
G1 X151.044 Y135.049 E-.06663
G1 X151.32 Y135.262 E-.13239
G1 X151.437 Y135.394 E-.06698
G1 X151.611 Y135.696 E-.13239
G1 X151.616 Y135.712 E-.00633
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.485 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.489 E.32169
G1 X160.398 Y143.489 E.20908
G1 X160.398 Y144.532 E.03356
G1 X137.06 Y144.532 E.75047
G1 X136.77 Y133.485 E.35537
G1 X153.836 Y133.485 E.54877
G1 X154.288 Y133.67 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.097 E.28079
G1 X160.79 Y143.097 E.19367
G1 X160.79 Y144.924 E.05445
G1 X95.21 Y144.924 E1.9534
G1 X95.21 Y133.093 E.35243
G1 X160.79 Y133.093 E1.9534
G1 X160.79 Y133.67 E.01719
G1 X154.348 Y133.67 E.19189
M204 S10000
G1 X154.092 Y133.381 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22804
G1 F12964.564
G1 X160.594 Y133.381 E.09508
; WIPE_START
G1 X158.594 Y133.381 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.929 Z1.4 F30000
M73 P45 R12
G1 X160.194 Y144.01 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.67963
G1 F3769.377
G1 X153.693 Y144.01 E.32702
G1 X153.257 Y144.097 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.486804
G1 F5406.827
G1 X153.285 Y144.001 E.0035
; LINE_WIDTH: 0.44525
G1 F5965.253
G1 X153.314 Y143.906 E.00317
; LINE_WIDTH: 0.387599
G1 F6963.017
G1 X153.343 Y143.81 E.00271
G1 X153.343 Y143.467 E.00934
; LINE_WIDTH: 0.402455
G1 F6675.29
G1 X153.368 Y143.406 E.00188
; LINE_WIDTH: 0.441525
G1 F6020.999
G1 X153.393 Y143.345 E.00208
; LINE_WIDTH: 0.480595
G1 F5483.521
G1 X153.419 Y143.284 E.00229
; LINE_WIDTH: 0.539061
G1 F4837.334
G1 X153.444 Y143.223 E.00259
G1 X153.444 Y133.996 E.3616
G1 X137.138 Y133.843 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.35295
G1 F7741.191
G1 X137.409 Y144.174 E.25308
G1 X137.719 Y144.174 E.0076
G1 X137.449 Y133.843 E.25308
G1 X137.198 Y133.843 E.00613
G1 X138.024 Y142.115 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X138.067 Y143.742 E.05236
G1 X138.508 Y144.184 E.02008
G1 X140.52 Y144.184 E.06468
G1 X148.307 Y136.396 E.35415
G3 X150.563 Y134.141 I2.095 J-.16 E.11647
G1 X150.871 Y133.833 E.01399
G1 X151.185 Y133.833 E.0101
G1 X152.993 Y135.641 E.08221
G1 X152.993 Y139.387 E.12047
G1 X148.196 Y144.184 E.21815
G1 X146.184 Y144.184 E.06468
G1 X137.86 Y135.86 E.37855
G1 X137.944 Y139.083 E.10369
G1 X143.195 Y133.833 E.23877
G1 X143.509 Y133.833 E.0101
G1 X152.993 Y143.317 E.43128
G1 X152.993 Y143.76 E.01425
G2 X152.789 Y144.184 I.11 J.314 E.0168
G1 X152.113 Y144.184 E.02176
G1 X136.866 Y144.636 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22859
G1 F12926.16
G1 X123.134 Y144.636 E.20141
G1 X122.107 Y137.129 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X122.149 Y135.501 E.05236
G1 X120.481 Y133.833 E.07587
G1 X120.167 Y133.833 E.0101
G1 X109.816 Y144.184 E.47073
G1 X107.804 Y144.184 E.06468
G1 X100.672 Y137.052 E.32433
G3 X99.769 Y137.88 I-1.82 J-1.078 E.03997
G2 X99.915 Y138.207 I.173 J.119 E.01377
G3 X100.22 Y138.428 I-.702 J1.289 E.01215
G1 X104.815 Y133.833 E.20896
G1 X105.129 Y133.833 E.0101
G1 X115.48 Y144.184 E.47073
G1 X117.492 Y144.184 E.06468
G1 X122.041 Y139.635 E.20688
G1 X121.953 Y142.981 E.10764
G1 X112.805 Y133.833 E.41603
G1 X112.491 Y133.833 E.0101
G1 X102.14 Y144.184 E.47073
G1 X100.128 Y144.184 E.06468
G1 X97.507 Y141.563 E.1192
G2 X97.811 Y141.785 I.773 J-.74 E.01216
G1 X96.092 Y144.184 F30000
G1 F5895.652
G1 X95.95 Y144.184 E.00457
G1 X95.95 Y142.698 E.0478
G1 X97.294 Y141.354 E.06112
G2 X95.95 Y140.006 I-11.901 J10.522 E.06124
G1 X95.95 Y135.022 E.16028
G1 X97.139 Y133.833 E.05406
G3 X97.646 Y134.026 I.157 J.35 E.01936
G1 X97.54 Y134.202 E.00663
G1 X97.699 Y134.298 E.00598
G2 X96.94 Y135.25 I1.501 J1.975 E.03954
G1 X98.192 Y134.188 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406123
G1 F6607.873
G1 X98.335 Y133.949 E.00799
; LINE_WIDTH: 0.468632
G1 F5637.625
G1 X98.359 Y133.913 E.00145
G1 X98.585 Y133.891 E.00763
; LINE_WIDTH: 0.436902
G1 F6091.659
G3 X99.133 Y133.889 I.299 J6.2 E.01707
; LINE_WIDTH: 0.467734
G1 F5649.536
G3 X99.391 Y133.913 I-.214 J3.678 E.00871
G1 X99.403 Y133.931 E.00072
; LINE_WIDTH: 0.445925
G1 F5955.262
G1 X99.415 Y133.949 E.00068
; LINE_WIDTH: 0.40635
G1 F6603.76
G1 X99.558 Y134.188 E.008
; WIPE_START
G1 X99.415 Y133.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.324 Y137.911 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.119019
G1 F15000
G2 X99.138 Y137.976 I.182 J.814 E.00119
; LINE_WIDTH: 0.149746
G1 X99.131 Y137.98 E.00006
; LINE_WIDTH: 0.165503
G1 X99.115 Y137.994 E.00021
; LINE_WIDTH: 0.181927
G1 X99.098 Y138.008 E.00024
G1 X99.133 Y138.036 E.00049
; LINE_WIDTH: 0.142495
G1 X99.159 Y138.05 E.00023
; LINE_WIDTH: 0.116082
G1 X99.326 Y138.106 E.00102
G1 X99.098 Y138.008 F30000
; LINE_WIDTH: 0.18844
G1 F15000
G1 X98.651 Y138.008 E.00514
; LINE_WIDTH: 0.190929
G1 X98.635 Y137.994 E.00025
; LINE_WIDTH: 0.152398
G1 X98.591 Y137.967 E.00045
; LINE_WIDTH: 0.116118
G1 X98.426 Y137.911 E.00101
G1 X122.862 Y133.843 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.352965
G1 F7740.813
G1 X122.551 Y133.843 E.0076
G1 X122.281 Y144.174 E.2531
G1 X122.591 Y144.174 E.0076
G1 X122.86 Y133.903 E.25163
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7740.813
G1 X122.808 Y135.903 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/41
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S226.95
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X136.078 Y133.461
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3591.595
M204 S5000
G1 X136.082 Y133.646 E.0055
M106 S229.5
G1 F1800
M106 S226.95
M106 S229.5
G1 X136.087 Y133.83 E.0055
M106 S226.95
M106 S229.5
G1 F720
G1 X136.357 Y144.121 E.30665
M106 S226.95
M106 S229.5
G1 F1800
G1 X136.362 Y144.306 E.0055
M106 S226.95
M106 S229.5
M106 S226.95
G1 F2114.637
G1 X136.363 Y144.343 E.00112
G1 F4334
G1 X135.963 Y144.343 E.01191
G1 X123.637 Y144.343 E.36714
G1 X123.638 Y144.306 E.00112
G1 F3591.595
G1 X123.643 Y144.121 E.0055
M106 S229.5
G1 F1800
M106 S226.95
M106 S229.5
G1 X123.648 Y143.937 E.0055
M106 S226.95
M106 S229.5
G1 F720
G1 X123.918 Y133.646 E.30665
M106 S226.95
M106 S229.5
G1 F1800
G1 X123.922 Y133.461 E.0055
M106 S226.95
M106 S229.5
M106 S226.95
G1 F2175.911
G1 X123.924 Y133.417 E.00133
G1 F4334
G1 X124.324 Y133.417 E.01191
G1 X136.061 Y133.417 E.34962
; WIPE_START
G1 F6364.704
M204 S10000
G1 X136.082 Y133.646 E-.08737
G1 X136.087 Y133.83 E-.07011
G1 X136.129 Y135.415 E-.60252
; WIPE_END
G1 E-.04 F1800
G1 X128.511 Y135.889 Z1.6 F30000
G1 X98.897 Y137.734 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4334
G1 X98.875 Y137.733 E.0007
G3 X98.65 Y134.288 I.001 J-1.73 E.1674
G3 X99.096 Y134.288 I.226 J1.899 E.01438
G3 X99.101 Y137.718 I-.22 J1.715 E.16037
G1 X98.957 Y137.729 E.00464
G1 X98.857 Y137.34 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4334
M204 S5000
G1 X98.529 Y137.297 E.00986
G3 X98.701 Y134.678 I.337 J-1.293 E.10995
G1 X98.857 Y134.668 E.00468
G3 X98.917 Y137.339 I.008 J1.336 E.12375
; WIPE_START
G1 F6364.704
M204 S10000
G1 X98.529 Y137.297 E-.14832
G1 X98.364 Y137.24 E-.06621
G1 X98.206 Y137.163 E-.06677
G1 X97.93 Y136.951 E-.13234
G1 X97.813 Y136.819 E-.06705
G1 X97.639 Y136.516 E-.1326
G1 X97.548 Y136.179 E-.13252
G1 X97.546 Y136.142 E-.01418
; WIPE_END
G1 E-.04 F1800
G1 X97.515 Y141.075 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4334
G1 X97.508 Y141.053 E.00071
G3 X98.795 Y138.279 I1.376 J-1.047 E.12065
G3 X99.323 Y138.334 I.074 J1.87 E.01712
G3 X97.657 Y141.225 I-.439 J1.673 E.20428
G1 X97.556 Y141.118 E.00472
G1 X97.799 Y140.795 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4334
M204 S5000
G1 X97.646 Y140.514 E.00954
G3 X98.822 Y138.67 I1.236 J-.509 E.07627
G3 X99.221 Y138.713 I.046 J1.463 E.01201
G3 X97.838 Y140.84 I-.34 J1.292 E.15045
; WIPE_START
G1 F6364.704
M204 S10000
G1 X97.646 Y140.514 E-.14396
G1 X97.548 Y140.18 E-.13216
G1 X97.537 Y140.005 E-.0668
G1 X97.548 Y139.83 E-.06662
G1 X97.639 Y139.493 E-.1326
G1 X97.813 Y139.19 E-.13259
G1 X97.93 Y139.059 E-.06683
G1 X97.968 Y139.029 E-.01845
; WIPE_END
G1 E-.04 F1800
G1 X105.426 Y140.652 Z1.6 F30000
G1 X123.24 Y144.529 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4334
G1 X95.602 Y144.529 E.88874
G1 X95.602 Y133.481 E.35525
G1 X123.53 Y133.481 E.89805
G1 X123.242 Y144.469 E.35344
; WIPE_START
G1 F5895.652
G1 X121.242 Y144.473 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.453 Y141.974 Z1.6 F30000
G1 X149.902 Y134.541 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F4334
G1 X149.926 Y134.533 E.00081
G3 X150.15 Y134.488 I.45 J1.67 E.00736
G3 X150.596 Y134.488 I.226 J1.898 E.01437
G3 X149.713 Y134.606 I-.22 J1.715 E.32043
G1 X149.845 Y134.56 E.00452
G1 X150.028 Y134.911 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4334
M204 S5000
G3 X150.201 Y134.878 I.338 J1.293 E.00525
G1 X150.357 Y134.868 E.00468
G3 X149.971 Y134.928 I.008 J1.336 E.23834
; WIPE_START
G1 F6364.704
M204 S10000
G1 X150.201 Y134.878 E-.08951
G1 X150.357 Y134.868 E-.05967
G1 X150.548 Y134.878 E-.07245
G1 X150.722 Y134.912 E-.06737
G1 X150.887 Y134.969 E-.06627
G1 X151.044 Y135.046 E-.06664
G1 X151.32 Y135.258 E-.13235
G1 X151.437 Y135.39 E-.06702
G1 X151.611 Y135.692 E-.1324
G1 X151.616 Y135.708 E-.00634
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.481 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4334
G1 X153.896 Y143.485 E.32169
G1 X160.398 Y143.485 E.20908
G1 X160.398 Y144.529 E.03356
G1 X136.76 Y144.529 E.76011
G1 X136.47 Y133.481 E.35537
G1 X153.836 Y133.481 E.55841
G1 X154.288 Y133.666 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4334
M204 S5000
G1 X154.288 Y143.093 E.28079
G1 X160.79 Y143.093 E.19367
G1 X160.79 Y144.921 E.05445
G1 X95.21 Y144.921 E1.9534
G1 X95.21 Y133.089 E.35243
G1 X160.79 Y133.089 E1.9534
G1 X160.79 Y133.666 E.01719
G1 X154.348 Y133.666 E.19189
M204 S10000
G1 X154.092 Y133.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22809
G1 F4334
G1 X160.594 Y133.378 E.0951
; WIPE_START
G1 F12961.064
G1 X158.594 Y133.378 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.925 Z1.6 F30000
G1 X160.194 Y144.007 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.67962
G1 F3769.436
G1 X153.693 Y144.007 E.32701
G1 X137.716 Y141.807 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4334
G1 X137.759 Y143.435 E.05236
G1 X138.505 Y144.181 E.03393
G1 X140.523 Y144.181 E.06491
G1 X148.308 Y136.396 E.354
G3 X150.566 Y134.137 I2.095 J-.164 E.11669
G1 X150.874 Y133.829 E.014
G1 X151.181 Y133.829 E.00987
G1 X153.548 Y136.196 E.10761
G1 X153.548 Y138.832 E.08477
G1 X148.199 Y144.181 E.24323
G1 X146.181 Y144.181 E.06491
G1 X137.552 Y135.552 E.39239
G1 X137.652 Y139.376 E.12299
G1 X143.198 Y133.829 E.25222
G1 X143.505 Y133.829 E.00987
G1 X153.344 Y143.668 E.44743
G1 X153.344 Y144.181 E.01647
G1 X152.228 Y144.181 E.03589
G1 X136.566 Y144.632 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22857
G1 F4334
G1 X123.434 Y144.632 E.19259
G1 X123.162 Y133.84 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.352955
G1 F4334
G1 X122.851 Y133.84 E.0076
G1 X122.581 Y144.17 E.25309
G1 X122.891 Y144.17 E.0076
G1 X123.16 Y133.9 E.25162
; WIPE_START
G1 F7741.062
G1 X123.108 Y135.899 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.656 Y134.767 Z1.6 F30000
G1 X136.838 Y133.84 Z1.6
M73 P46 R12
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.352945
G1 F4334
G1 X137.109 Y144.17 E.25308
G1 X137.419 Y144.17 E.0076
G1 X137.149 Y133.84 E.25308
G1 X136.898 Y133.84 E.00613
; WIPE_START
G1 F7741.315
G1 X137.149 Y133.84 E-.09506
G1 X137.194 Y135.589 E-.66494
; WIPE_END
G1 E-.04 F1800
G1 X129.567 Y135.304 Z1.6 F30000
G1 X99.558 Y134.184 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.406175
G1 F4334
G1 X99.415 Y133.945 E.008
; LINE_WIDTH: 0.445826
G1 X99.403 Y133.927 E.00068
; LINE_WIDTH: 0.467644
G1 X99.391 Y133.909 E.00072
G2 X99.132 Y133.885 I-.471 J3.636 E.00875
; LINE_WIDTH: 0.436993
G2 X98.585 Y133.887 I-.248 J6.211 E.01704
; LINE_WIDTH: 0.468646
G1 X98.359 Y133.909 E.00763
G1 X98.335 Y133.946 E.00145
; LINE_WIDTH: 0.405958
G1 X98.192 Y134.184 E.00799
G1 X96.939 Y135.249 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4334
G3 X97.699 Y134.294 I2.256 J1.017 E.03963
G1 X97.54 Y134.199 E.00598
G1 X97.645 Y134.024 E.00654
G2 X97.143 Y133.829 I-.348 J.154 E.01923
G1 X95.95 Y135.022 E.05422
G1 X95.95 Y140.006 E.16028
G3 X97.296 Y141.352 I-10.604 J11.944 E.06124
G1 X95.95 Y142.698 E.06119
G1 X95.95 Y144.181 E.04768
G1 X96.096 Y144.181 E.00468
G1 X97.79 Y141.77 F30000
G1 F4334
G3 X97.49 Y141.545 I.478 J-.953 E.01211
G1 X100.125 Y144.181 E.11984
G1 X102.143 Y144.181 E.06491
G1 X112.495 Y133.829 E.47073
G1 X112.802 Y133.829 E.00987
G1 X122.246 Y143.273 E.42947
G1 X122.349 Y139.327 E.12695
G1 X117.495 Y144.181 E.22072
G1 X115.477 Y144.181 E.06491
G1 X105.126 Y133.829 E.47073
G1 X104.819 Y133.829 E.00987
G1 X100.222 Y138.426 E.20904
G2 X99.767 Y138.131 I-1.345 J1.575 E.01749
G3 X99.915 Y137.806 I.182 J-.114 E.01359
G2 X100.671 Y137.051 I-1.526 J-2.284 E.03458
G1 X107.801 Y144.181 E.32423
G1 X109.819 Y144.181 E.06491
G1 X120.171 Y133.829 E.47073
G1 X120.478 Y133.829 E.00987
G1 X122.442 Y135.794 E.08932
G1 X122.484 Y134.166 E.05236
G1 X99.324 Y137.907 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119036
G1 F4334
G2 X99.138 Y137.973 I.18 J.81 E.00119
; LINE_WIDTH: 0.149871
G1 X99.131 Y137.977 E.00006
; LINE_WIDTH: 0.165607
G1 X99.115 Y137.991 E.00021
; LINE_WIDTH: 0.182019
G1 X99.099 Y138.005 E.00024
G1 X99.133 Y138.033 E.00049
; LINE_WIDTH: 0.14262
G1 X99.159 Y138.046 E.00023
; LINE_WIDTH: 0.116117
G1 X99.326 Y138.103 E.00102
G1 X99.099 Y138.005 F30000
; LINE_WIDTH: 0.18845
G1 F4334
G1 X98.651 Y138.005 E.00514
; LINE_WIDTH: 0.190994
G1 X98.635 Y137.991 E.00025
; LINE_WIDTH: 0.152472
G1 X98.591 Y137.963 E.00045
; LINE_WIDTH: 0.116134
G1 X98.426 Y137.907 E.00101
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X98.591 Y137.963 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/41
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S102
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X135.778 Y133.458
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3591.595
M204 S5000
G1 X135.782 Y133.642 E.0055
M106 S229.5
G1 F1800
M106 S102
M106 S229.5
G1 X135.787 Y133.826 E.0055
M106 S102
M106 S229.5
G1 F720
G1 X136.057 Y144.118 E.30665
M106 S102
M106 S229.5
G1 F1800
G1 X136.062 Y144.302 E.0055
M106 S102
M106 S229.5
M106 S102
G1 F2114.724
G1 X136.063 Y144.34 E.00112
G1 F6364.704
G1 X135.663 Y144.34 E.01191
G1 X123.937 Y144.34 E.34927
G1 X123.938 Y144.302 E.00112
G1 F3591.595
G1 X123.943 Y144.118 E.0055
M106 S229.5
G1 F1800
M106 S102
M106 S229.5
G1 X123.948 Y143.933 E.0055
M106 S102
M106 S229.5
G1 F720
G1 X124.217 Y133.642 E.30665
M106 S102
M106 S229.5
G1 F1800
G1 X124.222 Y133.458 E.0055
M106 S102
M106 S229.5
M106 S102
G1 F2175.911
G1 X124.223 Y133.413 E.00133
G1 F6364.704
G1 X124.623 Y133.413 E.01191
G1 X135.761 Y133.413 E.33175
; WIPE_START
M204 S10000
G1 X135.782 Y133.642 E-.08737
G1 X135.787 Y133.826 E-.07011
G1 X135.829 Y135.412 E-.60252
; WIPE_END
G1 E-.04 F1800
G1 X128.211 Y135.889 Z1.8 F30000
G1 X98.853 Y137.73 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.649 Y137.714 E.00657
G3 X98.65 Y134.285 I.227 J-1.715 E.16013
G3 X99.096 Y134.284 I.227 J1.927 E.01436
G3 X98.913 Y137.729 I-.219 J1.716 E.16647
G1 X98.859 Y137.337 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.532 Y137.282 E.00989
G3 X98.701 Y134.674 I.344 J-1.287 E.10907
G3 X99.048 Y134.674 I.175 J1.501 E.01035
G3 X98.916 Y137.326 I-.172 J1.321 E.11828
; WIPE_START
M204 S10000
G1 X98.532 Y137.282 E-.14716
G1 X98.364 Y137.237 E-.06605
G1 X98.206 Y137.16 E-.06677
G1 X97.93 Y136.947 E-.13237
G1 X97.813 Y136.815 E-.06701
G1 X97.639 Y136.513 E-.13263
G1 X97.548 Y136.176 E-.13252
G1 X97.546 Y136.135 E-.0155
; WIPE_END
G1 E-.04 F1800
G1 X97.516 Y141.072 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.507 Y141.051 E.00072
G3 X98.787 Y138.276 I1.375 J-1.048 E.12049
G3 X99.536 Y138.402 I.101 J1.69 E.02461
G3 X97.656 Y141.222 I-.653 J1.601 E.19693
G1 X97.557 Y141.115 E.0047
G1 X97.805 Y140.802 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.646 Y140.51 E.00988
G3 X98.814 Y138.668 I1.236 J-.508 E.07601
G3 X99.221 Y138.71 I.057 J1.444 E.01225
G3 X97.845 Y140.845 I-.339 J1.292 E.15016
; WIPE_START
M204 S10000
G1 X97.646 Y140.51 E-.14797
G1 X97.548 Y140.177 E-.13213
G1 X97.537 Y140.001 E-.06681
G1 X97.548 Y139.826 E-.06662
G1 X97.639 Y139.489 E-.13259
G1 X97.813 Y139.187 E-.13257
G1 X97.93 Y139.055 E-.06684
G1 X97.96 Y139.032 E-.01447
; WIPE_END
G1 E-.04 F1800
G1 X105.422 Y140.635 Z1.8 F30000
G1 X123.54 Y144.525 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X95.602 Y144.525 E.89838
G1 X95.602 Y133.478 E.35525
G1 X123.83 Y133.478 E.9077
G1 X123.542 Y144.465 E.35344
; WIPE_START
G1 X121.542 Y144.47 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.745 Y141.947 Z1.8 F30000
G1 X149.902 Y134.537 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5895.652
G1 X149.926 Y134.53 E.00081
G3 X150.15 Y134.485 I.45 J1.67 E.00735
G3 X150.595 Y134.484 I.226 J1.927 E.01436
G3 X149.713 Y134.602 I-.219 J1.716 E.32051
G1 X149.845 Y134.557 E.00452
G1 X150.028 Y134.909 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.201 Y134.875 I.347 J1.286 E.00524
G3 X150.548 Y134.874 I.175 J1.5 E.01035
G3 X149.971 Y134.926 I-.172 J1.321 E.2319
; WIPE_START
M204 S10000
G1 X150.201 Y134.875 E-.08948
G1 X150.548 Y134.874 E-.1318
G1 X150.722 Y134.908 E-.06744
G1 X151.044 Y135.042 E-.13268
G1 X151.32 Y135.255 E-.13237
G1 X151.437 Y135.387 E-.067
G1 X151.611 Y135.689 E-.13241
G1 X151.616 Y135.706 E-.00682
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.478 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.482 E.32169
G1 X160.398 Y143.482 E.20908
G1 X160.398 Y144.525 E.03356
G1 X136.46 Y144.525 E.76976
G1 X136.17 Y133.478 E.35537
G1 X153.836 Y133.478 E.56806
G1 X154.288 Y133.663 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.089 E.28079
G1 X160.79 Y143.089 E.19367
G1 X160.79 Y144.917 E.05445
G1 X95.21 Y144.917 E1.9534
G1 X95.21 Y133.086 E.35243
G1 X160.79 Y133.086 E1.9534
G1 X160.79 Y133.663 E.0172
G1 X154.348 Y133.663 E.19189
M204 S10000
G1 X154.092 Y133.374 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22815
G1 F12956.864
G1 X160.594 Y133.374 E.09513
; WIPE_START
G1 X158.594 Y133.374 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.922 Z1.8 F30000
G1 X160.194 Y144.003 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.67961
G1 F3769.496
G1 X153.693 Y144.003 E.32701
G1 X136.266 Y144.629 F30000
; LINE_WIDTH: 0.22854
G1 F12929.641
G1 X123.734 Y144.629 E.18377
G1 X122.776 Y134.458 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X122.734 Y136.086 E.05236
G1 X120.474 Y133.826 E.10277
G1 X120.174 Y133.826 E.00965
G1 X109.823 Y144.177 E.47073
G1 X107.797 Y144.177 E.06514
G1 X100.67 Y137.049 E.32414
G3 X99.77 Y137.873 I-1.816 J-1.08 E.0398
G2 X99.915 Y138.2 I.173 J.119 E.01376
G3 X100.224 Y138.424 I-.711 J1.303 E.01231
G1 X104.822 Y133.826 E.20911
G1 X105.122 Y133.826 E.00965
G1 X115.473 Y144.177 E.47073
G1 X117.499 Y144.177 E.06514
G1 X122.657 Y139.019 E.23457
G1 X122.538 Y143.566 E.14625
G1 X112.798 Y133.826 E.44292
G1 X112.498 Y133.826 E.00965
G1 X102.147 Y144.177 E.47073
G1 X100.121 Y144.177 E.06514
G1 X97.472 Y141.528 E.12048
G2 X97.769 Y141.754 I.783 J-.716 E.01207
G1 X96.099 Y144.177 F30000
G1 F5895.652
G1 X95.95 Y144.177 E.00479
G1 X95.95 Y142.698 E.04757
G1 X97.318 Y141.374 E.06121
G1 X95.95 Y140.006 E.06221
G1 X95.95 Y135.022 E.16028
G1 X97.146 Y133.826 E.05438
G3 X97.643 Y134.023 I.15 J.347 E.0191
G1 X97.54 Y134.195 E.00646
G1 X97.699 Y134.291 E.00597
G2 X96.939 Y135.248 I1.495 J1.969 E.03971
G1 X98.192 Y134.181 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406044
M73 P47 R12
G1 F6609.318
G1 X98.335 Y133.942 E.00799
; LINE_WIDTH: 0.468671
G1 F5637.098
G1 X98.359 Y133.906 E.00145
G1 X98.585 Y133.884 E.00763
; LINE_WIDTH: 0.437097
G1 F6088.637
G3 X99.131 Y133.881 I.3 J6.221 E.01701
; LINE_WIDTH: 0.467567
G1 F5651.761
G3 X99.391 Y133.906 I-.21 J3.655 E.00879
G1 X99.403 Y133.924 E.00072
; LINE_WIDTH: 0.445665
G1 F5959.107
G1 X99.415 Y133.942 E.00069
; LINE_WIDTH: 0.40599
G1 F6610.308
G1 X99.558 Y134.181 E.00799
; WIPE_START
G1 X99.415 Y133.942 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.324 Y137.904 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.119078
G1 F15000
G2 X99.138 Y137.97 I.18 J.81 E.00119
; LINE_WIDTH: 0.149967
G1 X99.131 Y137.973 E.00006
; LINE_WIDTH: 0.16568
G1 X99.115 Y137.987 E.00021
; LINE_WIDTH: 0.181975
G1 X99.099 Y138.001 E.00023
G1 X99.133 Y138.029 E.00049
; LINE_WIDTH: 0.142528
G1 X99.159 Y138.043 E.00023
; LINE_WIDTH: 0.116081
G1 X99.326 Y138.099 E.00102
G1 X99.099 Y138.001 F30000
; LINE_WIDTH: 0.188442
G1 F15000
G1 X98.651 Y138.001 E.00514
; LINE_WIDTH: 0.190959
G1 X98.635 Y137.987 E.00025
; LINE_WIDTH: 0.15244
G1 X98.591 Y137.96 E.00045
; LINE_WIDTH: 0.116126
G1 X98.426 Y137.904 E.00101
G1 X123.462 Y133.836 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.35291
G1 F7742.187
G1 X123.151 Y133.836 E.00759
G1 X122.881 Y144.167 E.25305
G1 X123.191 Y144.167 E.00759
G1 X123.46 Y133.896 E.25158
; WIPE_START
G1 X123.408 Y135.895 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.948 Y134.713 Z1.8 F30000
G1 X136.538 Y133.836 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.3529
G1 F7742.44
G1 X136.809 Y144.167 E.25304
G1 X137.119 Y144.167 E.00759
G1 X136.849 Y133.836 E.25304
G1 X136.598 Y133.836 E.00612
G1 X137.417 Y133.826 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X137.207 Y133.826 E.00674
G1 X137.244 Y135.244 E.04562
G1 X146.177 Y144.177 E.40623
G1 X148.203 Y144.177 E.06514
G1 X153.548 Y138.832 E.24307
G1 X153.548 Y136.196 E.08477
G1 X151.178 Y133.826 E.10777
G1 X150.878 Y133.826 E.00965
G1 X150.57 Y134.134 E.01401
G2 X148.308 Y136.396 I-.167 J2.095 E.1169
G1 X140.527 Y144.177 E.35385
G1 X138.501 Y144.177 E.06514
G1 X137.451 Y143.127 E.04777
G1 X137.36 Y139.668 E.11126
G1 X143.202 Y133.826 E.26566
G1 X143.502 Y133.826 E.00965
G1 X153.344 Y143.668 E.44759
G1 X153.344 Y144.177 E.01636
G1 X152.225 Y144.177 E.036
; WIPE_START
G1 X153.344 Y144.177 E-.42543
G1 X153.344 Y143.668 E-.19334
G1 X153.081 Y143.405 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X146.858 Y138.986 Z1.8 F30000
G1 X107.222 Y110.84 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Overhang wall
M106 S229.5
G1 F600
M204 S5000
G3 X105.398 Y108.462 I-1.597 J-.663 E.23278
G1 X105.618 Y108.448 E.00709
G3 X107.244 Y110.784 I.007 J1.729 E.10753
M106 S102
M204 S10000
G1 X106.859 Y110.689 F30000
M106 S229.5
G1 F600
M204 S5000
G3 X105.45 Y108.852 I-1.234 J-.512 E.17997
G1 X105.619 Y108.84 E.00545
G3 X106.881 Y110.633 I.006 J1.336 E.08268
M106 S102
; WIPE_START
M204 S10000
G1 X106.687 Y110.993 E-.15519
G1 X106.439 Y111.24 E-.13316
G1 X106.294 Y111.337 E-.06612
G1 X106.137 Y111.415 E-.06682
G1 X105.799 Y111.505 E-.13277
G1 X105.451 Y111.505 E-.13237
G1 X105.279 Y111.471 E-.06678
G1 X105.262 Y111.465 E-.00679
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.005 J1.217 P1  F30000
G1 X156.901 Y111.691 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S229.5
G1 F600
M204 S5000
G3 X156.898 Y108.262 I.225 J-1.714 E.1601
G1 X157.118 Y108.248 E.00709
G3 X156.96 Y111.698 I.007 J1.729 E.1802
M106 S102
M204 S10000
G1 X156.951 Y111.302 F30000
M106 S229.5
G1 F600
M204 S5000
G3 X156.95 Y108.652 I.174 J-1.325 E.12377
G1 X157.119 Y108.64 E.00545
G3 X157.011 Y111.308 I.006 J1.336 E.13889
M106 S102
; WIPE_START
M204 S10000
G1 X156.779 Y111.271 E-.08938
G1 X156.613 Y111.215 E-.06627
G1 X156.311 Y111.04 E-.13273
G1 X156.063 Y110.793 E-.13314
G1 X155.967 Y110.648 E-.06618
G1 X155.889 Y110.49 E-.06679
G1 X155.798 Y110.153 E-.13275
G1 X155.798 Y109.961 E-.07275
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.195 J.23 P1  F30000
G1 X156.899 Y115.69 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S229.5
G1 F600
M204 S5000
G3 X156.905 Y112.262 I.233 J-1.713 E.15985
G1 X157.125 Y112.247 E.00709
G3 X156.958 Y115.697 I.007 J1.729 E.18051
M106 S102
M204 S10000
G1 X156.951 Y115.301 F30000
M106 S229.5
G1 F600
M204 S5000
G3 X156.956 Y112.652 I.18 J-1.325 E.12358
G1 X157.125 Y112.64 E.00544
G3 X157.01 Y115.308 I.006 J1.337 E.13912
M106 S102
; WIPE_START
M204 S10000
G1 X156.613 Y115.215 E-.15491
G1 X156.311 Y115.04 E-.13273
G1 X156.063 Y114.793 E-.13314
G1 X155.967 Y114.648 E-.06618
G1 X155.889 Y114.49 E-.0668
G1 X155.798 Y114.153 E-.13273
G1 X155.798 Y113.959 E-.0735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.269 J-1.187 P1  F30000
G1 X135.778 Y118.501 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S229.5
G1 F600
M204 S5000
G1 X95.602 Y118.501 E1.2919
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.959 E.33774
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X135.838 Y118.501 E.78977
M106 S102
M204 S10000
G1 X135.778 Y117.566 F30000
M106 S229.5
G1 F600
M204 S5000
G1 X115.787 Y117.566 E.64283
G1 X115.787 Y107.64 E.31918
G1 X153.213 Y107.64 E1.20348
G1 X153.213 Y117.566 E.31918
G1 X135.838 Y117.566 E.55873
M106 S102
; WIPE_START
M204 S10000
G1 X133.838 Y117.566 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.079 J1.214 P1  F30000
G1 X154.288 Y118.893 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S229.5
G1 F600
M204 S5000
G1 X95.21 Y118.893 E1.89973
G1 X95.21 Y107.063 E.38041
G1 X160.79 Y107.063 E2.10882
G1 X160.79 Y118.893 E.38041
G1 X154.348 Y118.893 E.20715
M106 S102
M204 S10000
G1 X153.809 Y118.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
; WIPE_START
G1 X117.191 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.161 J-.366 P1  F30000
G1 X115.231 Y112.018 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42707
M106 S229.5
G1 F3000
G1 X106.553 Y112.018 E.26336
G2 X107.088 Y111.634 I-.699 J-1.541 E.02013
G1 X115.062 Y111.634 E.24195
G1 X115.062 Y111.25 E.01166
G1 X107.387 Y111.25 E.23289
G2 X107.568 Y110.866 I-1.985 J-1.169 E.0129
G1 X115.062 Y110.866 E.22741
G1 X115.062 Y110.482 E.01166
G1 X107.666 Y110.482 E.22443
G2 X107.684 Y110.097 I-2.556 J-.315 E.01168
G1 X115.062 Y110.097 E.22387
G1 X115.062 Y109.713 E.01166
G1 X107.633 Y109.713 E.22542
M73 P48 R12
G2 X107.504 Y109.329 I-2.231 J.539 E.01232
G1 X115.062 Y109.329 E.22935
G1 X115.062 Y108.945 E.01166
G1 X107.279 Y108.945 E.23616
M73 P48 R11
G2 X106.906 Y108.561 I-2.05 J1.62 E.01629
G1 X115.062 Y108.561 E.24749
G1 X115.062 Y108.177 E.01166
G1 X95.935 Y108.177 E.58039
M73 P49 R11
G1 X95.935 Y108.561 E.01166
G1 X104.344 Y108.561 E.25517
G2 X103.971 Y108.945 I1.676 J2.003 E.01629
G1 X95.935 Y108.945 E.24384
G1 X95.935 Y109.329 E.01166
G1 X103.746 Y109.329 E.23703
G2 X103.617 Y109.713 I2.108 J.925 E.01232
G1 X95.935 Y109.713 E.2331
G1 X95.935 Y110.097 E.01166
G1 X103.565 Y110.097 E.23152
G2 X103.584 Y110.482 I2.538 J.065 E.01168
G1 X95.935 Y110.482 E.23211
G1 X95.935 Y110.866 E.01166
G1 X103.682 Y110.866 E.23508
G2 X103.863 Y111.25 I2.166 J-.785 E.0129
M73 P50 R11
G1 X95.935 Y111.25 E.24057
G1 X95.935 Y111.634 E.01166
G1 X104.162 Y111.634 E.24963
G2 X104.697 Y112.018 I1.235 J-1.156 E.02013
G1 X95.935 Y112.018 E.26588
G1 X95.935 Y112.402 E.01166
G1 X115.062 Y112.402 E.58039
G1 X115.062 Y112.786 E.01166
G1 X95.935 Y112.786 E.58039
G1 X95.935 Y113.171 E.01166
G1 X115.062 Y113.171 E.58039
G1 X115.062 Y113.555 E.01166
G1 X95.935 Y113.555 E.58039
G1 X95.935 Y113.939 E.01166
G1 X115.062 Y113.939 E.58039
G1 X115.062 Y114.323 E.01166
G1 X95.935 Y114.323 E.58039
G1 X95.935 Y114.707 E.01166
G1 X115.062 Y114.707 E.58039
G1 X115.062 Y115.091 E.01166
G1 X95.935 Y115.091 E.58039
G1 X95.935 Y115.476 E.01166
G1 X115.062 Y115.476 E.58039
G1 X115.062 Y115.86 E.01166
G1 X95.935 Y115.86 E.58039
G1 X95.935 Y116.244 E.01166
G1 X115.062 Y116.244 E.58039
G1 X115.062 Y116.628 E.01166
G1 X95.935 Y116.628 E.58039
G1 X95.935 Y117.012 E.01166
G1 X115.062 Y117.012 E.58039
G1 X115.062 Y117.396 E.01166
M73 P51 R11
G1 X95.935 Y117.396 E.58039
G1 X95.935 Y117.78 E.01166
G1 X115.062 Y117.78 E.58039
G1 X115.062 Y117.807 E.00081
G1 X114.858 Y117.807 E.00617
G1 X114.858 Y118.165 E.01084
G1 X95.766 Y118.165 E.57937
M106 S102
; WIPE_START
G1 X97.766 Y118.165 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.195 J-.23 P1  F30000
G1 X95.766 Y107.793 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X115.231 Y107.793 E.59069
M106 S102
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X153.941 Y107.619 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42547
M106 S229.5
G1 F3000
G1 X153.941 Y117.807 E.30787
G1 X154.142 Y117.807 E.00606
G1 X154.142 Y118.168 E.01091
G1 X154.324 Y118.168 E.0055
G1 X154.324 Y107.789 E.31365
G1 X154.706 Y107.789 E.01156
G1 X154.706 Y118.168 E.31365
G1 X155.089 Y118.168 E.01156
G1 X155.089 Y107.789 E.31365
G1 X155.471 Y107.789 E.01156
G1 X155.471 Y108.744 E.02887
G3 X155.854 Y108.352 I2.072 J1.64 E.01658
G1 X155.854 Y107.619 E.02216
M106 S102
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409212
G1 F6552.148
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468878
G1 F5634.361
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436185
G1 F6102.767
G3 X157.39 Y107.86 I.3 J5.976 E.01735
; LINE_WIDTH: 0.468112
G1 F5644.515
G3 X157.641 Y107.884 I-.233 J3.774 E.00849
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.446959
G1 F5940.032
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409099
G1 F6554.177
G1 X157.808 Y108.158 E.00808
G1 X158.532 Y107.619 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42547
M106 S229.5
G1 F3000
G1 X158.532 Y108.472 E.02578
G3 X158.914 Y108.949 I-1.023 J1.212 E.01859
G1 X158.914 Y107.789 E.03506
G1 X159.297 Y107.789 E.01156
G1 X159.297 Y118.168 E.31365
G1 X159.679 Y118.168 E.01156
G1 X159.679 Y107.789 E.31365
G1 X160.062 Y107.789 E.01156
G1 X160.062 Y118.338 E.31878
M106 S102
; WIPE_START
G1 X160.062 Y116.338 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.364 J-1.161 P1  F30000
G1 X155.471 Y114.899 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S229.5
G1 F3000
G1 X155.471 Y118.168 E.09878
G1 X155.854 Y118.168 E.01156
G1 X155.854 Y115.605 E.07747
G2 X156.236 Y115.838 I1.557 J-2.126 E.01355
G1 X156.236 Y118.168 E.07043
G1 X156.619 Y118.168 E.01156
G1 X156.619 Y115.979 E.06617
G2 X157.002 Y116.036 I.41 J-1.44 E.01172
G1 X157.002 Y118.168 E.06444
G1 X157.384 Y118.168 E.01156
G1 X157.384 Y116.026 E.06472
G2 X157.767 Y115.937 I-.454 J-2.797 E.01188
G1 X157.767 Y118.168 E.06743
G1 X158.149 Y118.168 E.01156
G1 X158.149 Y115.77 E.07246
G2 X158.532 Y115.485 I-1.389 J-2.261 E.01444
G1 X158.532 Y118.168 E.08109
G1 X158.914 Y118.168 E.01156
G1 X158.914 Y115.008 E.0955
G2 X158.914 Y112.949 I-1.784 J-1.029 E.06514
G1 X158.914 Y111.008 E.05867
G3 X158.532 Y111.485 I-1.406 J-.736 E.0186
G1 X158.532 Y112.472 E.02983
G2 X158.149 Y112.187 I-1.774 J1.979 E.01444
G1 X158.149 Y111.568 E.0187
M106 S102
G1 X157.584 Y111.879 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116624
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149232
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.18005
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144711
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116525
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187629
G1 F15000
G1 X156.893 Y111.979 E.00531
G1 X156.867 Y112.002 E.00039
; LINE_WIDTH: 0.149269
G1 X156.833 Y112.021 E.00033
; LINE_WIDTH: 0.116959
G1 X156.666 Y112.078 E.00104
G1 X156.236 Y112.309 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42547
M106 S229.5
G1 F3000
G1 X156.236 Y111.849 E.01388
G2 X155.854 Y111.605 I-4.521 J6.643 E.01373
G1 X155.854 Y112.352 E.0226
G2 X155.471 Y112.744 I1.687 J2.03 E.01658
G1 X155.471 Y110.899 E.05575
M106 S102
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X155.471 Y112.744 E-.70108
G1 X155.572 Y112.627 E-.05892
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/41
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S163.2
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X135.478 Y133.454
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3591.595
M204 S5000
G1 X135.483 Y133.639 E.0055
M106 S229.5
G1 F1800
M106 S163.2
M106 S229.5
G1 X135.487 Y133.823 E.0055
M106 S163.2
M106 S229.5
G1 F720
G1 X135.757 Y144.114 E.30665
M106 S163.2
M106 S229.5
G1 F1800
G1 X135.762 Y144.299 E.0055
M106 S163.2
M106 S229.5
M106 S163.2
G1 F2114.637
G1 X135.763 Y144.336 E.00112
G1 F6364.704
G1 X135.363 Y144.336 E.01191
G1 X124.237 Y144.336 E.3314
G1 X124.238 Y144.299 E.00112
G1 F3591.595
G1 X124.243 Y144.114 E.0055
M106 S229.5
G1 F1800
M106 S163.2
M106 S229.5
G1 X124.248 Y143.93 E.0055
M106 S163.2
M106 S229.5
G1 F720
G1 X124.517 Y133.639 E.30665
M106 S163.2
M106 S229.5
G1 F1800
G1 X124.522 Y133.454 E.0055
M106 S163.2
M106 S229.5
M106 S163.2
G1 F2175.911
G1 X124.523 Y133.41 E.00133
G1 F6364.704
G1 X124.923 Y133.41 E.01191
G1 X135.461 Y133.41 E.31388
; WIPE_START
M204 S10000
G1 X135.483 Y133.639 E-.08737
G1 X135.487 Y133.823 E-.07011
G1 X135.529 Y135.408 E-.60252
; WIPE_END
G1 E-.04 F1800
G1 X127.912 Y135.89 Z2 F30000
G1 X98.853 Y137.727 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.649 Y137.711 E.00657
G3 X98.65 Y134.281 I.227 J-1.715 E.16013
G3 X99.095 Y134.28 I.227 J1.959 E.01434
G3 X98.913 Y137.725 I-.219 J1.716 E.1665
G1 X98.862 Y137.333 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.532 Y137.278 E.00997
G3 X98.701 Y134.671 I.344 J-1.287 E.10907
G3 X99.047 Y134.671 I.175 J1.526 E.01035
G3 X98.918 Y137.323 I-.172 J1.321 E.11823
; WIPE_START
M204 S10000
G1 X98.532 Y137.278 E-.14785
G1 X98.364 Y137.233 E-.06608
G1 X98.206 Y137.156 E-.06675
G1 X97.93 Y136.944 E-.13236
G1 X97.813 Y136.812 E-.067
G1 X97.639 Y136.509 E-.13264
G1 X97.548 Y136.172 E-.13251
G1 X97.546 Y136.133 E-.01482
; WIPE_END
G1 E-.04 F1800
G1 X97.516 Y141.069 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.508 Y141.047 E.00074
G3 X98.779 Y138.273 I1.375 J-1.048 E.12021
G3 X99.536 Y138.398 I.109 J1.688 E.02486
G3 X97.657 Y141.218 I-.653 J1.6 E.19689
G1 X97.557 Y141.112 E.00468
G1 X97.811 Y140.809 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.647 Y140.507 E.01024
G3 X98.806 Y138.665 I1.236 J-.508 E.07577
G3 X99.221 Y138.706 I.067 J1.431 E.01248
G3 X97.851 Y140.848 I-.339 J1.292 E.14991
; WIPE_START
M204 S10000
M73 P52 R11
G1 X97.647 Y140.507 E-.1512
G1 X97.548 Y140.173 E-.13214
G1 X97.537 Y139.998 E-.06682
G1 X97.548 Y139.823 E-.06662
G1 X97.639 Y139.486 E-.13258
G1 X97.813 Y139.183 E-.1326
G1 X97.93 Y139.052 E-.06683
G1 X97.953 Y139.034 E-.01123
; WIPE_END
G1 E-.04 F1800
G1 X105.419 Y137.448 Z2 F30000
G1 X124.13 Y133.474 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X123.84 Y144.522 E.35537
G1 X95.602 Y144.522 E.90803
G1 X95.602 Y133.474 E.35525
G1 X124.07 Y133.474 E.91541
; WIPE_START
G1 X124.028 Y135.474 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.655 Y135.197 Z2 F30000
G1 X149.902 Y134.534 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5895.652
G1 X149.926 Y134.526 E.00081
G3 X150.15 Y134.481 I.45 J1.67 E.00735
G3 X150.595 Y134.48 I.227 J1.954 E.01434
G3 X149.713 Y134.599 I-.219 J1.716 E.32048
G1 X149.845 Y134.553 E.00452
G1 X150.028 Y134.906 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.201 Y134.871 I.347 J1.286 E.00524
G3 X150.547 Y134.871 I.175 J1.524 E.01035
G3 X149.971 Y134.922 I-.172 J1.321 E.23191
; WIPE_START
M204 S10000
G1 X150.201 Y134.871 E-.08948
G1 X150.547 Y134.871 E-.13174
G1 X150.722 Y134.905 E-.06753
G1 X151.044 Y135.039 E-.13266
G1 X151.32 Y135.251 E-.13235
G1 X151.437 Y135.383 E-.06703
G1 X151.611 Y135.685 E-.13239
G1 X151.616 Y135.702 E-.00682
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.474 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.478 E.32169
G1 X160.398 Y143.478 E.20908
G1 X160.398 Y144.522 E.03356
G1 X136.16 Y144.522 E.7794
G1 X135.87 Y133.474 E.35537
G1 X153.836 Y133.474 E.57771
G1 X154.288 Y133.659 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.086 E.28078
G1 X160.79 Y143.086 E.19367
G1 X160.79 Y144.914 E.05445
G1 X95.21 Y144.914 E1.9534
G1 X95.21 Y133.082 E.35243
G1 X160.79 Y133.082 E1.9534
G1 X160.79 Y133.659 E.0172
G1 X154.348 Y133.659 E.19189
M204 S10000
G1 X154.092 Y133.371 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22821
G1 F12952.669
G1 X160.594 Y133.371 E.09517
; WIPE_START
G1 X158.594 Y133.371 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.918 Z2 F30000
G1 X160.194 Y144 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.67959
G1 F3769.614
G1 X153.693 Y144 E.327
G1 X152.221 Y144.174 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.344 Y144.174 E.03611
G1 X153.344 Y143.668 E.01625
G1 X143.498 Y133.822 E.44775
G1 X143.205 Y133.822 E.00942
G1 X137.068 Y139.96 E.27911
G1 X137.143 Y142.819 E.09196
G1 X138.498 Y144.174 E.06161
G1 X140.53 Y144.174 E.06536
G1 X148.308 Y136.396 E.3537
G3 X150.573 Y134.131 I2.095 J-.17 E.11711
G1 X150.881 Y133.822 E.01402
G1 X151.174 Y133.822 E.00942
G1 X153.548 Y136.196 E.10793
G1 X153.548 Y138.832 E.08477
G1 X148.206 Y144.174 E.24291
G1 X146.174 Y144.174 E.06536
G1 X136.936 Y134.936 E.42008
G1 X136.907 Y133.822 E.03583
G1 X137.421 Y133.822 E.01653
G1 X136.239 Y133.833 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.352945
G1 F7741.315
G1 X136.509 Y144.163 E.25308
G1 X136.819 Y144.163 E.00759
G1 X136.549 Y133.833 E.25308
G1 X136.299 Y133.833 E.00613
G1 X135.967 Y144.625 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22852
G1 F12931.035
G1 X124.033 Y144.625 E.17495
G1 X123.761 Y133.833 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.352945
G1 F7741.315
G1 X123.451 Y133.833 E.0076
G1 X123.181 Y144.163 E.25308
G1 X123.491 Y144.163 E.00759
G1 X123.76 Y133.893 E.25161
G1 X99.558 Y134.177 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406002
G1 F6610.091
G1 X99.415 Y133.938 E.00799
; LINE_WIDTH: 0.445714
G1 F5958.391
G1 X99.403 Y133.92 E.00068
; LINE_WIDTH: 0.467469
G1 F5653.067
G1 X99.391 Y133.902 E.00072
G2 X99.129 Y133.878 I-.466 J3.582 E.00883
; LINE_WIDTH: 0.4372
G1 F6087.048
G2 X98.585 Y133.88 I-.244 J6.259 E.01697
; LINE_WIDTH: 0.468691
G1 F5636.839
G1 X98.359 Y133.902 E.00763
G1 X98.335 Y133.938 E.00145
; LINE_WIDTH: 0.406095
G1 F6608.399
G1 X98.192 Y134.177 E.00799
G1 X96.938 Y135.246 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X97.699 Y134.287 I2.253 J1.007 E.03979
G1 X97.54 Y134.191 E.00598
G1 X97.642 Y134.022 E.00637
G2 X97.15 Y133.822 I-.346 J.146 E.01897
G1 X95.95 Y135.022 E.05454
G1 X95.95 Y140.006 E.16028
G1 X97.346 Y141.401 E.06346
G1 X97.299 Y141.349 E.00226
G1 X95.95 Y142.698 E.06134
G1 X95.95 Y144.174 E.04746
G1 X96.103 Y144.174 E.0049
G1 X97.747 Y141.739 F30000
G1 F5895.652
G3 X97.454 Y141.51 I.495 J-.935 E.01203
G1 X100.118 Y144.174 E.12113
G1 X102.15 Y144.174 E.06536
G1 X112.502 Y133.822 E.47073
G1 X112.795 Y133.822 E.00942
G1 X122.83 Y143.858 E.45637
G1 X122.965 Y138.711 E.16556
G1 X117.502 Y144.174 E.24841
G1 X115.47 Y144.174 E.06536
G1 X105.119 Y133.822 E.47073
G1 X104.826 Y133.822 E.00942
G1 X100.226 Y138.422 E.20919
G2 X99.767 Y138.124 I-1.346 J1.567 E.01766
G3 X99.915 Y137.799 I.181 J-.114 E.01359
G2 X100.668 Y137.048 I-1.527 J-2.286 E.03441
G1 X107.794 Y144.174 E.32404
G1 X109.826 Y144.174 E.06536
G1 X120.178 Y133.822 E.47073
G1 X120.471 Y133.822 E.00942
G1 X123.026 Y136.378 E.11621
G1 X123.069 Y134.75 E.05236
G1 X99.324 Y137.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119058
G1 F15000
G2 X99.138 Y137.966 I.18 J.809 E.00119
; LINE_WIDTH: 0.149907
G1 X99.131 Y137.97 E.00006
; LINE_WIDTH: 0.165622
G1 X99.115 Y137.984 E.00021
; LINE_WIDTH: 0.181952
G1 X99.099 Y137.998 E.00024
G1 X99.133 Y138.026 E.00049
; LINE_WIDTH: 0.142534
G1 X99.159 Y138.039 E.00023
; LINE_WIDTH: 0.11609
G1 X99.326 Y138.096 E.00102
G1 X99.099 Y137.998 F30000
; LINE_WIDTH: 0.188439
G1 F15000
G1 X98.651 Y137.998 E.00514
; LINE_WIDTH: 0.190939
G1 X98.635 Y137.984 E.00025
; LINE_WIDTH: 0.152405
G1 X98.591 Y137.956 E.00045
; LINE_WIDTH: 0.116114
G1 X98.426 Y137.9 E.00101
; WIPE_START
G1 X98.591 Y137.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.39 Y130.538 Z2 F30000
G1 X104.941 Y111.767 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.76 Y111.676 E.00651
G3 X105.398 Y108.462 I.862 J-1.499 E.13844
G1 X105.611 Y108.448 E.00687
G3 X104.997 Y111.789 I.011 J1.729 E.19556
G1 X105.114 Y111.413 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.45 Y108.852 I.508 J-1.236 E.10439
G1 X105.613 Y108.841 E.00486
G3 X105.17 Y111.435 I.009 J1.336 E.13907
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15515
G1 X104.563 Y110.993 E-.13321
G1 X104.467 Y110.848 E-.06611
G1 X104.389 Y110.69 E-.0668
G1 X104.301 Y110.365 E-.12798
G1 X104.286 Y110.178 E-.07112
G1 X104.333 Y109.832 E-.13281
G1 X104.338 Y109.815 E-.00682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.036 J1.216 P1  F30000
G1 X156.055 Y111.338 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.902 Y111.202 E.00659
G3 X156.898 Y108.262 I1.22 J-1.225 E.12389
G1 X157.111 Y108.248 E.00687
G3 X156.103 Y111.374 I.011 J1.729 E.21002
G1 X156.311 Y111.04 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X156.95 Y108.652 I.811 J-1.062 E.09397
G1 X157.113 Y108.641 E.00486
G3 X156.36 Y111.075 I.009 J1.336 E.14949
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15563
G1 X155.967 Y110.648 E-.06615
G1 X155.889 Y110.49 E-.06679
G1 X155.798 Y110.153 E-.13276
G1 X155.798 Y109.804 E-.13235
G1 X155.833 Y109.632 E-.06677
G1 X155.889 Y109.467 E-.06629
G1 X155.985 Y109.3 E-.07326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.184 J.283 P1  F30000
G1 X156.703 Y112.301 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.912 Y112.262 E.00682
G3 X157.352 Y112.262 I.217 J1.61 E.01419
G3 X156.646 Y112.317 I-.224 J1.715 E.32653
G1 X156.813 Y112.68 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.962 Y112.651 E.00452
G1 X157.125 Y112.64 E.00486
G3 X156.755 Y112.695 I.009 J1.337 E.23899
; WIPE_START
M204 S10000
G1 X156.962 Y112.651 E-.08043
G1 X157.125 Y112.64 E-.06204
G1 X157.3 Y112.652 E-.0666
G1 X157.637 Y112.742 E-.1325
G1 X157.939 Y112.916 E-.13266
G1 X158.071 Y113.033 E-.06671
G1 X158.187 Y113.164 E-.06674
G1 X158.361 Y113.467 E-.13267
G1 X158.375 Y113.517 E-.01965
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.125 J-1.211 P1  F30000
G1 X115.395 Y117.959 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.09 J1.214 P1  F30000
G1 X160.79 Y118.893 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.147 J-1.208 P1  F30000
G1 X153.809 Y118.23 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X114.261 Y118.338 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42244
G1 F6323.777
M73 P52 R10
G1 X115.062 Y117.537 E.03397
G1 X115.062 Y117 E.01609
G1 X113.894 Y118.168 E.04953
G1 X113.357 Y118.168 E.01609
G1 X115.062 Y116.463 E.07229
G1 X115.062 Y115.927 E.01609
G1 X112.82 Y118.168 E.09504
G1 X112.283 Y118.168 E.01609
G1 X115.062 Y115.39 E.1178
G1 X115.062 Y114.853 E.01609
G1 X111.747 Y118.168 E.14055
G1 X111.21 Y118.168 E.01609
G1 X115.062 Y114.316 E.16331
G1 X115.062 Y113.78 E.01609
G1 X110.673 Y118.168 E.18606
G1 X110.136 Y118.168 E.01609
G1 X115.062 Y113.243 E.20882
G1 X115.062 Y112.706 E.01609
G1 X109.6 Y118.168 E.23158
G1 X109.063 Y118.168 E.01609
G1 X115.062 Y112.17 E.25433
G1 X115.062 Y111.633 E.01609
G1 X108.526 Y118.168 E.27709
G1 X107.99 Y118.168 E.01609
G1 X115.062 Y111.096 E.29984
G1 X115.062 Y110.559 E.01609
G1 X107.453 Y118.168 E.3226
G1 X106.916 Y118.168 E.01609
G1 X115.062 Y110.023 E.34535
M73 P53 R10
G1 X115.062 Y109.486 E.01609
G1 X106.379 Y118.168 E.36811
G1 X105.843 Y118.168 E.01609
G1 X115.062 Y108.949 E.39086
G1 X115.062 Y108.412 E.01609
G1 X105.306 Y118.168 E.41362
G1 X104.769 Y118.168 E.01609
G1 X115.062 Y107.876 E.43638
G1 X115.062 Y107.789 E.00261
G1 X114.612 Y107.789 E.01348
G1 X104.233 Y118.168 E.44006
G1 X103.696 Y118.168 E.01609
G1 X114.075 Y107.789 E.44006
G1 X113.539 Y107.789 E.01609
G1 X103.159 Y118.168 E.44006
G1 X102.622 Y118.168 E.01609
G1 X113.002 Y107.789 E.44006
G1 X112.465 Y107.789 E.01609
G1 X102.086 Y118.168 E.44006
G1 X101.549 Y118.168 E.01609
G1 X111.928 Y107.789 E.44006
G1 X111.392 Y107.789 E.01609
G1 X101.012 Y118.168 E.44006
G1 X100.475 Y118.168 E.01609
G1 X110.855 Y107.789 E.44006
G1 X110.318 Y107.789 E.01609
G1 X107.673 Y110.434 E.11214
G2 X107.67 Y109.9 I-2.94 J-.251 E.01602
G1 X109.782 Y107.789 E.08951
G1 X109.245 Y107.789 E.01609
G1 X107.561 Y109.472 E.07138
G2 X107.388 Y109.109 I-2.231 J.841 E.01209
G1 X108.708 Y107.789 E.05597
G1 X108.171 Y107.789 E.01609
G1 X107.158 Y108.802 E.04296
G2 X106.883 Y108.541 I-1.185 J.973 E.01141
G1 X107.635 Y107.789 E.03188
G1 X107.098 Y107.789 E.01609
G1 X106.549 Y108.337 E.02326
G2 X106.164 Y108.186 I-.753 J1.349 E.01245
G1 X106.561 Y107.789 E.01684
G1 X106.025 Y107.789 E.01609
G1 X105.694 Y108.119 E.01401
G2 X105.093 Y108.184 I-.067 J2.201 E.01819
G1 X105.488 Y107.789 E.01675
G1 X104.951 Y107.789 E.01609
G1 X95.935 Y116.805 E.38225
G1 X95.935 Y117.341 E.01609
G1 X103.63 Y109.646 E.32625
G2 X103.564 Y110.249 I2.321 J.559 E.01822
G1 X95.935 Y117.878 E.32346
G1 X95.935 Y118.168 E.0087
G1 X96.182 Y118.168 E.00739
G1 X103.632 Y110.718 E.31589
G2 X103.784 Y111.103 I1.496 J-.366 E.01245
G1 X96.718 Y118.168 E.29955
G1 X97.255 Y118.168 E.01609
G1 X103.987 Y111.436 E.28542
G2 X104.249 Y111.712 I1.232 J-.908 E.01141
G1 X97.792 Y118.168 E.27375
G1 X98.329 Y118.168 E.01609
G1 X104.555 Y111.941 E.264
G2 X104.919 Y112.115 I1.206 J-2.062 E.01208
G1 X98.865 Y118.168 E.25665
G1 X99.402 Y118.168 E.01609
G1 X105.346 Y112.224 E.25202
G2 X105.88 Y112.227 I.283 J-2.936 E.01602
G1 X99.769 Y118.338 E.25909
G1 X95.766 Y116.438 F30000
G1 F6323.777
G1 X104.414 Y107.789 E.36668
G1 X103.878 Y107.789 E.01609
G1 X95.935 Y115.731 E.33674
G1 X95.935 Y115.194 E.01609
G1 X103.341 Y107.789 E.31398
G1 X102.804 Y107.789 E.01609
G1 X95.935 Y114.658 E.29122
G1 X95.935 Y114.121 E.01609
G1 X102.267 Y107.789 E.26847
G1 X101.731 Y107.789 E.01609
G1 X95.935 Y113.584 E.24571
G1 X95.935 Y113.047 E.01609
G1 X101.194 Y107.789 E.22296
G1 X100.657 Y107.789 E.01609
G1 X95.935 Y112.511 E.2002
G1 X95.935 Y111.974 E.01609
G1 X100.121 Y107.789 E.17745
G1 X99.584 Y107.789 E.01609
G1 X95.935 Y111.437 E.15469
G1 X95.935 Y110.901 E.01609
G1 X99.047 Y107.789 E.13194
G1 X98.51 Y107.789 E.01609
G1 X95.935 Y110.364 E.10918
G1 X95.935 Y109.827 E.01609
G1 X97.974 Y107.789 E.08642
G1 X97.437 Y107.789 E.01609
G1 X95.935 Y109.29 E.06367
G1 X95.935 Y108.754 E.01609
G1 X96.9 Y107.789 E.04091
G1 X96.363 Y107.789 E.01609
G1 X95.766 Y108.387 E.02535
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X156.442 Y108.158 F30000
; LINE_WIDTH: 0.409216
G1 F6552.083
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468872
G1 F5634.441
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436332
G1 F6100.485
G3 X157.387 Y107.859 I.301 J6.011 E.01726
; LINE_WIDTH: 0.467865
G1 F5647.794
G3 X157.641 Y107.884 I-.222 J3.681 E.00859
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.446935
G1 F5940.378
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409063
G1 F6554.826
G1 X157.808 Y108.158 E.00807
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.024 P1  F30000
G1 X157.584 Y111.879 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.116629
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149407
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180208
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144865
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116564
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187342
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146202
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116609
G1 X156.666 Y111.88 E.00103
G1 X154.724 Y112.453 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36545
G1 F7441.168
G1 X155.106 Y111.978 E.01552
G1 X154.724 Y111.504 E.01552
G1 X154.724 Y112.393 E.02267
G1 X153.997 Y117.748 F30000
; LINE_WIDTH: 0.41999
G1 F6364.87
G1 X154.16 Y117.82 E.0053
G1 X154.201 Y118.109 E.0087
G1 X160.006 Y118.109 E.17292
G1 X160.006 Y107.848 E.30565
G1 X158.327 Y107.848 E.05
G1 X158.45 Y108.143 E.00951
G1 X158.364 Y108.277 E.00477
G1 X158.642 Y108.496 E.01054
G1 X158.95 Y108.896 E.01503
G1 X159.168 Y109.405 E.0165
G1 X159.248 Y109.953 E.0165
G1 X159.181 Y110.505 E.01654
G1 X158.974 Y111.018 E.01649
G1 X158.642 Y111.461 E.01648
G1 X158.207 Y111.803 E.01648
G1 X158.018 Y111.895 E.00625
G1 X158.044 Y112.015 E.00366
G1 X158.019 Y112.062 E.00162
G1 X158.207 Y112.154 E.00625
G1 X158.608 Y112.461 E.01503
G1 X158.95 Y112.896 E.01648
G1 X159.168 Y113.405 E.0165
G1 X159.247 Y113.954 E.0165
G1 X159.181 Y114.504 E.01652
G1 X158.974 Y115.018 E.0165
G1 X158.642 Y115.461 E.01648
G1 X158.207 Y115.803 E.01649
G1 X157.698 Y116.021 E.0165
G1 X157.15 Y116.101 E.0165
G1 X156.599 Y116.034 E.01652
G1 X156.085 Y115.828 E.01649
G1 X155.642 Y115.496 E.01649
G1 X155.3 Y115.061 E.01648
G1 X155.082 Y114.552 E.0165
G1 X155.004 Y114.003 E.01651
G1 X155.069 Y113.453 E.01649
G1 X155.276 Y112.939 E.01651
G1 X155.59 Y112.519 E.0156
G1 X156.043 Y112.154 E.01734
G1 X156.232 Y112.062 E.00625
G3 X156.245 Y111.9 I.11 J-.073 E.00524
G1 X156.043 Y111.803 E.00666
G1 X155.642 Y111.496 E.01503
G1 X155.3 Y111.061 E.01649
G1 X155.082 Y110.552 E.0165
G1 X155.004 Y110.003 E.01651
G1 X155.069 Y109.453 E.01649
G1 X155.276 Y108.939 E.01651
G1 X155.608 Y108.496 E.01649
G1 X155.886 Y108.277 E.01054
G1 X155.8 Y108.143 E.00477
G1 X155.902 Y107.848 E.00929
G1 X153.997 Y107.848 E.05673
G1 X153.997 Y117.688 E.29312
G1 X154.374 Y117.547 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X154.456 Y117.587 E.00271
G1 X154.507 Y117.732 E.00459
G1 X159.629 Y117.732 E.15257
G1 X159.629 Y115.224 E.07471
; LINE_WIDTH: 0.432938
G1 F6153.57
G1 X159.616 Y114.971 E.00779
; LINE_WIDTH: 0.458833
G1 F5770.445
G1 X159.603 Y114.719 E.00831
; LINE_WIDTH: 0.48515
G1 F5427.04
G1 X159.59 Y114.584 E.00473
; LINE_WIDTH: 0.478888
G1 F5504.998
G1 X159.456 Y114.873 E.01098
; LINE_WIDTH: 0.421122
G1 F6345.825
G1 X159.322 Y115.163 E.00952
G1 X158.941 Y115.691 E.01945
G1 X158.437 Y116.102 E.01945
G1 X157.843 Y116.37 E.01947
G1 X157.2 Y116.475 E.01946
G1 X156.549 Y116.408 E.01953
G1 X155.941 Y116.176 E.01946
G1 X155.413 Y115.795 E.01946
G1 X155.001 Y115.29 E.01944
; LINE_WIDTH: 0.412665
G1 F6490.96
G1 X154.741 Y114.693 E.01903
; LINE_WIDTH: 0.379483
G1 F7130.918
G1 X154.66 Y114.048 E.0173
G1 X154.709 Y113.406 E.01711
; LINE_WIDTH: 0.416242
G1 F6428.772
G1 X154.928 Y112.794 E.01916
G1 X155.291 Y112.29 E.01833
G1 X155.652 Y111.978 E.01406
G1 X155.291 Y111.667 E.01406
G1 X154.927 Y111.163 E.01833
G1 X154.741 Y110.693 E.0149
; LINE_WIDTH: 0.379475
G1 F7131.079
G1 X154.66 Y110.048 E.0173
G1 X154.709 Y109.406 E.01711
; LINE_WIDTH: 0.413762
G1 F6471.765
G1 X154.766 Y109.196 E.00639
; LINE_WIDTH: 0.455885
G1 F5811.63
G1 X154.824 Y108.986 E.00711
; LINE_WIDTH: 0.498009
G1 F5273.702
G1 X154.882 Y108.775 E.00784
; LINE_WIDTH: 0.550434
G1 F4728.935
G1 X154.949 Y108.626 E.00655
G1 X155.206 Y108.291 E.01695
G1 X154.44 Y108.291 E.0307
; LINE_WIDTH: 0.530109
G1 F4926.226
G1 X154.418 Y108.59 E.01155
; LINE_WIDTH: 0.485425
G1 F5423.668
G1 X154.396 Y108.89 E.01049
; LINE_WIDTH: 0.440742
G1 F6032.854
G1 X154.373 Y109.189 E.00943
; LINE_WIDTH: 0.403778
G1 F6650.825
G1 X154.359 Y109.539 E.00998
; LINE_WIDTH: 0.375709
G1 F7211.786
G2 X154.361 Y110.573 I7.856 J.504 E.02721
; LINE_WIDTH: 0.414999
G1 F6450.242
G3 X154.367 Y113.189 I-84.566 J1.524 E.07688
; LINE_WIDTH: 0.379695
G1 F7126.438
G2 X154.361 Y114.573 I12.138 J.751 E.03685
; LINE_WIDTH: 0.416716
G1 F6420.629
G3 X154.374 Y117.487 I-74.776 J1.807 E.08604
G1 X154.756 Y117.35 F30000
; LINE_WIDTH: 0.425497
G1 F6273.251
G2 X156.136 Y117.346 I.589 J-35.09 E.04169
; LINE_WIDTH: 0.458138
G1 F5780.103
G1 X156.299 Y117.326 E.00539
; LINE_WIDTH: 0.50232
G1 F5224.205
G1 X156.462 Y117.305 E.00596
G2 X157.788 Y117.305 I.663 J-12.384 E.04817
; LINE_WIDTH: 0.4946
G1 F5313.496
G1 X158.204 Y117.33 E.01485
; LINE_WIDTH: 0.42552
G1 F6272.881
G2 X159.252 Y117.355 I.732 J-8.742 E.0317
G1 X159.252 Y115.906 E.04381
G1 X158.667 Y116.401 E.02318
G1 X157.993 Y116.733 E.02268
; LINE_WIDTH: 0.468553
G1 F5638.667
G1 X157.875 Y116.782 E.00431
; LINE_WIDTH: 0.502703
G1 F5219.862
G1 X157.757 Y116.831 E.00465
G1 X157.254 Y116.881 E.01836
G1 X156.493 Y116.831 E.02769
; LINE_WIDTH: 0.494608
G1 F5313.408
G1 X156.145 Y116.678 E.01358
; LINE_WIDTH: 0.422692
G1 F6319.588
G1 X155.796 Y116.524 E.01142
G1 X155.183 Y116.094 E.02248
G1 X154.751 Y115.584 E.02004
G2 X154.756 Y117.29 I91.421 J.623 E.05119
G1 X155.109 Y116.998 F30000
; LINE_WIDTH: 0.38038
G1 F7111.955
G1 X156.005 Y116.998 E.02391
G1 X155.378 Y116.694 E.01857
G1 X155.109 Y116.487 E.00907
G1 X155.109 Y116.938 E.01202
G1 X158.817 Y116.825 F30000
; LINE_WIDTH: 0.60474
G1 F4271.831
G2 X158.822 Y116.938 I-.031 J.058 E.01231
G1 X159.59 Y114.584 F30000
; LINE_WIDTH: 0.48082
G1 F5480.703
G1 X159.607 Y114.319 E.00919
; LINE_WIDTH: 0.456336
G1 F5805.293
G1 X159.625 Y114.054 E.00868
G1 X159.595 Y113.458 E.01948
G1 X158.598 Y111.978 F30000
; LINE_WIDTH: 0.429058
G1 F6215.401
G1 X158.941 Y112.266 E.01366
G1 X159.249 Y112.667 E.0154
G1 X159.537 Y113.252 E.01991
; LINE_WIDTH: 0.461562
G1 F5732.833
G1 X159.591 Y113.398 E.00515
G1 X159.629 Y112.733 E.02203
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X159.629 Y111.224 E.04495
; LINE_WIDTH: 0.43294
G1 F6153.53
G1 X159.616 Y110.971 E.00779
; LINE_WIDTH: 0.45884
G1 F5770.34
G1 X159.603 Y110.719 E.00831
; LINE_WIDTH: 0.485155
G1 F5426.979
G1 X159.59 Y110.584 E.00473
; LINE_WIDTH: 0.478888
G1 F5504.998
G1 X159.456 Y110.873 E.01098
; LINE_WIDTH: 0.424599
G1 F6288.017
G1 X159.322 Y111.163 E.00961
G1 X158.941 Y111.691 E.01963
G1 X158.644 Y111.94 E.0117
G1 X159.253 Y111.932 F30000
; LINE_WIDTH: 0.47122
G1 F5603.549
G2 X159.246 Y112.025 I-.027 J.045 E.00719
G1 X159.59 Y110.584 F30000
; LINE_WIDTH: 0.48071
G1 F5482.081
G1 X159.607 Y110.319 E.00918
; LINE_WIDTH: 0.45612
G1 F5808.332
G1 X159.625 Y110.054 E.00867
G1 X159.594 Y109.457 E.0195
G1 X159.591 Y109.397 F30000
; LINE_WIDTH: 0.474101
G1 F5566.109
G2 X159.604 Y108.249 I-35.617 J-.974 E.03912
G1 X158.962 Y108.251 E.02188
G1 X159.268 Y108.652 E.01719
G1 X159.574 Y109.34 E.02566
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5566.109
G1 X159.268 Y108.652 E-.28623
G1 X158.962 Y108.251 E-.19175
G1 X159.604 Y108.249 E-.24407
G1 X159.603 Y108.349 E-.03795
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/41
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S165.75
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X135.413 Y133.656
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y134.751 E.03263
M106 S229.5
G1 X135.413 Y135.846 E.03263
M106 S165.75
M106 S229.5
G1 X135.413 Y136.542 E.02071
M106 S165.75
M106 S229.5
G1 X135.413 Y136.942 E.01191
M106 S165.75
M106 S229.5
G1 F3000
G1 X135.413 Y138.037 E.03263
M106 S165.75
M106 S229.5
G1 F2640
G1 X135.413 Y139.133 E.03263
M106 S165.75
M106 S229.5
G1 F2160
G1 X135.413 Y140.228 E.03263
M106 S165.75
M106 S229.5
G1 F1680
G1 X135.413 Y141.323 E.03263
M106 S165.75
M106 S229.5
G1 F1200
G1 X135.413 Y142.419 E.03263
M106 S165.75
M106 S229.5
G1 F720
G1 X135.438 Y143.357 E.02796
M106 S165.75
M106 S229.5
G1 F3000
G1 X135.462 Y144.295 E.02796
M106 S165.75
M106 S229.5
M106 S165.75
G1 F3402.509
G1 X135.463 Y144.333 E.00112
G1 F6364.704
G1 X135.063 Y144.333 E.01191
G1 X124.537 Y144.333 E.31353
G1 X124.538 Y144.295 E.00112
G1 F3591.598
G1 X124.543 Y144.111 E.0055
M106 S229.5
G1 F1800
M106 S165.75
M106 S229.5
G1 X124.548 Y143.926 E.0055
M106 S165.75
M106 S229.5
G1 F720
G1 X124.817 Y133.635 E.30665
M106 S165.75
M106 S229.5
G1 F1800
G1 X124.822 Y133.451 E.0055
M106 S165.75
M106 S229.5
M106 S165.75
G1 F2175.911
G1 X124.823 Y133.406 E.00133
G1 F6364.704
G1 X125.223 Y133.406 E.01191
G1 X135.177 Y133.406 E.29647
G1 X135.178 Y133.451 E.00133
G1 F3295.759
G1 X135.183 Y133.656 E.00611
M106 S229.5
G1 F1440
G1 X135.353 Y133.656 E.00506
M106 S165.75
; WIPE_START
M204 S10000
G1 X135.413 Y134.751 E-.41686
G1 X135.413 Y135.654 E-.34314
; WIPE_END
G1 E-.04 F1800
G1 X127.793 Y136.086 Z2.2 F30000
G1 X98.9 Y137.723 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.875 Y137.722 E.00079
G3 X98.812 Y134.267 I.006 J-1.728 E.17217
G3 X99.537 Y134.396 I.084 J1.64 E.02389
G3 X99.101 Y137.708 I-.657 J1.598 E.1458
G1 X98.959 Y137.718 E.00455
G1 X98.864 Y137.331 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.701 Y137.318 E.00488
G3 X98.836 Y134.659 I.182 J-1.324 E.11824
G3 X99.222 Y134.701 I.023 J1.548 E.01158
G3 X98.924 Y137.33 I-.339 J1.293 E.11364
; WIPE_START
M204 S10000
G1 X98.701 Y137.318 E-.08486
G1 X98.528 Y137.286 E-.06684
G1 X98.206 Y137.153 E-.13258
G1 X97.93 Y136.94 E-.13237
G1 X97.813 Y136.808 E-.067
G1 X97.639 Y136.506 E-.13262
G1 X97.548 Y136.169 E-.13253
G1 X97.546 Y136.139 E-.0112
; WIPE_END
G1 E-.04 F1800
G1 X97.516 Y141.066 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.507 Y141.044 E.00076
G3 X98.772 Y138.27 I1.375 J-1.048 E.11996
G3 X99.536 Y138.395 I.117 J1.688 E.02511
G3 X97.657 Y141.215 I-.653 J1.601 E.19694
G1 X97.558 Y141.109 E.00465
G1 X97.819 Y140.804 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.798 Y138.662 I1.063 J-.809 E.08589
G3 X99.221 Y138.703 I.076 J1.422 E.01271
G3 X97.857 Y140.851 I-.339 J1.292 E.14966
; WIPE_START
M204 S10000
G1 X97.639 Y140.506 E-.15499
G1 X97.548 Y140.17 E-.13251
G1 X97.537 Y139.994 E-.06681
G1 X97.548 Y139.819 E-.06662
G1 X97.639 Y139.482 E-.13259
G1 X97.813 Y139.18 E-.1326
G1 X97.93 Y139.048 E-.0668
G1 X97.944 Y139.037 E-.00709
; WIPE_END
G1 E-.04 F1800
G1 X105.414 Y137.467 Z2.2 F30000
G1 X124.43 Y133.471 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X124.14 Y144.518 E.35537
G1 X95.602 Y144.518 E.91767
G1 X95.602 Y133.471 E.35525
G1 X124.37 Y133.471 E.92506
; WIPE_START
G1 X124.328 Y135.47 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.955 Y135.186 Z2.2 F30000
G1 X149.95 Y134.517 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F5895.652
G1 X150.15 Y134.481 E.00653
G3 X150.312 Y134.467 I.23 J1.712 E.00521
G3 X151.037 Y134.596 I.084 J1.639 E.0239
G3 X149.894 Y134.536 I-.657 J1.598 E.31157
G1 X150.029 Y134.906 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.336 Y134.859 I.354 J1.289 E.00927
G3 X150.722 Y134.901 I.023 J1.548 E.01158
G3 X149.972 Y134.923 I-.339 J1.293 E.22748
; WIPE_START
M204 S10000
G1 X150.336 Y134.859 E-.14067
G1 X150.549 Y134.868 E-.0809
G1 X150.722 Y134.901 E-.06688
G1 X151.044 Y135.035 E-.13266
G1 X151.32 Y135.248 E-.13238
G1 X151.437 Y135.38 E-.067
G1 X151.611 Y135.682 E-.13239
G1 X151.617 Y135.699 E-.00712
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.471 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.475 E.32169
G1 X160.398 Y143.475 E.20908
G1 X160.398 Y144.518 E.03356
G1 X135.86 Y144.518 E.78905
G1 X135.805 Y142.414 E.0677
G1 X135.805 Y133.471 E.28757
G1 X153.836 Y133.471 E.57981
G1 X154.288 Y133.656 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.082 E.28078
G1 X160.79 Y143.082 E.19367
G1 X160.79 Y144.91 E.05445
G1 X95.21 Y144.91 E1.9534
G1 X95.21 Y133.079 E.35243
G1 X160.79 Y133.079 E1.9534
G1 X160.79 Y133.656 E.0172
G1 X154.348 Y133.656 E.19189
M204 S10000
G1 X154.092 Y133.367 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22826
G1 F12949.174
M73 P54 R10
G1 X160.594 Y133.367 E.09519
; WIPE_START
G1 X158.594 Y133.367 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.915 Z2.2 F30000
G1 X160.194 Y143.996 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.67958
G1 F3769.673
G1 X153.693 Y143.996 E.32699
G1 X136.312 Y141.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.628394
G1 F4099.243
G1 X136.291 Y140.303 E.07366
; LINE_WIDTH: 0.586342
G1 F4416.457
G1 X136.27 Y138.71 E.06837
; LINE_WIDTH: 0.54429
G1 F4786.884
G1 X136.249 Y137.118 E.06308
; LINE_WIDTH: 0.502238
G1 F5225.138
G1 X136.228 Y135.525 E.05779
; LINE_WIDTH: 0.460186
G1 F5751.727
G1 X136.208 Y133.932 E.0525
G1 X136.312 Y141.896 F30000
; LINE_WIDTH: 0.624586
G1 F4126.08
G1 X136.287 Y141.962 E.00327
; LINE_WIDTH: 0.574918
G1 F4511.299
G1 X136.262 Y142.029 E.00299
; LINE_WIDTH: 0.52525
G1 F4975.855
G1 X136.237 Y142.096 E.00271
; LINE_WIDTH: 0.475581
G1 F5547.071
G1 X136.213 Y142.162 E.00243
; LINE_WIDTH: 0.425913
G1 F6266.442
G1 X136.188 Y142.229 E.00215
; LINE_WIDTH: 0.353269
G1 F7733.228
G2 X136.164 Y142.411 I.227 J.123 E.0046
G1 X136.209 Y144.16 E.04289
G1 X136.52 Y144.16 E.0076
G3 X136.471 Y142.292 I144.177 J-4.656 E.04581
; LINE_WIDTH: 0.376245
G1 F7200.198
G1 X136.448 Y142.235 E.00161
; LINE_WIDTH: 0.425913
G1 F6266.442
G1 X136.426 Y142.178 E.00185
; LINE_WIDTH: 0.475581
G1 F5547.071
G1 X136.403 Y142.121 E.00209
; LINE_WIDTH: 0.52525
G1 F4975.855
G1 X136.38 Y142.065 E.00233
; LINE_WIDTH: 0.574918
G1 F4511.299
G1 X136.357 Y142.008 E.00257
; LINE_WIDTH: 0.624586
G1 F4126.08
G1 X136.334 Y141.951 E.00281
G1 X135.667 Y144.622 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.2285
G1 F12932.429
G1 X124.333 Y144.622 E.16614
G1 X124.061 Y133.829 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.352955
G1 F7741.065
G1 X123.751 Y133.829 E.0076
G1 X123.481 Y144.16 E.25309
G1 X123.791 Y144.16 E.0076
G1 X124.06 Y133.889 E.25162
; WIPE_START
G1 X124.007 Y135.888 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.551 Y134.725 Z2.2 F30000
G1 X137.426 Y133.819 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X136.607 Y133.819 E.02633
G1 X136.628 Y134.628 E.02603
G1 X146.17 Y144.17 E.43392
G1 X148.21 Y144.17 E.06559
G1 X153.548 Y138.832 E.24275
G1 X153.548 Y136.196 E.08477
G1 X151.171 Y133.819 E.10809
G1 X150.885 Y133.819 E.00919
G1 X150.575 Y134.128 E.01408
G2 X148.308 Y136.396 I-.174 J2.093 E.11729
G1 X140.534 Y144.17 E.35355
G1 X138.494 Y144.17 E.06559
G1 X136.835 Y142.511 E.07545
G1 X136.776 Y140.252 E.07265
G1 X143.209 Y133.819 E.29256
G1 X143.495 Y133.819 E.00919
G1 X153.344 Y143.668 E.44791
G1 X153.344 Y144.17 E.01613
G1 X152.218 Y144.17 E.03623
; WIPE_START
G1 X153.344 Y144.17 E-.4281
G1 X153.344 Y143.668 E-.19066
G1 X153.081 Y143.405 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X145.467 Y142.884 Z2.2 F30000
G1 X100.944 Y139.834 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F5895.652
G2 X100.228 Y138.421 I-2.07 J.161 E.05228
G1 X104.829 Y133.819 E.20926
G1 X105.115 Y133.819 E.00919
G1 X115.466 Y144.17 E.47073
G1 X117.506 Y144.17 E.06559
G1 X123.273 Y138.403 E.26225
G1 X123.318 Y136.67 E.05575
G1 X120.467 Y133.819 E.12966
G1 X120.181 Y133.819 E.00919
G1 X109.83 Y144.17 E.47073
G1 X107.79 Y144.17 E.06559
G1 X100.667 Y137.047 E.32394
G2 X100.888 Y135.475 I-1.833 J-1.059 E.05231
G1 X99.558 Y134.174 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405908
G1 F6611.787
G1 X99.415 Y133.935 E.00799
; LINE_WIDTH: 0.445616
G1 F5959.834
G1 X99.403 Y133.917 E.00069
; LINE_WIDTH: 0.46837
G1 F5641.094
G1 X99.391 Y133.899 E.00072
G2 X99.139 Y133.875 I-.491 J3.87 E.00851
; LINE_WIDTH: 0.436746
G1 F6094.069
G2 X98.584 Y133.877 I-.258 J6.141 E.01726
; LINE_WIDTH: 0.468695
G1 F5636.785
G1 X98.359 Y133.899 E.00763
G1 X98.335 Y133.935 E.00145
; LINE_WIDTH: 0.405896
G1 F6612.018
G1 X98.192 Y134.174 E.00799
G1 X95.95 Y136.65 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X95.95 Y135.022 E.05236
G1 X97.153 Y133.819 E.0547
G3 X97.641 Y134.021 I.143 J.345 E.01884
G1 X97.54 Y134.188 E.00629
G1 X97.699 Y134.284 E.00597
G2 X96.937 Y135.246 I1.489 J1.963 E.03988
G1 X98.426 Y137.897 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116254
G1 F15000
G1 X98.591 Y137.952 E.00101
; LINE_WIDTH: 0.143965
G1 X98.62 Y137.967 E.00026
; LINE_WIDTH: 0.187636
G1 X98.651 Y137.994 E.00047
G1 X99.098 Y137.994 E.00511
G1 X99.115 Y137.98 F30000
; LINE_WIDTH: 0.165575
G1 F15000
G1 X99.131 Y137.966 E.00021
; LINE_WIDTH: 0.149839
G1 X99.137 Y137.963 E.00006
; LINE_WIDTH: 0.11902
G3 X99.324 Y137.897 I.366 J.741 E.00119
G1 X99.326 Y138.092 F30000
; LINE_WIDTH: 0.116103
G1 F15000
G1 X99.158 Y138.035 E.00102
; LINE_WIDTH: 0.142513
G1 X99.133 Y138.022 E.00023
; LINE_WIDTH: 0.181917
G1 X99.098 Y137.994 E.00049
G1 X99.115 Y137.98 E.00024
; WIPE_START
G1 X99.098 Y137.994 E-.24761
G1 X99.133 Y138.022 E-.51239
; WIPE_END
G1 E-.04 F1800
G1 X97.142 Y141.137 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G2 X97.301 Y141.347 I.817 J-.451 E.00849
G1 X95.95 Y142.698 E.06141
G1 X95.95 Y140.006 E.08656
G2 X97.441 Y141.497 I35.097 J-33.606 E.06781
G1 X100.114 Y144.17 E.12156
G1 X102.154 Y144.17 E.06559
G1 X112.505 Y133.819 E.47073
G1 X112.791 Y133.819 E.00919
G1 X123.122 Y144.15 E.46982
G1 X123.165 Y142.522 E.05236
; WIPE_START
G1 X123.122 Y144.15 E-.61876
G1 X122.859 Y143.887 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X119.141 Y137.222 Z2.2 F30000
G1 X104.941 Y111.767 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X104.759 Y111.677 E.00651
G3 X105.398 Y108.462 I.859 J-1.5 E.13863
G1 X105.604 Y108.448 E.00664
G3 X104.996 Y111.79 I.014 J1.729 E.19556
G1 X105.113 Y111.414 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.45 Y108.852 I.506 J-1.237 E.10456
G1 X105.607 Y108.841 E.00468
G3 X105.17 Y111.436 I.012 J1.336 E.13907
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15523
G1 X104.563 Y110.993 E-.13317
G1 X104.467 Y110.848 E-.06615
G1 X104.389 Y110.69 E-.06679
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.06659
G1 X104.333 Y109.832 E-.13281
G1 X104.338 Y109.815 E-.00674
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.036 J1.216 P1  F30000
G1 X156.09 Y111.364 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.071 Y111.353 E.0007
G3 X156.898 Y108.262 I1.047 J-1.376 E.13137
G1 X157.104 Y108.248 E.00664
G3 X156.259 Y111.477 I.014 J1.729 E.204
G1 X156.14 Y111.398 E.00462
G1 X156.31 Y111.041 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X156.95 Y108.652 I.809 J-1.064 E.09412
G1 X157.107 Y108.641 E.00468
G3 X156.359 Y111.076 I.012 J1.336 E.14951
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15569
G1 X155.967 Y110.648 E-.06614
G1 X155.889 Y110.49 E-.06679
G1 X155.798 Y110.153 E-.13278
G1 X155.798 Y109.804 E-.13235
G1 X155.833 Y109.632 E-.06677
G1 X155.889 Y109.467 E-.0663
G1 X155.985 Y109.3 E-.07316
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.188 J.265 P1  F30000
G1 X156.657 Y112.314 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.681 Y112.307 E.00081
G3 X156.919 Y112.261 I.449 J1.67 E.00779
G3 X157.352 Y112.262 I.211 J1.585 E.01397
G3 X156.464 Y112.382 I-.222 J1.715 E.32022
G1 X156.6 Y112.333 E.00466
G1 X156.808 Y112.68 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.968 Y112.651 E.00484
G3 X157.3 Y112.652 I.161 J1.215 E.00991
G3 X156.75 Y112.696 I-.171 J1.326 E.23369
; WIPE_START
M204 S10000
G1 X156.968 Y112.651 E-.08451
G1 X157.3 Y112.652 E-.12604
G1 X157.637 Y112.742 E-.13252
G1 X157.794 Y112.82 E-.06679
G1 X157.939 Y112.917 E-.06615
G1 X158.187 Y113.164 E-.13316
G1 X158.361 Y113.467 E-.13267
G1 X158.374 Y113.513 E-.01815
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.125 J-1.211 P1  F30000
G1 X115.395 Y117.959 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.09 J1.214 P1  F30000
G1 X160.79 Y118.893 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.147 J-1.208 P1  F30000
G1 X153.809 Y118.23 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.231 Y117.578 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42501
G1 F6281.242
G1 X107.68 Y110.026 E.32234
G3 X107.654 Y110.541 I-2.112 J.151 E.01559
G1 X114.92 Y117.807 E.31018
G1 X114.858 Y117.807 E.00188
G1 X114.858 Y118.168 E.01089
G1 X114.741 Y118.168 E.00354
G1 X107.535 Y110.962 E.30758
G3 X107.345 Y111.313 I-2.74 J-1.258 E.01204
G1 X114.201 Y118.168 E.29263
G1 X113.66 Y118.168 E.01631
G1 X107.106 Y111.614 E.27977
G3 X106.814 Y111.862 I-1.786 J-1.805 E.01158
G1 X113.12 Y118.168 E.26917
G1 X112.58 Y118.168 E.01631
G1 X106.47 Y112.059 E.26077
G3 X106.063 Y112.192 I-.893 J-2.044 E.01295
G1 X112.039 Y118.168 E.25509
G1 X111.499 Y118.168 E.01631
G1 X105.57 Y112.239 E.25308
G3 X104.898 Y112.108 I.07 J-2.142 E.02075
G1 X110.958 Y118.168 E.2587
G1 X110.418 Y118.168 E.01631
G1 X100.039 Y107.789 E.44304
G1 X100.579 Y107.789 E.01631
G1 X103.696 Y110.906 E.13304
G3 X103.563 Y110.233 I2.052 J-.754 E.02079
G1 X101.119 Y107.789 E.10432
G1 X101.66 Y107.789 E.01631
G1 X103.611 Y109.74 E.08331
G3 X103.745 Y109.333 I2.178 J.486 E.01295
G1 X102.2 Y107.789 E.06593
G1 X102.74 Y107.789 E.01631
G1 X103.941 Y108.99 E.05126
G3 X104.19 Y108.698 I2.056 J1.496 E.01158
G1 X103.281 Y107.789 E.03879
G1 X103.821 Y107.789 E.01631
G1 X104.491 Y108.458 E.02859
G3 X104.841 Y108.269 I1.608 J2.548 E.01204
G1 X104.361 Y107.789 E.02048
M73 P55 R10
G1 X104.902 Y107.789 E.01631
G1 X105.263 Y108.15 E.01541
G3 X105.778 Y108.124 I.358 J2.005 E.0156
G1 X105.442 Y107.789 E.01432
G1 X105.983 Y107.789 E.01631
G1 X115.062 Y116.868 E.38754
G1 X115.062 Y116.328 E.01631
G1 X106.523 Y107.789 E.36448
G1 X107.063 Y107.789 E.01631
G1 X115.062 Y115.787 E.34141
G1 X115.062 Y115.247 E.01631
G1 X107.604 Y107.789 E.31835
G1 X108.144 Y107.789 E.01631
G1 X115.062 Y114.707 E.29528
G1 X115.062 Y114.166 E.01631
G1 X108.684 Y107.789 E.27222
G1 X109.225 Y107.789 E.01631
G1 X115.062 Y113.626 E.24915
G1 X115.062 Y113.085 E.01631
G1 X109.765 Y107.789 E.22609
G1 X110.305 Y107.789 E.01631
G1 X115.062 Y112.545 E.20302
G1 X115.062 Y112.005 E.01631
G1 X110.846 Y107.789 E.17996
G1 X111.386 Y107.789 E.01631
G1 X115.062 Y111.464 E.15689
G1 X115.062 Y110.924 E.01631
G1 X111.926 Y107.789 E.13383
G1 X112.467 Y107.789 E.01631
G1 X115.062 Y110.384 E.11076
G1 X115.062 Y109.843 E.01631
G1 X113.007 Y107.789 E.0877
G1 X113.548 Y107.789 E.01631
G1 X115.062 Y109.303 E.06463
G1 X115.062 Y108.763 E.01631
G1 X114.088 Y107.789 E.04157
G1 X114.628 Y107.789 E.01631
G1 X115.231 Y108.392 E.02575
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X156.442 Y108.158 F30000
; LINE_WIDTH: 0.409227
G1 F6551.894
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.46887
G1 F5634.468
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436478
G1 F6098.218
G3 X157.384 Y107.859 I.303 J6.069 E.01719
; LINE_WIDTH: 0.467623
G1 F5651.016
G3 X157.641 Y107.884 I-.214 J3.617 E.00867
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.44705
G1 F5938.683
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409223
G1 F6551.963
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J-.024 P1  F30000
G1 X157.584 Y111.88 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.116597
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149308
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180184
G1 X157.358 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144905
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116608
G1 X157.584 Y112.078 E.00103
G1 X157.358 Y111.979 F30000
; LINE_WIDTH: 0.187342
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146173
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116596
G1 X156.666 Y111.88 E.00103
G1 X154.724 Y112.453 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36544
G1 F7441.399
G1 X155.106 Y111.979 E.01552
G1 X154.724 Y111.504 E.01552
G1 X154.724 Y112.393 E.02266
G1 X153.997 Y117.748 F30000
; LINE_WIDTH: 0.41999
G1 F6364.87
G1 X154.16 Y117.82 E.0053
G1 X154.201 Y118.109 E.0087
G1 X160.006 Y118.109 E.17292
G1 X160.006 Y107.848 E.30565
G1 X158.327 Y107.848 E.05
G1 X158.45 Y108.143 E.00952
G1 X158.364 Y108.278 E.00476
G1 X158.642 Y108.496 E.01054
G1 X158.95 Y108.896 E.01503
G1 X159.168 Y109.405 E.0165
G1 X159.247 Y109.954 E.0165
G1 X159.181 Y110.504 E.01652
G1 X158.974 Y111.018 E.0165
G1 X158.642 Y111.461 E.01648
G1 X158.207 Y111.803 E.01649
G1 X158.018 Y111.895 E.00625
G1 X158.044 Y112.015 E.00366
G1 X158.018 Y112.062 E.00161
G1 X158.207 Y112.154 E.00625
G1 X158.608 Y112.461 E.01503
G1 X158.95 Y112.896 E.01649
G1 X159.168 Y113.405 E.0165
G1 X159.247 Y113.954 E.0165
G1 X159.181 Y114.504 E.01652
G1 X158.974 Y115.018 E.0165
G1 X158.642 Y115.461 E.01649
G1 X158.207 Y115.803 E.01648
G1 X157.698 Y116.021 E.0165
G1 X157.15 Y116.101 E.0165
G1 X156.599 Y116.034 E.01652
G1 X156.085 Y115.828 E.0165
G1 X155.642 Y115.496 E.01649
G1 X155.3 Y115.061 E.01648
G1 X155.082 Y114.552 E.0165
G1 X155.004 Y114.003 E.01651
G1 X155.069 Y113.453 E.01649
G1 X155.276 Y112.939 E.01651
G1 X155.59 Y112.519 E.0156
G1 X156.043 Y112.154 E.01734
G1 X156.232 Y112.062 E.00626
G3 X156.245 Y111.9 I.11 J-.073 E.00524
G1 X156.043 Y111.803 E.00667
G1 X155.642 Y111.496 E.01503
G1 X155.3 Y111.061 E.01648
G1 X155.082 Y110.552 E.0165
G1 X155.004 Y110.003 E.01651
G1 X155.069 Y109.453 E.01648
G1 X155.276 Y108.939 E.01651
G1 X155.608 Y108.496 E.01649
G1 X155.886 Y108.278 E.01054
G1 X155.8 Y108.143 E.00477
G1 X155.902 Y107.848 E.00929
G1 X153.997 Y107.848 E.05673
G1 X153.997 Y117.688 E.29312
G1 X154.374 Y117.547 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X154.456 Y117.587 E.00271
G1 X154.507 Y117.732 E.00459
G1 X159.629 Y117.732 E.15257
G1 X159.629 Y115.224 E.07472
; LINE_WIDTH: 0.432938
G1 F6153.57
G1 X159.616 Y114.971 E.00779
; LINE_WIDTH: 0.458833
G1 F5770.445
G1 X159.603 Y114.719 E.00831
; LINE_WIDTH: 0.48514
G1 F5427.163
G1 X159.59 Y114.584 E.00473
; LINE_WIDTH: 0.478873
G1 F5505.187
G1 X159.456 Y114.873 E.01098
; LINE_WIDTH: 0.421121
G1 F6345.832
G1 X159.323 Y115.163 E.00952
G1 X158.941 Y115.691 E.01946
G1 X158.437 Y116.102 E.01945
G1 X157.843 Y116.37 E.01946
G1 X157.2 Y116.475 E.01947
G1 X156.55 Y116.408 E.01952
G1 X155.941 Y116.176 E.01946
G1 X155.413 Y115.795 E.01945
G1 X155.001 Y115.29 E.01945
; LINE_WIDTH: 0.412665
G1 F6490.96
G1 X154.741 Y114.694 E.01902
; LINE_WIDTH: 0.379483
G1 F7130.921
G1 X154.66 Y114.048 E.0173
G1 X154.709 Y113.406 E.01711
; LINE_WIDTH: 0.416243
G1 F6428.76
G1 X154.928 Y112.794 E.01916
G1 X155.291 Y112.29 E.01833
G1 X155.652 Y111.978 E.01406
G1 X155.291 Y111.667 E.01406
G1 X154.928 Y111.163 E.01833
G1 X154.741 Y110.693 E.0149
; LINE_WIDTH: 0.379483
G1 F7130.91
G1 X154.66 Y110.048 E.0173
G1 X154.709 Y109.406 E.0171
; LINE_WIDTH: 0.413759
G1 F6471.823
G1 X154.766 Y109.196 E.00639
; LINE_WIDTH: 0.455875
G1 F5811.771
G1 X154.824 Y108.986 E.00711
; LINE_WIDTH: 0.497992
G1 F5273.895
G1 X154.882 Y108.775 E.00784
; LINE_WIDTH: 0.550442
G1 F4728.865
G1 X154.949 Y108.626 E.00655
G1 X155.206 Y108.291 E.01695
G1 X154.44 Y108.291 E.0307
; LINE_WIDTH: 0.530114
G1 F4926.176
G1 X154.418 Y108.59 E.01156
; LINE_WIDTH: 0.48542
G1 F5423.729
G1 X154.396 Y108.89 E.0105
; LINE_WIDTH: 0.440727
G1 F6033.081
G1 X154.373 Y109.189 E.00944
; LINE_WIDTH: 0.40376
G1 F6651.147
G1 X154.359 Y109.539 E.00998
; LINE_WIDTH: 0.375702
G1 F7211.946
G2 X154.361 Y110.573 I7.859 J.504 E.02721
; LINE_WIDTH: 0.414999
G1 F6450.251
G3 X154.367 Y113.189 I-84.684 J1.524 E.07688
; LINE_WIDTH: 0.37969
G1 F7126.541
G2 X154.361 Y114.573 I12.152 J.751 E.03685
; LINE_WIDTH: 0.416716
G1 F6420.623
G3 X154.374 Y117.487 I-74.696 J1.806 E.08604
G1 X154.756 Y117.35 F30000
; LINE_WIDTH: 0.425501
G1 F6273.19
G2 X156.136 Y117.346 I.589 J-35.101 E.0417
; LINE_WIDTH: 0.45814
G1 F5780.068
G1 X156.299 Y117.326 E.00539
; LINE_WIDTH: 0.502318
G1 F5224.228
G1 X156.462 Y117.305 E.00596
G2 X157.788 Y117.305 I.663 J-12.386 E.04816
; LINE_WIDTH: 0.494608
G1 F5313.408
G1 X158.204 Y117.33 E.01485
; LINE_WIDTH: 0.425518
G1 F6272.912
G2 X159.252 Y117.355 I.732 J-8.747 E.0317
G1 X159.252 Y115.906 E.04381
G1 X158.666 Y116.401 E.02318
G1 X157.993 Y116.733 E.02267
; LINE_WIDTH: 0.46854
G1 F5638.833
G1 X157.875 Y116.782 E.00431
; LINE_WIDTH: 0.502699
G1 F5219.9
G1 X157.757 Y116.831 E.00465
G1 X157.254 Y116.881 E.01836
G1 X156.493 Y116.831 E.02768
; LINE_WIDTH: 0.494593
G1 F5313.585
G1 X156.145 Y116.678 E.01358
; LINE_WIDTH: 0.422692
G1 F6319.584
G1 X155.796 Y116.524 E.01142
G1 X155.183 Y116.094 E.02247
G1 X154.751 Y115.584 E.02005
G2 X154.756 Y117.29 I91.339 J.624 E.05119
G1 X155.109 Y116.998 F30000
; LINE_WIDTH: 0.38038
G1 F7111.955
G1 X156.005 Y116.998 E.02391
G1 X155.378 Y116.694 E.01858
G1 X155.109 Y116.487 E.00907
G1 X155.109 Y116.938 E.01202
G1 X158.817 Y116.825 F30000
; LINE_WIDTH: 0.60474
G1 F4271.831
G2 X158.822 Y116.938 I-.031 J.058 E.01231
G1 X159.59 Y114.584 F30000
; LINE_WIDTH: 0.480805
G1 F5480.892
G1 X159.607 Y114.319 E.00919
; LINE_WIDTH: 0.456335
G1 F5805.303
G1 X159.625 Y114.054 E.00868
G1 X159.595 Y113.458 E.01948
G1 X158.598 Y111.978 F30000
; LINE_WIDTH: 0.429058
G1 F6215.398
G1 X158.941 Y112.266 E.01366
G1 X159.249 Y112.667 E.0154
G1 X159.537 Y113.252 E.01991
; LINE_WIDTH: 0.461563
G1 F5732.817
G1 X159.591 Y113.398 E.00515
G1 X159.629 Y112.733 E.02202
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X159.629 Y111.224 E.04496
; LINE_WIDTH: 0.432935
G1 F6153.61
G1 X159.616 Y110.971 E.00779
; LINE_WIDTH: 0.458825
G1 F5770.548
G1 X159.603 Y110.719 E.00831
; LINE_WIDTH: 0.485135
G1 F5427.224
G1 X159.59 Y110.584 E.00473
; LINE_WIDTH: 0.478873
G1 F5505.187
G1 X159.456 Y110.873 E.01098
; LINE_WIDTH: 0.424598
G1 F6288.03
G1 X159.322 Y111.163 E.00961
G1 X158.941 Y111.691 E.01963
G1 X158.644 Y111.94 E.0117
G1 X159.253 Y111.932 F30000
; LINE_WIDTH: 0.4712
G1 F5603.811
G2 X159.246 Y112.025 I-.027 J.045 E.00719
G1 X159.59 Y110.584 F30000
; LINE_WIDTH: 0.4808
G1 F5480.954
G1 X159.607 Y110.319 E.00919
; LINE_WIDTH: 0.456324
G1 F5805.463
G1 X159.625 Y110.054 E.00868
G1 X159.595 Y109.458 E.01948
G1 X159.591 Y109.398 F30000
; LINE_WIDTH: 0.474085
G1 F5566.32
G2 X159.604 Y108.249 I-35.773 J-.975 E.03913
G1 X158.962 Y108.251 E.02188
G1 X159.268 Y108.652 E.01719
G1 X159.574 Y109.341 E.02568
; WIPE_START
G1 X159.268 Y108.652 E-.28646
G1 X158.962 Y108.251 E-.19177
G1 X159.604 Y108.249 E-.24412
G1 X159.603 Y108.348 E-.03765
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.24 J-1.193 P1  F30000
G1 X110.047 Y118.338 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42501
G1 F6281.242
G1 X99.498 Y107.789 E.45029
G1 X98.958 Y107.789 E.01631
G1 X109.337 Y118.168 E.44304
G1 X108.797 Y118.168 E.01631
G1 X98.418 Y107.789 E.44304
G1 X97.877 Y107.789 E.01631
G1 X108.257 Y118.168 E.44304
G1 X107.716 Y118.168 E.01631
G1 X97.337 Y107.789 E.44304
G1 X96.796 Y107.789 E.01631
G1 X107.176 Y118.168 E.44304
G1 X106.636 Y118.168 E.01631
G1 X96.256 Y107.789 E.44304
G1 X95.935 Y107.789 E.00968
G1 X95.935 Y108.008 E.00662
G1 X106.095 Y118.168 E.43368
G1 X105.555 Y118.168 E.01631
G1 X95.935 Y108.549 E.41061
G1 X95.935 Y109.089 E.01631
G1 X105.015 Y118.168 E.38755
G1 X104.474 Y118.168 E.01631
G1 X95.935 Y109.629 E.36448
G1 X95.935 Y110.17 E.01631
G1 X103.934 Y118.168 E.34142
G1 X103.394 Y118.168 E.01631
G1 X95.935 Y110.71 E.31835
G1 X95.935 Y111.25 E.01631
G1 X102.853 Y118.168 E.29529
G1 X102.313 Y118.168 E.01631
G1 X95.935 Y111.791 E.27222
G1 X95.935 Y112.331 E.01631
G1 X101.772 Y118.168 E.24916
G1 X101.232 Y118.168 E.01631
G1 X95.935 Y112.871 E.22609
G1 X95.935 Y113.412 E.01631
G1 X100.692 Y118.168 E.20303
G1 X100.151 Y118.168 E.01631
G1 X95.935 Y113.952 E.17996
G1 X95.935 Y114.492 E.01631
G1 X99.611 Y118.168 E.1569
G1 X99.071 Y118.168 E.01631
G1 X95.935 Y115.033 E.13383
G1 X95.935 Y115.573 E.01631
G1 X98.53 Y118.168 E.11077
G1 X97.99 Y118.168 E.01631
G1 X95.935 Y116.114 E.0877
G1 X95.935 Y116.654 E.01631
G1 X97.45 Y118.168 E.06464
G1 X96.909 Y118.168 E.01631
G1 X95.935 Y117.194 E.04158
G1 X95.935 Y117.735 E.01631
G1 X96.539 Y118.338 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6281.242
G1 X95.935 Y117.735 E-.32423
G1 X95.935 Y117.194 E-.20534
G1 X96.364 Y117.623 E-.23043
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/41
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M106 S204
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X135.413 Y133.652
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.402 Y143.579 E.29569
G1 F2640.781
G1 X135.143 Y143.579 E.00771
M106 S229.5
G1 F720
G1 X135.162 Y144.292 E.02123
M106 S204
G1 F923.649
G1 X135.163 Y144.329 E.00112
G1 F4670.209
G1 X134.763 Y144.329 E.01191
G1 F6364.704
G1 X134.363 Y144.329 E.01191
G1 X124.837 Y144.329 E.28375
G1 X124.838 Y144.292 E.00112
G1 F3591.598
G1 X124.843 Y144.107 E.0055
M106 S229.5
G1 F1800
M106 S204
M106 S229.5
G1 X124.848 Y143.923 E.0055
M106 S204
M106 S229.5
G1 F720
G1 X125.117 Y133.632 E.30665
M106 S204
M106 S229.5
G1 F1800
G1 X125.122 Y133.447 E.0055
M106 S204
M106 S229.5
M106 S204
G1 F2175.911
G1 X125.123 Y133.403 E.00133
G1 F6364.704
G1 X125.523 Y133.403 E.01191
G1 X134.877 Y133.403 E.2786
G1 X134.878 Y133.447 E.00133
G1 F3295.541
G1 X134.883 Y133.652 E.00611
M106 S229.5
G1 F1440
G1 X135.142 Y133.652 E.00771
M106 S204
G1 F3359.779
G1 X135.353 Y133.652 E.00628
; WIPE_START
M204 S10000
G1 X135.363 Y135.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.743 Y136.084 Z2.4 F30000
G1 X98.9 Y137.72 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.875 Y137.718 E.00079
G3 X98.809 Y134.264 I.006 J-1.728 E.17205
G3 X99.537 Y134.392 I.087 J1.639 E.024
G3 X99.101 Y137.704 I-.657 J1.598 E.14581
G1 X98.959 Y137.715 E.00455
G1 X98.867 Y137.328 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.701 Y137.315 E.00495
G3 X98.833 Y134.655 I.182 J-1.324 E.11812
G3 X99.222 Y134.698 I.028 J1.535 E.01167
G3 X98.926 Y137.327 I-.338 J1.293 E.11359
; WIPE_START
M204 S10000
G1 X98.701 Y137.315 E-.08577
G1 X98.528 Y137.282 E-.06684
G1 X98.206 Y137.149 E-.13256
G1 X97.93 Y136.937 E-.13236
G1 X97.813 Y136.805 E-.06704
G1 X97.639 Y136.502 E-.13261
G1 X97.548 Y136.165 E-.13252
G1 X97.547 Y136.138 E-.01029
; WIPE_END
G1 E-.04 F1800
G1 X97.488 Y141.025 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.383 Y140.852 E.00651
G3 X98.764 Y138.267 I1.5 J-.86 E.11245
G3 X99.536 Y138.391 I.125 J1.688 E.02537
G3 X97.529 Y141.068 I-.653 J1.601 E.2031
G1 X97.819 Y140.801 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.79 Y138.659 I1.064 J-.809 E.08567
G3 X99.221 Y138.699 I.084 J1.416 E.01295
G3 X97.856 Y140.848 I-.339 J1.293 E.1497
; WIPE_START
M204 S10000
G1 X97.639 Y140.503 E-.15498
G1 X97.548 Y140.166 E-.13252
G1 X97.537 Y139.991 E-.06682
G1 X97.548 Y139.816 E-.06661
G1 X97.639 Y139.479 E-.13259
G1 X97.813 Y139.176 E-.13261
G1 X97.929 Y139.045 E-.0667
G1 X97.944 Y139.034 E-.00716
; WIPE_END
G1 E-.04 F1800
G1 X105.417 Y137.481 Z2.4 F30000
G1 X124.73 Y133.467 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X124.44 Y144.515 E.35537
G1 X95.602 Y144.515 E.92732
G1 X95.602 Y133.467 E.35525
G1 X124.67 Y133.467 E.9347
; WIPE_START
G1 X124.628 Y135.467 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.255 Y135.18 Z2.4 F30000
G1 X149.95 Y134.514 Z2.4
G1 Z2
G1 E.8 F1800
G1 F5895.652
G1 X150.15 Y134.478 E.00653
G3 X150.309 Y134.464 I.23 J1.712 E.00512
G3 X151.037 Y134.592 I.087 J1.638 E.02399
G3 X149.894 Y134.533 I-.657 J1.598 E.31157
G1 X150.029 Y134.902 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.333 Y134.855 I.354 J1.289 E.00918
G3 X150.722 Y134.898 I.028 J1.537 E.01167
G3 X149.972 Y134.919 I-.338 J1.293 E.22747
; WIPE_START
M204 S10000
G1 X150.333 Y134.855 E-.13953
G1 X150.549 Y134.864 E-.08204
G1 X150.722 Y134.898 E-.06687
G1 X151.044 Y135.032 E-.13266
G1 X151.32 Y135.244 E-.13235
G1 X151.437 Y135.376 E-.06704
G1 X151.611 Y135.678 E-.13239
G1 X151.617 Y135.696 E-.00712
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.467 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.471 E.32169
G1 X160.398 Y143.471 E.20908
G1 X160.398 Y144.515 E.03356
G1 X135.56 Y144.515 E.79869
G1 X135.546 Y143.971 E.01749
G1 X135.805 Y143.971 E.00833
G1 X135.805 Y133.467 E.33777
G1 X153.836 Y133.467 E.57981
G1 X154.288 Y133.653 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.079 E.28078
G1 X160.79 Y143.079 E.19367
G1 X160.79 Y144.907 E.05445
G1 X95.21 Y144.907 E1.9534
G1 X95.21 Y133.075 E.35243
G1 X160.79 Y133.075 E1.9534
G1 X160.79 Y133.653 E.0172
G1 X154.348 Y133.653 E.19189
M204 S10000
G1 X154.092 Y133.364 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22832
G1 F12944.985
G1 X160.594 Y133.364 E.09522
; WIPE_START
G1 X158.594 Y133.364 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.911 Z2.4 F30000
G1 X160.194 Y143.993 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.67957
G1 F3769.732
G1 X153.693 Y143.993 E.32699
G1 X152.214 Y144.167 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.344 Y144.167 E.03634
G1 X153.344 Y143.668 E.01602
G1 X143.491 Y133.815 E.44807
G1 X143.212 Y133.815 E.00897
G1 X136.153 Y140.875 E.32102
G1 X136.153 Y141.829 E.0307
G1 X138.491 Y144.167 E.10629
G1 X140.537 Y144.167 E.06582
G1 X148.308 Y136.395 E.3534
G3 X150.579 Y134.125 I2.093 J-.177 E.1175
G1 X150.888 Y133.815 E.01409
G1 X151.167 Y133.815 E.00897
G1 X153.548 Y136.196 E.10825
G1 X153.548 Y138.832 E.08477
G1 X148.213 Y144.167 E.24259
G1 X146.167 Y144.167 E.06582
G1 X136.153 Y134.153 E.45536
G1 X136.153 Y133.815 E.01087
G1 X137.444 Y133.815 E.04149
G1 X135.609 Y133.364 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228
M73 P56 R10
G1 F12967.367
G1 X135.072 Y133.364 E.00786
; WIPE_START
G1 X135.609 Y133.364 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.983 Y133.677 Z2.4 F30000
G1 X124.361 Y133.826 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.35291
G1 F7742.187
G1 X124.051 Y133.826 E.00759
G1 X123.781 Y144.156 E.25305
G1 X124.091 Y144.156 E.00759
G1 X124.36 Y133.886 E.25158
; WIPE_START
G1 X124.307 Y135.885 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.297 Y140.615 Z2.4 F30000
G1 X135.367 Y144.618 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22848
G1 F12933.823
G1 X124.633 Y144.618 E.15733
G1 X123.457 Y142.822 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X123.422 Y144.167 E.04326
G1 X123.139 Y144.167 E.0091
G1 X112.788 Y133.815 E.47073
G1 X112.509 Y133.815 E.00897
G1 X102.158 Y144.167 E.47073
G1 X100.111 Y144.167 E.06582
G1 X97.406 Y141.463 E.12298
G2 X95.95 Y140.006 I-12.857 J11.394 E.06626
G1 X95.95 Y142.698 E.08656
G1 X97.302 Y141.346 E.06149
G3 X97.166 Y141.169 I.551 J-.567 E.00719
G1 X98.426 Y137.893 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116251
G1 F15000
G1 X98.591 Y137.949 E.00101
; LINE_WIDTH: 0.143985
G1 X98.62 Y137.964 E.00026
; LINE_WIDTH: 0.187644
G1 X98.651 Y137.991 E.00047
G1 X99.099 Y137.991 E.00511
G1 X99.324 Y137.893 F30000
; LINE_WIDTH: 0.116136
G1 F15000
G1 X99.159 Y137.949 E.00101
; LINE_WIDTH: 0.14327
G1 X99.131 Y137.963 E.00024
; LINE_WIDTH: 0.16569
G1 X99.115 Y137.977 E.00021
; LINE_WIDTH: 0.181945
G1 X99.099 Y137.991 E.00023
G1 X99.133 Y138.019 E.00049
; LINE_WIDTH: 0.142493
G1 X99.159 Y138.032 E.00023
; LINE_WIDTH: 0.116068
G1 X99.326 Y138.089 E.00102
G1 X100.944 Y139.833 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G2 X100.229 Y138.419 I-2.07 J.159 E.05228
G1 X104.833 Y133.815 E.20934
G1 X105.112 Y133.815 E.00897
G1 X115.463 Y144.167 E.47073
G1 X117.509 Y144.166 E.06582
G1 X123.581 Y138.095 E.2761
G1 X123.61 Y136.962 E.03644
G1 X120.463 Y133.815 E.14311
G1 X120.185 Y133.815 E.00897
G1 X109.833 Y144.166 E.47073
G1 X107.787 Y144.167 E.06582
G1 X100.666 Y137.045 E.32384
G2 X100.888 Y135.474 I-1.83 J-1.061 E.05231
G1 X99.558 Y134.17 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405957
G1 F6610.899
G1 X99.415 Y133.931 E.00799
; LINE_WIDTH: 0.445674
G1 F5958.979
G1 X99.403 Y133.913 E.00069
; LINE_WIDTH: 0.468387
G1 F5640.868
G1 X99.391 Y133.895 E.00072
G2 X99.139 Y133.872 I-.492 J3.879 E.00851
; LINE_WIDTH: 0.436772
G1 F6093.667
G2 X98.584 Y133.873 I-.258 J6.123 E.01726
; LINE_WIDTH: 0.468707
G1 F5636.62
G1 X98.359 Y133.895 E.00762
G1 X98.335 Y133.932 E.00145
; LINE_WIDTH: 0.405768
G1 F6614.351
G1 X98.192 Y134.17 E.00798
G1 X96.936 Y135.245 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X97.699 Y134.28 I2.248 J.995 E.03997
G1 X97.54 Y134.185 E.00597
G1 X97.64 Y134.019 E.00621
G2 X97.157 Y133.815 I-.343 J.139 E.01872
G1 X95.95 Y135.022 E.05486
G1 X95.95 Y136.65 E.05236
; WIPE_START
G1 X95.95 Y135.022 E-.61876
G1 X96.213 Y134.759 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X98.923 Y127.624 Z2.4 F30000
G1 X104.944 Y111.768 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X104.762 Y111.673 E.0066
G3 X105.562 Y108.451 I.871 J-1.494 E.14304
G3 X106.073 Y108.507 I.051 J1.916 E.01658
G3 X105 Y111.788 I-.44 J1.672 E.18125
G1 X105.115 Y111.41 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.589 Y108.842 I.52 J-1.232 E.10782
G3 X105.8 Y108.852 I.071 J.779 E.00632
G3 X105.171 Y111.432 I-.165 J1.327 E.13428
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15502
G1 X104.679 Y111.124 E-.06673
G1 X104.563 Y110.993 E-.0667
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07317
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.046 Z2.4 F30000
G1 X156.092 Y111.366 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.075 Y111.347 E.00081
G3 X157.062 Y108.251 I1.058 J-1.368 E.13581
G3 X157.573 Y108.307 I.051 J1.915 E.01658
G3 X156.262 Y111.473 I-.44 J1.672 E.18977
G1 X156.143 Y111.398 E.00452
G1 X156.316 Y111.034 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.089 Y108.642 I.819 J-1.056 E.0974
G3 X157.3 Y108.652 I.071 J.779 E.00632
G3 X156.364 Y111.069 I-.165 J1.326 E.14458
; WIPE_START
M204 S10000
G1 X156.179 Y110.924 E-.08935
G1 X156.063 Y110.793 E-.06668
G1 X155.889 Y110.49 E-.1327
G1 X155.798 Y110.153 E-.13278
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13278
G1 X155.985 Y109.3 E-.07312
; WIPE_END
G1 E-.04 F1800
G1 X156.709 Y112.301 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.959 Y112.258 E.00816
G3 X157.573 Y112.307 I.163 J1.848 E.01989
G3 X156.652 Y112.318 I-.441 J1.672 E.31942
G1 X156.804 Y112.682 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.986 Y112.649 E.00549
G3 X157.3 Y112.652 I.148 J1.15 E.00938
G3 X156.747 Y112.698 I-.167 J1.326 E.23348
; WIPE_START
M204 S10000
G1 X156.986 Y112.649 E-.0928
G1 X157.3 Y112.652 E-.11927
G1 X157.637 Y112.742 E-.13251
G1 X157.794 Y112.82 E-.0668
G1 X157.939 Y112.916 E-.06612
G1 X158.187 Y113.164 E-.13321
G1 X158.361 Y113.467 E-.13266
G1 X158.373 Y113.509 E-.01663
; WIPE_END
G1 E-.04 F1800
G1 X150.781 Y114.295 Z2.4 F30000
G1 X115.395 Y117.959 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z2.4 F30000
G1 X160.79 Y118.893 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.25 E.01433
G1 X105.143 Y118.153 E.45038
G1 X104.801 Y118.153 E.01099
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.14 Y107.804 E.19055
G1 X102.128 Y107.804 E.06391
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07449
G1 X97.467 Y118.153 E.30022
G1 X97.125 Y118.153 E.01099
G1 X95.95 Y116.978 E.05343
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.982 E.05212
G1 X112.477 Y118.153 E.27531
G1 X112.819 Y118.153 E.01099
G1 X115.047 Y115.925 E.10131
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23842
G1 X107.816 Y107.804 E.06391
G1 X106.998 Y108.622 E.03722
G2 X105.499 Y108.107 I-1.374 J1.557 E.0523
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.86 Y107.804 E.05236
G1 X155.941 Y107.919 E.00453
G1 X155.789 Y108.173 E.00952
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409216
G1 F6552.083
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468871
G1 F5634.459
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436051
G1 F6104.845
G3 X157.392 Y107.86 I.299 J5.93 E.01743
; LINE_WIDTH: 0.468385
G1 F5640.895
G3 X157.641 Y107.884 I-.245 J3.875 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447066
G1 F5938.458
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.40922
G1 F6552.01
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.116613
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149326
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180153
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144829
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116584
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187189
G1 F15000
G1 X156.892 Y111.979 E.0053
G1 X156.86 Y112.006 E.00048
; LINE_WIDTH: 0.144909
G1 X156.833 Y112.02 E.00025
; LINE_WIDTH: 0.11658
G1 X156.666 Y112.077 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05075
G1 X153.953 Y113.574 E.05869
G1 X155.251 Y114.872 E.05903
G2 X156.232 Y115.852 I2.055 J-1.075 E.04528
G1 X158.533 Y118.153 E.10465
G1 X158.875 Y118.153 E.01099
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y111.994 E.16028
M73 P57 R10
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.952 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/41
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X135.413 Y133.649
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.576 E.29569
G1 X135.102 Y143.576 E.00925
G1 F2640.781
G1 X134.844 Y143.576 E.00771
M106 S229.5
G1 F720
G1 X134.862 Y144.288 E.02123
M106 S204
G1 F923.649
G1 X134.863 Y144.326 E.00112
G1 F4670.209
G1 X134.463 Y144.326 E.01191
G1 F6364.704
G1 X134.063 Y144.326 E.01191
G1 X125.137 Y144.326 E.26588
G1 X125.138 Y144.288 E.00112
G1 F3591.598
G1 X125.143 Y144.104 E.0055
M106 S229.5
G1 F1800
M106 S204
M106 S229.5
G1 X125.148 Y143.919 E.0055
M106 S204
M106 S229.5
G1 F720
G1 X125.417 Y133.628 E.30665
M106 S204
M106 S229.5
G1 F1800
G1 X125.422 Y133.444 E.0055
M106 S204
M106 S229.5
M106 S204
G1 F2175.823
G1 X125.423 Y133.399 E.00132
G1 F6364.704
G1 X125.823 Y133.399 E.01191
G1 X134.577 Y133.399 E.26073
G1 X134.578 Y133.444 E.00132
G1 F3295.432
G1 X134.583 Y133.649 E.00611
M106 S229.5
G1 F1440
G1 X134.842 Y133.649 E.00771
M106 S204
G1 F6364.704
G1 X135.353 Y133.649 E.01522
; WIPE_START
M204 S10000
G1 X135.365 Y135.649 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.745 Y136.081 Z2.6 F30000
G1 X98.9 Y137.716 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X98.875 Y137.715 E.00079
G3 X98.806 Y134.261 I.006 J-1.728 E.17195
G3 X99.537 Y134.389 I.091 J1.638 E.02409
G3 X99.101 Y137.701 I-.656 J1.598 E.14582
G1 X98.959 Y137.711 E.00455
G1 X98.869 Y137.324 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.701 Y137.311 E.00502
G3 X98.83 Y134.652 I.183 J-1.324 E.11801
G3 X99.222 Y134.694 I.033 J1.525 E.01176
G3 X98.929 Y137.323 I-.338 J1.293 E.11353
; WIPE_START
M204 S10000
G1 X98.701 Y137.311 E-.08668
G1 X98.528 Y137.279 E-.06682
G1 X98.206 Y137.146 E-.13259
G1 X97.93 Y136.933 E-.13239
M73 P57 R9
G1 X97.813 Y136.801 E-.06699
G1 X97.639 Y136.499 E-.13263
G1 X97.548 Y136.162 E-.13252
G1 X97.547 Y136.137 E-.00938
; WIPE_END
G1 E-.04 F1800
G1 X97.517 Y141.06 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.508 Y141.036 E.00081
G3 X98.756 Y138.264 I1.374 J-1.048 E.11942
G3 X99.536 Y138.388 I.132 J1.688 E.02562
G3 X97.657 Y141.207 I-.653 J1.6 E.19684
G1 X97.559 Y141.103 E.00461
G1 X97.819 Y140.798 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.782 Y138.656 I1.063 J-.809 E.08544
G3 X99.221 Y138.696 I.093 J1.414 E.01318
G3 X97.856 Y140.844 I-.339 J1.293 E.1497
; WIPE_START
M204 S10000
G1 X97.639 Y140.5 E-.15498
G1 X97.548 Y140.163 E-.13253
G1 X97.537 Y139.987 E-.06682
G1 X97.548 Y139.812 E-.06662
G1 X97.639 Y139.475 E-.13258
G1 X97.813 Y139.173 E-.13261
G1 X97.929 Y139.042 E-.06671
G1 X97.944 Y139.03 E-.00715
; WIPE_END
G1 E-.04 F1800
G1 X105.42 Y137.494 Z2.6 F30000
G1 X125.029 Y133.464 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X124.74 Y144.511 E.35537
G1 X95.602 Y144.511 E.93696
G1 X95.602 Y133.464 E.35525
G1 X124.969 Y133.464 E.94435
; WIPE_START
G1 X124.928 Y135.463 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.555 Y135.173 Z2.6 F30000
G1 X149.968 Y134.509 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F5895.652
G1 X150.306 Y134.461 E.01097
G3 X151.037 Y134.589 I.091 J1.637 E.02409
G3 X149.91 Y134.524 I-.656 J1.598 E.31212
G1 X150.029 Y134.899 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.33 Y134.852 I.354 J1.289 E.00909
G3 X150.722 Y134.894 I.033 J1.527 E.01176
G3 X149.972 Y134.916 I-.338 J1.293 E.22747
; WIPE_START
M204 S10000
G1 X150.33 Y134.852 E-.13837
G1 X150.549 Y134.861 E-.08319
G1 X150.722 Y134.894 E-.06686
G1 X151.044 Y135.028 E-.13267
G1 X151.32 Y135.241 E-.13237
G1 X151.437 Y135.373 E-.067
G1 X151.611 Y135.675 E-.13241
G1 X151.617 Y135.692 E-.00713
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.464 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.468 E.32169
G1 X160.398 Y143.468 E.20908
G1 X160.398 Y144.511 E.03356
G1 X135.26 Y144.511 E.80834
G1 X135.246 Y143.968 E.01749
G1 X135.805 Y143.968 E.01798
G1 X135.805 Y133.464 E.33777
G1 X153.836 Y133.464 E.57981
G1 X154.288 Y133.649 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.075 E.28078
G1 X160.79 Y143.075 E.19367
G1 X160.79 Y144.903 E.05445
G1 X95.21 Y144.903 E1.9534
G1 X95.21 Y133.072 E.35243
G1 X160.79 Y133.072 E1.9534
G1 X160.79 Y133.649 E.0172
G1 X154.348 Y133.649 E.19189
M204 S10000
G1 X154.092 Y133.36 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22838
G1 F12940.796
G1 X160.594 Y133.36 E.09525
; WIPE_START
G1 X158.594 Y133.36 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.908 Z2.6 F30000
G1 X160.194 Y143.989 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.67956
G1 F3769.791
G1 X153.693 Y143.989 E.32698
G1 X136.009 Y144.239 F30000
; LINE_WIDTH: 0.17942
G1 F15000
G1 X135.457 Y144.239 E.00595
G1 X135.067 Y144.615 F30000
; LINE_WIDTH: 0.22846
G1 F12935.217
G1 X124.933 Y144.615 E.14852
G1 X124.661 Y133.822 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.352905
G1 F7742.314
G1 X124.351 Y133.822 E.00759
G1 X124.08 Y144.153 E.25305
G1 X124.391 Y144.153 E.00759
G1 X124.66 Y133.882 E.25158
; WIPE_START
G1 X124.607 Y135.881 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.015 Y134.044 Z2.6 F30000
G1 X134.772 Y133.36 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22803
G1 F12965.263
G1 X135.609 Y133.36 E.01224
G1 X137.44 Y133.812 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X136.153 Y133.812 E.04138
G1 X136.153 Y134.153 E.01098
G1 X146.163 Y144.163 E.4552
G1 X148.217 Y144.163 E.06604
G1 X153.548 Y138.832 E.24243
G1 X153.548 Y136.196 E.08477
G1 X151.164 Y133.812 E.10841
G1 X150.892 Y133.812 E.00874
G1 X150.582 Y134.122 E.0141
G2 X148.309 Y136.395 I-.206 J2.067 E.11821
G1 X140.541 Y144.163 E.35325
G1 X138.487 Y144.163 E.06604
G1 X136.153 Y141.829 E.10613
G1 X136.153 Y140.875 E.0307
G1 X143.216 Y133.812 E.32118
G1 X143.488 Y133.812 E.00874
G1 X153.344 Y143.668 E.44823
G1 X153.344 Y144.163 E.01591
G1 X152.211 Y144.163 E.03645
; WIPE_START
G1 X153.344 Y144.163 E-.43078
G1 X153.344 Y143.668 E-.18799
G1 X153.081 Y143.405 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X145.536 Y142.259 Z2.6 F30000
G1 X100.889 Y135.473 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F5895.652
G3 X100.664 Y137.044 I-2.051 J.508 E.05231
G1 X107.783 Y144.163 E.32375
G1 X109.837 Y144.163 E.06604
G1 X120.188 Y133.812 E.47073
G1 X120.46 Y133.812 E.00874
G1 X123.903 Y137.255 E.15656
G1 X123.889 Y137.787 E.01714
G1 X117.513 Y144.163 E.28994
G1 X115.459 Y144.163 E.06604
G1 X105.108 Y133.812 E.47073
G1 X104.836 Y133.812 E.00874
G1 X100.231 Y138.417 E.20941
G3 X100.945 Y139.832 I-1.356 J1.571 E.05228
G1 X99.326 Y138.085 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116068
G1 F15000
G1 X99.159 Y138.029 E.00102
; LINE_WIDTH: 0.142497
G1 X99.133 Y138.015 E.00023
; LINE_WIDTH: 0.181933
G1 X99.099 Y137.987 E.00049
G1 X99.115 Y137.973 E.00023
; LINE_WIDTH: 0.165684
G1 X99.131 Y137.96 E.00021
; LINE_WIDTH: 0.149991
G1 X99.137 Y137.956 E.00006
; LINE_WIDTH: 0.119078
G3 X99.324 Y137.89 I.367 J.743 E.00119
G1 X99.099 Y137.987 F30000
; LINE_WIDTH: 0.187643
G1 F15000
G1 X98.651 Y137.987 E.00511
G1 X98.62 Y137.96 E.00047
; LINE_WIDTH: 0.14403
G1 X98.591 Y137.945 E.00026
; LINE_WIDTH: 0.116282
G1 X98.426 Y137.89 E.00101
G1 X95.95 Y136.65 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X95.95 Y135.022 E.05236
G1 X97.16 Y133.812 E.05502
G3 X97.638 Y134.018 I.136 J.342 E.01859
G1 X97.54 Y134.181 E.00612
G1 X97.699 Y134.277 E.00597
G2 X96.935 Y135.243 I1.483 J1.957 E.04004
G1 X98.192 Y134.167 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405978
G1 F6610.52
G1 X98.336 Y133.928 E.00799
; LINE_WIDTH: 0.468754
G1 F5636.01
G1 X98.359 Y133.892 E.00145
G1 X98.584 Y133.87 E.00762
; LINE_WIDTH: 0.436811
G1 F6093.062
G3 X99.139 Y133.868 I.296 J6.132 E.01726
; LINE_WIDTH: 0.468408
G1 F5640.583
G3 X99.391 Y133.892 I-.237 J3.878 E.00851
G1 X99.403 Y133.91 E.00072
; LINE_WIDTH: 0.445669
G1 F5959.045
G1 X99.414 Y133.928 E.00069
; LINE_WIDTH: 0.405909
G1 F6611.777
G1 X99.558 Y134.167 E.00799
; WIPE_START
G1 X99.414 Y133.928 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.325 Y141.269 Z2.6 F30000
G1 X97.304 Y141.344 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X95.95 Y142.698 E.06156
G1 X95.95 Y140.006 E.08656
G1 X100.107 Y144.163 E.18904
G1 X102.161 Y144.163 E.06604
G1 X112.512 Y133.812 E.47073
G1 X112.784 Y133.812 E.00874
G1 X123.135 Y144.163 E.47073
G1 X123.722 Y144.163 E.01886
G1 X123.749 Y143.121 E.0335
; WIPE_START
G1 X123.722 Y144.163 E-.39593
G1 X123.135 Y144.163 E-.22283
G1 X122.872 Y143.9 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X119.159 Y137.232 Z2.6 F30000
G1 X104.986 Y111.786 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X104.964 Y111.774 E.00079
G3 X105.556 Y108.452 I.669 J-1.594 E.1501
G3 X106.073 Y108.507 I.059 J1.899 E.01676
G3 X105.178 Y111.847 I-.439 J1.672 E.17525
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.583 Y108.843 I.516 J-1.233 E.10787
G3 X105.971 Y108.886 I.029 J1.505 E.01168
G3 X105.17 Y111.433 I-.341 J1.292 E.12879
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08941
G1 X104.811 Y111.24 E-.06616
G1 X104.563 Y110.993 E-.13318
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z2.6 F30000
G1 X156.053 Y111.336 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.906 Y111.197 E.00649
G3 X157.056 Y108.252 I1.227 J-1.218 E.12832
G3 X157.573 Y108.307 I.059 J1.898 E.01676
G3 X156.103 Y111.368 I-.439 J1.672 E.1959
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.083 Y108.643 I.817 J-1.058 E.09748
G3 X157.471 Y108.686 I.029 J1.504 E.01168
G3 X156.362 Y111.072 I-.341 J1.292 E.13918
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15555
G1 X155.889 Y110.49 E-.13269
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.07358
; WIPE_END
G1 E-.04 F1800
G1 X156.71 Y112.301 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.965 Y112.258 E.00832
G3 X157.573 Y112.307 I.158 J1.843 E.01971
G3 X156.652 Y112.318 I-.44 J1.672 E.31943
G1 X156.8 Y112.682 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.992 Y112.649 E.00579
G3 X157.3 Y112.652 I.144 J1.13 E.00921
G3 X156.743 Y112.7 I-.166 J1.326 E.23335
; WIPE_START
M204 S10000
G1 X156.992 Y112.649 E-.09651
G1 X157.3 Y112.652 E-.11715
G1 X157.637 Y112.742 E-.13252
G1 X157.794 Y112.82 E-.0668
G1 X157.939 Y112.917 E-.06615
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13267
G1 X158.372 Y113.505 E-.01504
; WIPE_END
G1 E-.04 F1800
G1 X150.78 Y114.292 Z2.6 F30000
G1 X115.395 Y117.959 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z2.6 F30000
G1 X160.79 Y118.893 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03445
G1 X155.789 Y108.173 E.00599
G1 X155.941 Y107.919 E.00952
G1 X155.86 Y107.804 E.00453
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409279
G1 F6550.961
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468879
G1 F5634.348
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436051
G1 F6104.843
G3 X157.392 Y107.86 I.299 J5.931 E.01743
; LINE_WIDTH: 0.468389
G1 F5640.843
G3 X157.641 Y107.884 I-.245 J3.871 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447103
G1 F5937.911
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409282
M73 P58 R9
G1 F6550.902
G1 X157.808 Y108.158 E.00808
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03895
G3 X158.975 Y110.919 I-3.169 J-.498 E.02551
G1 X160.05 Y111.994 E.04887
G1 X160.05 Y116.978 E.16028
G1 X158.875 Y118.153 E.05343
G1 X158.533 Y118.153 E.01099
G1 X156.232 Y115.852 E.10465
G3 X155.251 Y114.872 I1.076 J-2.056 E.04528
G1 X153.953 Y113.574 E.05903
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05075
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116585
G1 F15000
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146114
G1 X156.863 Y111.953 E.00027
; LINE_WIDTH: 0.187334
G1 X156.893 Y111.979 E.00045
G1 X157.358 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.149376
G1 F15000
G1 X157.417 Y111.937 E.00036
; LINE_WIDTH: 0.116614
G1 X157.584 Y111.879 E.00103
G1 X157.584 Y112.077 F30000
; LINE_WIDTH: 0.116588
G1 F15000
G1 X157.417 Y112.02 E.00103
; LINE_WIDTH: 0.144883
G1 X157.39 Y112.006 E.00025
; LINE_WIDTH: 0.180201
G1 X157.358 Y111.979 E.00046
G1 X157.38 Y111.958 E.00033
; WIPE_START
G1 X157.358 Y111.979 E-.31595
G1 X157.39 Y112.006 E-.44405
; WIPE_END
G1 E-.04 F1800
G1 X149.779 Y111.434 Z2.6 F30000
G1 X105.499 Y108.107 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.125 J2.072 E.0523
G1 X107.816 Y107.804 E.03722
G1 X109.804 Y107.804 E.06391
G1 X115.047 Y113.047 E.23842
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10131
G1 X112.477 Y118.153 E.01099
G1 X106.423 Y112.099 E.27531
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05343
G1 X97.467 Y118.153 E.01099
G1 X104.069 Y111.551 E.30022
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.07169
G1 X100.14 Y107.804 E.06391
G1 X95.95 Y111.994 E.19055
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01099
G1 X115.047 Y108.25 E.45038
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.25 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/41
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S209.1
G17
G3 Z2.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.713
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.711 E.00079
G3 X98.802 Y134.257 I.006 J-1.728 E.17182
G3 X99.537 Y134.385 I.094 J1.637 E.02421
G3 X99.101 Y137.697 I-.656 J1.598 E.14582
G1 X98.959 Y137.708 E.00455
G1 X98.872 Y137.321 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.701 Y137.308 E.00509
G3 X98.827 Y134.649 I.183 J-1.324 E.11791
G3 X99.222 Y134.691 I.037 J1.515 E.01185
G3 X98.931 Y137.319 I-.338 J1.293 E.11347
; WIPE_START
M204 S10000
G1 X98.701 Y137.308 E-.08756
G1 X98.528 Y137.276 E-.06684
G1 X98.206 Y137.142 E-.13259
G1 X97.93 Y136.93 E-.13234
G1 X97.813 Y136.798 E-.06705
G1 X97.639 Y136.495 E-.13261
G1 X97.548 Y136.158 E-.13253
G1 X97.547 Y136.136 E-.00848
; WIPE_END
G1 E-.04 F1800
G1 X97.518 Y141.057 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.508 Y141.033 E.00083
G3 X98.748 Y138.262 I1.374 J-1.048 E.11918
G3 X99.536 Y138.384 I.14 J1.689 E.02587
G3 X97.657 Y141.203 I-.653 J1.6 E.19684
G1 X97.559 Y141.1 E.00458
G1 X97.819 Y140.794 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.775 Y138.653 I1.063 J-.809 E.08522
G3 X99.221 Y138.692 I.101 J1.413 E.01342
G3 X97.856 Y140.841 I-.339 J1.293 E.14969
; WIPE_START
M204 S10000
G1 X97.639 Y140.496 E-.15497
G1 X97.548 Y140.159 E-.13255
G1 X97.537 Y139.984 E-.06683
G1 X97.548 Y139.809 E-.06662
G1 X97.639 Y139.472 E-.13258
G1 X97.813 Y139.169 E-.13259
G1 X97.929 Y139.038 E-.0667
G1 X97.944 Y139.027 E-.00716
; WIPE_END
G1 E-.04 F1800
G1 X105.421 Y137.494 Z2.8 F30000
G1 X125.095 Y133.46 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y142.406 E.28765
G1 X125.04 Y144.508 E.06762
G1 X95.602 Y144.508 E.94661
G1 X95.602 Y133.46 E.35525
G1 X125.035 Y133.46 E.94645
; WIPE_START
G1 X125.048 Y135.46 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.566 Y134.144 Z2.8 F30000
G1 X135.413 Y133.645 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.572 E.29569
G1 X134.802 Y143.572 E.01819
G1 F2640.781
G1 X134.544 Y143.572 E.00771
M106 S229.5
G1 F720
G1 X134.562 Y144.285 E.02123
M106 S209.1
G1 F923.649
G1 X134.563 Y144.322 E.00112
G1 F4670.209
G1 X134.163 Y144.322 E.01191
G1 F6364.704
G1 X133.763 Y144.322 E.01191
G1 X125.437 Y144.322 E.24801
G1 X125.438 Y144.285 E.00112
G1 X125.462 Y143.348 E.02792
M106 S229.5
G1 F3000
M106 S209.1
M106 S229.5
G1 X125.487 Y142.411 E.02792
M106 S209.1
M106 S229.5
G1 F720
G1 X125.487 Y141.315 E.03264
M106 S209.1
M106 S229.5
G1 F1200
G1 X125.487 Y140.219 E.03264
M106 S209.1
M106 S229.5
G1 F1680
G1 X125.487 Y139.124 E.03264
M106 S209.1
M106 S229.5
G1 F2160
G1 X125.487 Y138.028 E.03264
M106 S209.1
M106 S229.5
G1 F2640
G1 X125.487 Y136.932 E.03264
M106 S209.1
M106 S229.5
G1 F3000
G1 X125.487 Y135.837 E.03264
M106 S209.1
M106 S229.5
G1 F6364.704
G1 X125.487 Y135.437 E.01191
M106 S209.1
M106 S229.5
G1 X125.487 Y134.741 E.02072
M106 S209.1
M106 S229.5
G1 X125.487 Y133.645 E.03264
M106 S209.1
G1 F3569.832
G1 X125.717 Y133.645 E.00684
M106 S229.5
G1 F1440
G1 X125.722 Y133.44 E.00611
M106 S209.1
G1 F1778.103
G1 X125.723 Y133.396 E.00133
G1 F6364.704
G1 X126.123 Y133.396 E.01191
G1 X134.277 Y133.396 E.24286
G1 X134.278 Y133.44 E.00133
G1 F3295.105
G1 X134.283 Y133.645 E.00611
M106 S229.5
G1 F1440
G1 X134.542 Y133.645 E.00771
M106 S209.1
G1 F6364.704
G1 X135.353 Y133.645 E.02416
; WIPE_START
M204 S10000
G1 X135.365 Y135.645 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.051 Z2.8 F30000
G1 X149.968 Y134.505 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.302 Y134.457 E.01086
G3 X151.037 Y134.585 I.094 J1.637 E.02421
G3 X149.91 Y134.521 I-.656 J1.598 E.31211
G1 X150.03 Y134.895 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.327 Y134.849 I.354 J1.289 E.009
G3 X150.722 Y134.891 I.037 J1.516 E.01185
G3 X149.972 Y134.913 I-.338 J1.293 E.22747
; WIPE_START
M204 S10000
G1 X150.327 Y134.849 E-.13717
G1 X150.549 Y134.857 E-.08436
G1 X150.722 Y134.891 E-.06685
G1 X151.044 Y135.025 E-.13268
G1 X151.32 Y135.237 E-.13235
G1 X151.437 Y135.369 E-.06703
G1 X151.611 Y135.671 E-.13239
G1 X151.617 Y135.689 E-.00716
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.46 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.464 E.32169
G1 X160.398 Y143.464 E.20908
G1 X160.398 Y144.508 E.03356
G1 X134.96 Y144.508 E.81798
G1 X134.946 Y143.964 E.01748
G1 X135.805 Y143.964 E.02762
G1 X135.805 Y133.46 E.33777
G1 X153.836 Y133.46 E.57981
G1 X154.288 Y133.646 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.072 E.28078
G1 X160.79 Y143.072 E.19367
G1 X160.79 Y144.9 E.05445
G1 X95.21 Y144.9 E1.9534
G1 X95.21 Y133.068 E.35243
G1 X160.79 Y133.068 E1.9534
G1 X160.79 Y133.646 E.0172
G1 X154.348 Y133.646 E.19189
M204 S10000
G1 X154.092 Y133.357 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22843
G1 F12937.308
G1 X160.594 Y133.357 E.09528
; WIPE_START
G1 X158.594 Y133.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.904 Z2.8 F30000
G1 X160.194 Y143.986 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.67955
G1 F3769.851
G1 X153.693 Y143.986 E.32698
G1 X152.207 Y144.159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.344 Y144.159 E.03657
G1 X153.344 Y143.668 E.01579
G1 X143.484 Y133.808 E.44839
G1 X143.22 Y133.808 E.00851
G1 X136.153 Y140.875 E.32134
G1 X136.153 Y141.829 E.0307
G1 X138.484 Y144.159 E.10597
G1 X140.544 Y144.159 E.06627
G1 X148.309 Y136.395 E.3531
G3 X150.585 Y134.118 I2.067 J-.209 E.11843
G1 X150.895 Y133.808 E.0141
G1 X151.16 Y133.808 E.00851
G1 X153.548 Y136.196 E.10857
G1 X153.548 Y138.832 E.08477
G1 X148.22 Y144.159 E.24227
G1 X146.159 Y144.159 E.06627
G1 X136.153 Y134.153 E.45504
G1 X136.153 Y133.808 E.01109
G1 X137.437 Y133.808 E.04127
G1 X135.609 Y133.357 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22805
G1 F12963.863
G1 X134.472 Y133.357 E.01663
; WIPE_START
G1 X135.609 Y133.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.292 Y140.982 Z2.8 F30000
G1 X135.157 Y144.236 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.1794
G1 F15000
G1 X136.009 Y144.236 E.00918
G1 X134.767 Y144.611 F30000
; LINE_WIDTH: 0.22844
G1 F12936.611
G1 X125.233 Y144.611 E.13971
G1 X124.041 Y143.421 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X124.021 Y144.159 E.02375
G1 X123.132 Y144.159 E.02861
G1 X112.78 Y133.808 E.47073
G1 X112.516 Y133.808 E.00851
G1 X102.165 Y144.159 E.47073
G1 X100.104 Y144.159 E.06627
G1 X95.95 Y140.006 E.18888
G1 X95.95 Y142.698 E.08656
G1 X97.306 Y141.342 E.06164
; WIPE_START
G1 X95.95 Y142.698 E-.72839
G1 X95.95 Y142.615 E-.03161
; WIPE_END
G1 E-.04 F1800
G1 X98.62 Y137.957 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.144068
G1 F15000
G1 X98.591 Y137.942 E.00026
; LINE_WIDTH: 0.116291
G1 X98.426 Y137.886 E.00101
G1 X98.62 Y137.957 F30000
; LINE_WIDTH: 0.187634
G1 F15000
G1 X98.651 Y137.984 E.00047
G1 X99.098 Y137.984 E.00511
G1 X99.115 Y137.97 F30000
; LINE_WIDTH: 0.165624
G1 F15000
G1 X99.131 Y137.956 E.00021
; LINE_WIDTH: 0.149905
G1 X99.137 Y137.952 E.00006
; LINE_WIDTH: 0.119057
G3 X99.324 Y137.886 I.366 J.743 E.00119
G1 X99.326 Y138.082 F30000
; LINE_WIDTH: 0.116071
G1 F15000
G1 X99.159 Y138.025 E.00102
; LINE_WIDTH: 0.142462
G1 X99.133 Y138.012 E.00023
; LINE_WIDTH: 0.181904
G1 X99.098 Y137.984 E.00049
G1 X99.115 Y137.97 E.00024
; WIPE_START
G1 X99.098 Y137.984 E-.24732
G1 X99.133 Y138.012 E-.51268
; WIPE_END
G1 E-.04 F1800
G1 X96.934 Y135.242 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X97.699 Y134.273 I2.245 J.985 E.04013
G1 X97.54 Y134.178 E.00597
G1 X97.637 Y134.017 E.00604
G2 X97.164 Y133.808 I-.341 J.132 E.01846
G1 X95.95 Y135.022 E.05518
G1 X95.95 Y136.65 E.05236
G1 X98.192 Y134.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405886
G1 F6612.192
M73 P59 R9
G1 X98.336 Y133.924 E.00799
; LINE_WIDTH: 0.46876
G1 F5635.923
G1 X98.359 Y133.888 E.00145
G1 X98.584 Y133.866 E.00762
; LINE_WIDTH: 0.436841
G1 F6092.598
G3 X99.139 Y133.865 I.297 J6.137 E.01727
; LINE_WIDTH: 0.468431
G1 F5640.283
G3 X99.391 Y133.888 I-.242 J3.924 E.00851
G1 X99.403 Y133.906 E.00072
; LINE_WIDTH: 0.445637
G1 F5959.521
G1 X99.414 Y133.924 E.00069
; LINE_WIDTH: 0.405874
G1 F6612.414
G1 X99.558 Y134.163 E.00798
G1 X106.151 Y144.159 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X107.78 Y144.159 E.05236
G1 X100.663 Y137.043 E.32365
G3 X99.77 Y137.856 I-1.806 J-1.086 E.0394
G2 X99.915 Y138.182 I.172 J.119 E.01378
G3 X100.233 Y138.415 I-.738 J1.343 E.0127
G1 X104.84 Y133.808 E.20949
G1 X105.105 Y133.808 E.00852
G1 X115.456 Y144.159 E.47073
G1 X117.516 Y144.159 E.06627
G1 X124.197 Y137.479 E.30379
G1 X124.195 Y137.547 E.00217
G1 X120.456 Y133.808 E.17001
G1 X120.192 Y133.808 E.00851
G1 X109.841 Y144.159 E.47073
G1 X111.469 Y144.159 E.05236
G1 X124.588 Y141.882 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.628396
G1 F4099.229
G1 X124.609 Y140.29 E.07364
; LINE_WIDTH: 0.586348
G1 F4416.409
G1 X124.63 Y138.698 E.06835
; LINE_WIDTH: 0.5443
G1 F4786.789
G1 X124.651 Y137.106 E.06306
; LINE_WIDTH: 0.502252
G1 F5224.979
G1 X124.672 Y135.514 E.05777
; LINE_WIDTH: 0.460204
G1 F5751.479
G1 X124.692 Y133.922 E.05248
G1 X124.588 Y141.882 F30000
; LINE_WIDTH: 0.624586
G1 F4126.08
G1 X124.562 Y141.948 E.00327
; LINE_WIDTH: 0.574918
G1 F4511.299
G1 X124.535 Y142.014 E.00299
; LINE_WIDTH: 0.52525
G1 F4975.855
G1 X124.508 Y142.08 E.00271
; LINE_WIDTH: 0.475581
G1 F5547.071
G1 X124.482 Y142.146 E.00243
; LINE_WIDTH: 0.425913
G1 F6266.442
G1 X124.455 Y142.212 E.00215
; LINE_WIDTH: 0.353279
G1 F7732.977
G2 X124.426 Y142.394 I.225 J.129 E.00463
G1 X124.38 Y144.149 E.04303
G1 X124.69 Y144.149 E.0076
G2 X124.737 Y142.282 I-47.584 J-2.124 E.04579
; LINE_WIDTH: 0.376245
G1 F7200.198
G1 X124.716 Y142.225 E.00161
; LINE_WIDTH: 0.425913
G1 F6266.442
G1 X124.694 Y142.168 E.00185
; LINE_WIDTH: 0.475581
G1 F5547.071
G1 X124.673 Y142.11 E.00209
; LINE_WIDTH: 0.52525
G1 F4975.855
G1 X124.652 Y142.053 E.00233
; LINE_WIDTH: 0.574918
G1 F4511.299
G1 X124.63 Y141.996 E.00257
; LINE_WIDTH: 0.624586
G1 F4126.08
G1 X124.609 Y141.938 E.00281
; WIPE_START
G1 X124.63 Y141.996 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.47 Y135.597 Z2.8 F30000
G1 X104.986 Y111.786 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.964 Y111.773 E.00079
G3 X105.551 Y108.452 I.67 J-1.594 E.14989
G3 X106.073 Y108.507 I.067 J1.884 E.01694
G3 X105.178 Y111.847 I-.439 J1.673 E.17526
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.577 Y108.843 I.517 J-1.233 E.1077
G3 X105.971 Y108.886 I.038 J1.483 E.01184
G3 X105.17 Y111.434 I-.34 J1.293 E.12886
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08943
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13317
G1 X104.389 Y110.69 E-.13268
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z2.8 F30000
G1 X156.053 Y111.336 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.051 Y108.252 I1.228 J-1.218 E.12811
G3 X157.573 Y108.307 I.067 J1.883 E.01694
G3 X156.103 Y111.368 I-.439 J1.673 E.19592
G1 X156.314 Y111.037 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.077 Y108.643 I.817 J-1.058 E.0973
G3 X157.471 Y108.686 I.038 J1.482 E.01184
G3 X156.362 Y111.072 I-.34 J1.293 E.13925
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15558
G1 X155.889 Y110.49 E-.13267
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.07356
; WIPE_END
G1 E-.04 F1800
G1 X156.711 Y112.301 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.971 Y112.258 E.00847
G3 X157.573 Y112.307 I.153 J1.84 E.01953
G3 X156.653 Y112.318 I-.44 J1.672 E.31944
G1 X156.796 Y112.683 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.997 Y112.649 E.00609
G3 X157.3 Y112.652 I.14 J1.11 E.00904
G3 X156.739 Y112.702 I-.165 J1.326 E.23321
; WIPE_START
M204 S10000
G1 X156.997 Y112.649 E-.10029
G1 X157.3 Y112.652 E-.11503
G1 X157.637 Y112.742 E-.13252
G1 X157.794 Y112.82 E-.06679
G1 X157.939 Y112.917 E-.06615
G1 X158.187 Y113.164 E-.13316
G1 X158.361 Y113.467 E-.13268
G1 X158.37 Y113.501 E-.01337
; WIPE_END
G1 E-.04 F1800
G1 X150.779 Y114.288 Z2.8 F30000
G1 X115.395 Y117.959 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z2.8 F30000
G1 X160.79 Y118.893 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.25 E.01433
G1 X105.143 Y118.153 E.45038
G1 X104.801 Y118.153 E.01099
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.14 Y107.804 E.19055
G1 X102.128 Y107.804 E.06391
G1 X103.703 Y109.382 E.07171
G2 X104.069 Y111.551 I1.935 J.789 E.07449
G1 X97.467 Y118.153 E.30022
G1 X97.125 Y118.153 E.01099
G1 X95.95 Y116.978 E.05343
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27531
G1 X112.819 Y118.153 E.01099
G1 X115.047 Y115.925 E.10131
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23842
G1 X107.816 Y107.804 E.06391
G1 X106.998 Y108.622 E.03722
G2 X105.499 Y108.108 I-1.37 J1.55 E.05229
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.86 Y107.804 E.05236
G1 X155.941 Y107.918 E.00453
G1 X155.789 Y108.173 E.00953
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409316
G1 F6550.304
G1 X156.586 Y107.919 E.00809
; LINE_WIDTH: 0.468888
G1 F5634.232
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436056
G1 F6104.768
G3 X157.392 Y107.86 I.299 J5.924 E.01743
; LINE_WIDTH: 0.468389
G1 F5640.842
G3 X157.641 Y107.884 I-.245 J3.876 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447096
G1 F5938.011
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.40927
G1 F6551.126
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.116603
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149268
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.18009
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144758
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116571
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187187
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.86 Y112.006 E.00048
; LINE_WIDTH: 0.144877
G1 X156.833 Y112.02 E.00025
; LINE_WIDTH: 0.116604
G1 X156.666 Y112.077 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05075
G1 X153.953 Y113.574 E.05869
G1 X155.251 Y114.872 E.05903
G2 X156.232 Y115.852 I2.055 J-1.075 E.04528
G1 X158.533 Y118.153 E.10464
G1 X158.875 Y118.153 E.01099
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y111.994 E.16028
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.952 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/41
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.709
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.708 E.00079
G3 X98.799 Y134.254 I.006 J-1.728 E.17172
G3 X99.537 Y134.382 I.097 J1.637 E.02431
G3 X99.101 Y137.694 I-.656 J1.598 E.14583
G1 X98.959 Y137.705 E.00455
G1 X98.875 Y137.317 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.824 Y134.645 I.009 J-1.336 E.123
G3 X99.222 Y134.687 I.042 J1.507 E.01195
G3 X98.935 Y137.316 I-.338 J1.293 E.11338
; WIPE_START
M204 S10000
G1 X98.701 Y137.306 E-.08897
G1 X98.528 Y137.272 E-.06687
G1 X98.206 Y137.139 E-.13259
G1 X97.93 Y136.926 E-.13235
G1 X97.813 Y136.794 E-.06703
G1 X97.639 Y136.492 E-.13262
G1 X97.548 Y136.155 E-.13252
G1 X97.547 Y136.136 E-.00705
; WIPE_END
G1 E-.04 F1800
G1 X97.487 Y141.013 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.384 Y140.841 E.00644
G3 X98.74 Y138.259 I1.5 J-.86 E.11162
G3 X99.323 Y138.309 I.135 J1.831 E.01889
G3 X97.529 Y141.055 I-.439 J1.672 E.21049
G1 X97.819 Y140.791 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.767 Y138.65 I1.063 J-.81 E.08501
G3 X99.221 Y138.689 I.108 J1.415 E.01365
G3 X97.856 Y140.838 I-.34 J1.293 E.14968
; WIPE_START
M204 S10000
G1 X97.639 Y140.493 E-.155
G1 X97.548 Y140.156 E-.13252
G1 X97.537 Y139.98 E-.06684
G1 X97.548 Y139.805 E-.06663
G1 X97.639 Y139.468 E-.13257
G1 X97.813 Y139.166 E-.13259
G1 X97.929 Y139.035 E-.06673
G1 X97.944 Y139.023 E-.00714
; WIPE_END
G1 E-.04 F1800
G1 X105.421 Y137.49 Z3 F30000
G1 X125.095 Y133.457 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.961 E.33777
G1 X125.354 Y143.961 E.00833
G1 X125.34 Y144.504 E.01748
G1 X95.602 Y144.504 E.95625
G1 X95.602 Y133.457 E.35525
G1 X125.035 Y133.457 E.94645
; WIPE_START
G1 X125.046 Y135.457 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.564 Y134.14 Z3 F30000
G1 X135.413 Y133.642 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.569 E.29569
G1 X134.502 Y143.569 E.02712
G1 F2640.781
G1 X134.244 Y143.569 E.00771
M106 S229.5
G1 F720
G1 X134.262 Y144.281 E.02123
M106 S209.1
G1 F923.649
G1 X134.263 Y144.319 E.00112
G1 F4670.209
G1 X133.863 Y144.319 E.01191
G1 F6364.704
G1 X133.463 Y144.319 E.01191
G1 X125.737 Y144.319 E.23015
G1 X125.738 Y144.281 E.00112
G1 X125.756 Y143.569 E.02123
M106 S229.5
G1 F720
G1 X125.498 Y143.569 E.00771
M106 S209.1
G1 F4196.468
G1 X125.497 Y143.169 E.01191
G1 F6364.704
G1 X125.497 Y142.769 E.01191
G1 X125.487 Y133.642 E.27186
G1 X125.758 Y133.642 E.00807
G1 F3906.987
G1 X126.017 Y133.642 E.00771
M106 S229.5
G1 F1440
G1 X126.022 Y133.437 E.00611
M106 S209.1
G1 F1778.103
G1 X126.023 Y133.392 E.00133
G1 F6364.704
G1 X126.423 Y133.392 E.01191
G1 X133.977 Y133.392 E.22499
G1 X133.978 Y133.437 E.00133
G1 F3294.888
G1 X133.983 Y133.642 E.00611
M106 S229.5
G1 F1440
G1 X134.242 Y133.642 E.00771
M106 S209.1
G1 F5760
G1 X134.642 Y133.642 E.01191
G1 F6364.704
G1 X135.353 Y133.642 E.02118
; WIPE_START
M204 S10000
G1 X135.365 Y135.642 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.048 Z3 F30000
G1 X149.968 Y134.502 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.299 Y134.454 E.01077
G3 X151.037 Y134.582 I.098 J1.636 E.02431
G3 X149.91 Y134.518 I-.656 J1.598 E.3121
G1 X150.029 Y134.892 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.324 Y134.845 I.355 J1.288 E.00891
G3 X150.722 Y134.887 I.042 J1.507 E.01194
G3 X149.972 Y134.909 I-.338 J1.293 E.22747
; WIPE_START
M204 S10000
G1 X150.324 Y134.845 E-.13602
G1 X150.549 Y134.854 E-.08553
G1 X150.722 Y134.887 E-.06686
G1 X151.044 Y135.021 E-.13267
G1 X151.189 Y135.119 E-.06639
G1 X151.437 Y135.366 E-.13299
G1 X151.533 Y135.511 E-.06619
G1 X151.611 Y135.668 E-.06646
G1 X151.616 Y135.685 E-.00691
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.457 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.461 E.32169
G1 X160.398 Y143.461 E.20908
G1 X160.398 Y144.504 E.03356
G1 X134.66 Y144.504 E.82763
G1 X134.646 Y143.961 E.01748
G1 X135.805 Y143.961 E.03727
G1 X135.805 Y133.457 E.33777
G1 X153.836 Y133.457 E.57981
G1 X154.288 Y133.642 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.068 E.28078
G1 X160.79 Y143.068 E.19367
G1 X160.79 Y144.896 E.05444
G1 X95.21 Y144.896 E1.9534
G1 X95.21 Y133.064 E.35243
G1 X160.79 Y133.064 E1.9534
G1 X160.79 Y133.642 E.01721
G1 X154.348 Y133.642 E.19189
M204 S10000
G1 X154.092 Y133.353 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22849
G1 F12933.124
G1 X160.594 Y133.353 E.09531
; WIPE_START
G1 X158.594 Y133.353 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.901 Z3 F30000
G1 X160.194 Y143.982 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.67954
M73 P60 R9
G1 F3769.91
G1 X153.693 Y143.982 E.32697
G1 X136.009 Y144.232 F30000
; LINE_WIDTH: 0.17938
G1 F15000
G1 X134.857 Y144.232 E.01241
G1 X134.467 Y144.607 F30000
; LINE_WIDTH: 0.22842
G1 F12938.006
G1 X125.533 Y144.607 E.13091
G1 X125.291 Y133.353 F30000
; LINE_WIDTH: 0.228062
G1 F12963.046
G1 X125.828 Y133.353 E.00786
G1 X134.172 Y133.353 F30000
; LINE_WIDTH: 0.22807
G1 F12962.463
G1 X135.609 Y133.353 E.02102
G1 X137.433 Y133.805 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X136.153 Y133.805 E.04115
G1 X136.153 Y134.153 E.01121
G1 X146.156 Y144.156 E.45489
G1 X148.224 Y144.156 E.06649
G1 X153.548 Y138.832 E.24212
G1 X153.548 Y136.196 E.08477
G1 X151.157 Y133.805 E.10874
G1 X150.899 Y133.805 E.00828
G1 X150.589 Y134.115 E.01412
G2 X148.309 Y136.395 I-.212 J2.067 E.11863
G1 X140.548 Y144.156 E.35296
G1 X138.48 Y144.156 E.06649
G1 X136.153 Y141.829 E.10582
G1 X136.153 Y140.875 E.0307
G1 X143.223 Y133.805 E.32151
G1 X143.481 Y133.805 E.00828
G1 X153.344 Y143.668 E.44856
G1 X153.344 Y144.156 E.01568
G1 X152.204 Y144.156 E.03668
; WIPE_START
G1 X153.344 Y144.156 E-.43345
G1 X153.344 Y143.668 E-.18531
G1 X153.082 Y143.406 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X145.486 Y142.653 Z3 F30000
G1 X99.326 Y138.078 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.116089
G1 F15000
G1 X99.159 Y138.022 E.00102
; LINE_WIDTH: 0.142523
G1 X99.133 Y138.008 E.00023
; LINE_WIDTH: 0.181933
G1 X99.099 Y137.98 E.00049
G1 X99.115 Y137.966 E.00023
; LINE_WIDTH: 0.165707
G1 X99.131 Y137.953 E.00021
; LINE_WIDTH: 0.143262
G1 X99.159 Y137.939 E.00024
; LINE_WIDTH: 0.116109
G1 X99.324 Y137.883 E.00101
G1 X99.099 Y137.98 F30000
; LINE_WIDTH: 0.187632
G1 F15000
G1 X98.651 Y137.98 E.00511
G1 X98.62 Y137.953 E.00047
; LINE_WIDTH: 0.144021
G1 X98.591 Y137.938 E.00026
; LINE_WIDTH: 0.116261
G1 X98.426 Y137.883 E.00101
G1 X95.95 Y136.65 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X95.95 Y135.022 E.05236
G1 X97.167 Y133.805 E.05535
G3 X97.636 Y134.015 I.129 J.339 E.01834
G1 X97.54 Y134.174 E.00595
G1 X97.7 Y134.27 E.00598
G2 X96.934 Y135.241 I1.478 J1.952 E.04021
G1 X98.192 Y134.16 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406027
G1 F6609.621
G1 X98.336 Y133.921 E.00799
; LINE_WIDTH: 0.468807
G1 F5635.304
G1 X98.359 Y133.885 E.00145
G1 X98.584 Y133.863 E.00761
; LINE_WIDTH: 0.436876
G1 F6092.05
G3 X99.139 Y133.861 I.297 J6.133 E.01727
; LINE_WIDTH: 0.468454
G1 F5639.98
G3 X99.391 Y133.885 I-.244 J3.949 E.0085
G1 X99.403 Y133.903 E.00072
; LINE_WIDTH: 0.445782
G1 F5957.386
G1 X99.414 Y133.921 E.00068
; LINE_WIDTH: 0.406023
G1 F6609.7
G1 X99.558 Y134.16 E.00799
; WIPE_START
G1 X99.414 Y133.921 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.329 Y141.263 Z3 F30000
G1 X97.307 Y141.341 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X95.95 Y142.698 E.06172
G1 X95.95 Y140.006 E.08656
G1 X100.1 Y144.156 E.18873
G1 X102.168 Y144.156 E.06649
G1 X112.519 Y133.805 E.47074
G1 X112.777 Y133.805 E.00828
G1 X123.128 Y144.156 E.47074
G1 X117.52 Y144.156 E.18034
G1 X124.747 Y136.929 E.32865
G1 X124.747 Y138.099 E.03761
G1 X120.453 Y133.805 E.19527
G1 X120.195 Y133.805 E.00828
G1 X109.844 Y144.156 E.47074
G1 X107.776 Y144.156 E.06649
G1 X100.661 Y137.041 E.32356
G3 X99.77 Y137.852 I-1.804 J-1.087 E.03931
G2 X99.915 Y138.179 I.172 J.119 E.01378
G3 X100.235 Y138.413 I-.742 J1.349 E.01279
G1 X104.843 Y133.805 E.20957
G1 X105.101 Y133.805 E.00828
G1 X115.452 Y144.156 E.47074
G1 X113.824 Y144.156 E.05236
; WIPE_START
G1 X115.452 Y144.156 E-.61876
G1 X115.189 Y143.893 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.878 Y136.619 Z3 F30000
G1 X104.986 Y111.786 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.545 Y108.452 I.67 J-1.594 E.14969
G3 X106.073 Y108.507 I.074 J1.871 E.01712
G3 X105.178 Y111.847 I-.439 J1.673 E.17527
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.572 Y108.844 I.517 J-1.233 E.10749
G3 X105.971 Y108.886 I.046 J1.464 E.01201
G3 X105.17 Y111.434 I-.34 J1.293 E.12888
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08942
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13317
G1 X104.389 Y110.69 E-.13266
G1 X104.298 Y110.353 E-.13253
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07289
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z3 F30000
G1 X156.053 Y111.336 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.045 Y108.252 I1.228 J-1.218 E.12791
G3 X157.573 Y108.307 I.074 J1.872 E.01712
G3 X156.104 Y111.367 I-.439 J1.673 E.19593
G1 X156.314 Y111.037 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.072 Y108.644 I.818 J-1.057 E.0971
G3 X157.471 Y108.686 I.046 J1.465 E.01201
G3 X156.362 Y111.072 I-.34 J1.293 E.13927
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15557
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.07359
; WIPE_END
G1 E-.04 F1800
G1 X156.711 Y112.301 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.976 Y112.257 E.00863
G3 X157.573 Y112.307 I.148 J1.838 E.01935
G3 X156.654 Y112.318 I-.439 J1.672 E.31944
G1 X156.791 Y112.684 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X157.003 Y112.648 E.0064
G3 X157.3 Y112.652 I.135 J1.089 E.00888
G3 X156.734 Y112.703 I-.165 J1.326 E.23307
; WIPE_START
M204 S10000
G1 X157.003 Y112.648 E-.10413
G1 X157.3 Y112.652 E-.1129
G1 X157.637 Y112.742 E-.13251
G1 X157.794 Y112.82 E-.0668
G1 X157.939 Y112.917 E-.06614
G1 X158.187 Y113.164 E-.13318
G1 X158.361 Y113.467 E-.13268
G1 X158.369 Y113.496 E-.01166
; WIPE_END
G1 E-.04 F1800
G1 X150.778 Y114.285 Z3 F30000
G1 X115.395 Y117.959 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z3 F30000
G1 X160.79 Y118.893 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.872 J.91 E.03445
G1 X155.789 Y108.173 E.00599
G1 X155.942 Y107.918 E.00953
G1 X155.859 Y107.804 E.00454
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40927
G1 F6551.126
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468884
G1 F5634.28
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436056
G1 F6104.76
G3 X157.392 Y107.86 I.299 J5.924 E.01743
; LINE_WIDTH: 0.468385
G1 F5640.891
G3 X157.641 Y107.884 I-.246 J3.887 E.00841
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446907
G1 F5940.793
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409014
G1 F6555.7
G1 X157.808 Y108.158 E.00807
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03896
G3 X158.975 Y110.919 I-3.17 J-.498 E.0255
G1 X160.05 Y111.994 E.04888
G1 X160.05 Y116.978 E.16027
G1 X158.875 Y118.153 E.05344
G1 X158.533 Y118.153 E.01098
G1 X156.232 Y115.852 E.10466
G3 X155.252 Y114.872 I1.075 J-2.055 E.04526
G1 X153.953 Y113.573 E.05905
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05076
G1 X156.666 Y112.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116581
G1 F15000
G1 X156.833 Y112.02 E.00103
; LINE_WIDTH: 0.144777
G1 X156.86 Y112.006 E.00025
; LINE_WIDTH: 0.187173
G1 X156.893 Y111.979 E.00048
G1 X157.357 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.180195
G1 F15000
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144844
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116564
G1 X157.584 Y112.077 E.00103
G1 X157.584 Y111.879 F30000
; LINE_WIDTH: 0.116643
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149383
G1 X157.38 Y111.958 E.00036
; WIPE_START
G1 X157.417 Y111.937 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.805 Y111.375 Z3 F30000
G1 X105.499 Y108.107 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.127 J2.068 E.05229
G1 X107.816 Y107.804 E.03723
G1 X109.804 Y107.804 E.0639
G1 X115.047 Y113.047 E.23843
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10132
G1 X112.477 Y118.153 E.01098
G1 X106.423 Y112.099 E.27532
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05344
G1 X97.467 Y118.153 E.01098
G1 X104.069 Y111.551 E.30023
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.0717
G1 X100.141 Y107.804 E.0639
G1 X95.95 Y111.994 E.19056
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01098
G1 X115.047 Y108.249 E.45039
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.249 E-.16936
M73 P61 R9
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/41
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S191.25
G17
G3 Z3 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.706
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.704 E.00079
G3 X98.796 Y134.251 I.006 J-1.728 E.17162
G3 X99.537 Y134.378 I.1 J1.636 E.0244
G3 X99.101 Y137.69 I-.656 J1.598 E.14583
G1 X98.959 Y137.701 E.00455
G1 X98.877 Y137.314 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.875 Y137.313 E.00005
G3 X98.821 Y134.642 I.009 J-1.336 E.1229
G3 X99.222 Y134.684 I.046 J1.499 E.01204
G3 X99.222 Y137.27 I-.338 J1.293 E.10472
G1 X98.936 Y137.306 E.00858
; WIPE_START
M204 S10000
G1 X98.875 Y137.313 E-.02336
G1 X98.701 Y137.302 E-.06631
G1 X98.528 Y137.269 E-.06685
G1 X98.206 Y137.135 E-.13259
G1 X97.93 Y136.923 E-.13237
G1 X97.813 Y136.791 E-.067
G1 X97.639 Y136.488 E-.13263
G1 X97.548 Y136.151 E-.13253
G1 X97.547 Y136.135 E-.00636
; WIPE_END
G1 E-.04 F1800
G1 X97.519 Y141.051 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.508 Y141.025 E.00088
G3 X98.732 Y138.256 I1.376 J-1.047 E.11863
G3 X99.323 Y138.306 I.142 J1.833 E.01915
G3 X97.657 Y141.196 I-.439 J1.672 E.20425
G1 X97.56 Y141.094 E.00453
G1 X97.818 Y140.788 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X98.759 Y138.647 I1.063 J-.81 E.0848
G3 X99.221 Y138.685 I.115 J1.418 E.01389
G3 X97.856 Y140.834 I-.34 J1.293 E.14967
; WIPE_START
M204 S10000
G1 X97.639 Y140.489 E-.15497
G1 X97.548 Y140.152 E-.13254
G1 X97.537 Y139.977 E-.06684
G1 X97.548 Y139.802 E-.06662
G1 X97.639 Y139.465 E-.13258
G1 X97.813 Y139.162 E-.13258
G1 X97.929 Y139.031 E-.06672
G1 X97.944 Y139.02 E-.00713
; WIPE_END
G1 E-.04 F1800
G1 X105.421 Y137.487 Z3.2 F30000
G1 X125.095 Y133.453 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.957 E.33778
G1 X125.654 Y143.957 E.01797
G1 X125.64 Y144.501 E.01748
G1 X95.602 Y144.501 E.9659
G1 X95.602 Y133.453 E.35525
G1 X125.035 Y133.453 E.94645
; WIPE_START
G1 X125.046 Y135.453 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.564 Y134.137 Z3.2 F30000
G1 X135.413 Y133.638 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.565 E.29569
G1 X134.203 Y143.565 E.03606
G1 F2640.684
G1 X133.944 Y143.565 E.00771
M106 S229.5
G1 F720
G1 X133.962 Y144.278 E.02123
M106 S191.25
G1 F923.707
G1 X133.963 Y144.315 E.00112
G1 F4670.338
G1 X133.563 Y144.315 E.01191
G1 F6364.704
G1 X133.163 Y144.315 E.01191
G1 X126.037 Y144.315 E.21228
G1 X126.038 Y144.278 E.00112
G1 X126.056 Y143.565 E.02123
M106 S229.5
G1 F720
G1 X125.798 Y143.565 E.00771
M106 S191.25
G1 F3168.714
G1 X125.487 Y143.565 E.00925
G1 F6364.704
G1 X125.487 Y143.165 E.01191
G1 X125.487 Y133.638 E.28377
G1 X126.058 Y133.638 E.017
G1 F3906.75
G1 X126.317 Y133.638 E.00771
M106 S229.5
G1 F1440
G1 X126.322 Y133.433 E.00611
M106 S191.25
G1 F1778.103
G1 X126.323 Y133.389 E.00133
G1 F6364.704
G1 X126.723 Y133.389 E.01191
G1 X133.677 Y133.389 E.20712
G1 X133.678 Y133.433 E.00133
G1 F3294.667
G1 X133.683 Y133.638 E.00611
M106 S229.5
G1 F1440
G1 X133.942 Y133.638 E.00771
M106 S191.25
G1 F5760
G1 X134.342 Y133.638 E.01191
G1 F6364.704
G1 X134.742 Y133.638 E.01191
G1 X135.353 Y133.638 E.0182
; WIPE_START
M204 S10000
G1 X135.365 Y135.638 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.044 Z3.2 F30000
G1 X149.967 Y134.498 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.296 Y134.451 E.01069
G3 X151.037 Y134.578 I.1 J1.636 E.02439
G3 X149.91 Y134.514 I-.656 J1.598 E.3121
G1 X150.03 Y134.889 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X150.321 Y134.842 I.355 J1.288 E.00881
G3 X150.722 Y134.884 I.046 J1.502 E.01203
G3 X149.972 Y134.906 I-.338 J1.293 E.22747
; WIPE_START
M204 S10000
G1 X150.321 Y134.842 E-.13484
G1 X150.549 Y134.85 E-.08668
G1 X150.722 Y134.884 E-.06685
G1 X151.044 Y135.018 E-.13269
G1 X151.32 Y135.23 E-.13236
G1 X151.437 Y135.362 E-.06702
G1 X151.611 Y135.664 E-.1324
G1 X151.617 Y135.682 E-.00716
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.453 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.457 E.32169
G1 X160.398 Y143.457 E.20908
G1 X160.398 Y144.501 E.03356
G1 X134.36 Y144.501 E.83727
G1 X134.346 Y143.957 E.01748
G1 X135.805 Y143.957 E.04691
G1 X135.805 Y133.453 E.33778
G1 X153.836 Y133.453 E.57981
G1 X154.288 Y133.639 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.065 E.28078
G1 X160.79 Y143.065 E.19367
G1 X160.79 Y144.893 E.05444
G1 X95.21 Y144.893 E1.9534
G1 X95.21 Y133.061 E.35243
G1 X160.79 Y133.061 E1.9534
G1 X160.79 Y133.639 E.01721
G1 X154.348 Y133.639 E.19189
M204 S10000
G1 X154.092 Y133.35 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22855
G1 F12928.946
G1 X160.594 Y133.35 E.09534
G1 X151.061 Y133.816 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383266
G1 F3000;_EXTRUDE_SET_SPEED
G1 X153.374 Y133.814 E.06219
G1 X153.507 Y133.842 E.00365
G1 X153.533 Y133.972 E.00355
G1 X153.533 Y142.888 E.23971
G1 X153.413 Y143.156 E.0079
G1 X153.33 Y143.196 E.00248
; Slow Down End
G1 X153.161 Y143.773 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.305 Y143.629 E.00655
G1 X153.344 Y143.668 E.00179
G1 X153.344 Y144.152 E.01557
G1 X152.781 Y144.152 E.0181
G1 X153.161 Y143.773 E.01726
G1 X153.693 Y143.979 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.67952
G1 F3770.029
G1 X160.194 Y143.979 E.32696
G1 X152.283 Y144.138 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X145.768 Y144.138 E.17497
; Slow Down End
G1 X144.285 Y144.138 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X138.11 Y144.138 E.16584
; Slow Down End
G1 X136.654 Y144.138 F30000
; Slow Down Start
; LINE_WIDTH: 0.383928
G1 F3000;_EXTRUDE_SET_SPEED
G1 X136.399 Y144.111 E.00693
G1 X136.344 Y143.804 E.0084
G1 X136.195 Y143.749 E.00427
G1 X136.168 Y143.617 E.00363
G1 X136.168 Y133.972 E.25982
G1 X136.194 Y133.842 E.00356
G1 X136.327 Y133.814 E.00366
M73 P61 R8
G1 X149.629 Y133.816 E.35832
; Slow Down End
G1 X150.674 Y133.877 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X150.592 Y134.112 I-.229 J.051 E.00843
G2 X150.133 Y134.123 I-.199 J1.3 E.01486
G1 X150.058 Y133.801 E.01061
G1 X150.692 Y133.801 E.02037
G1 X150.674 Y133.877 E.0025
G1 X150.974 Y134.178 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X151.434 Y134.382 E.01351
G1 X151.833 Y134.688 E.01351
G1 X152.17 Y135.117 E.01466
G1 X152.383 Y135.618 E.01462
G1 X152.459 Y136.157 E.01461
G1 X152.393 Y136.697 E.01461
G1 X152.189 Y137.201 E.01461
G1 X151.86 Y137.637 E.01467
G1 X151.433 Y137.97 E.01455
G1 X150.933 Y138.183 E.0146
G1 X150.391 Y138.268 E.01472
G3 X149.119 Y137.847 I.061 J-2.317 E.03651
G1 X148.728 Y137.465 E.01467
G1 X148.451 Y136.996 E.01464
G1 X148.304 Y136.469 E.0147
G1 X148.298 Y135.926 E.01459
G1 X148.435 Y135.394 E.01474
G1 X148.702 Y134.92 E.01461
G1 X149.085 Y134.53 E.0147
G1 X149.555 Y134.253 E.01465
G1 X149.717 Y134.201 E.00457
; Slow Down End
G1 X137.803 Y134.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X136.53 Y134.175 E.04093
G1 X136.53 Y134.53 E.01143
G1 X145.775 Y143.775 E.42041
G1 X148.605 Y143.775 E.09098
G1 X153.17 Y139.209 E.20764
G1 X153.17 Y135.819 E.10904
G1 X152.676 Y135.324 E.02248
G3 X147.983 Y136.721 I-2.302 J.848 E.2579
G1 X140.928 Y143.775 E.32083
G1 X138.099 Y143.775 E.09097
G1 X136.53 Y142.206 E.07134
G1 X136.53 Y140.497 E.05496
G1 X142.853 Y134.175 E.28751
G1 X143.851 Y134.175 E.0321
G1 X152.967 Y143.291 E.41456
G1 X152.967 Y143.775 E.01557
G1 X151.823 Y143.775 E.03679
G1 X136.009 Y144.229 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17935
G1 F15000
G1 X134.557 Y144.229 E.01564
G1 X134.167 Y144.604 F30000
; LINE_WIDTH: 0.22839
G1 F12940.098
G1 X125.833 Y144.604 E.1221
G1 X125.443 Y144.229 F30000
; LINE_WIDTH: 0.17935
G1 F15000
G1 X124.891 Y144.229 E.00595
G1 X123.535 Y144.138 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F7058.823
G1 X122.744 Y144.138 E.02125
G1 X121.266 Y144.138 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X115.086 Y144.138 E.16598
; Slow Down End
G1 X113.635 Y144.138 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X107.426 Y144.138 E.16677
; Slow Down End
G1 X106.005 Y144.138 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X99.801 Y144.138 E.16663
; Slow Down End
G1 X98.376 Y144.138 F30000
; Slow Down Start
; LINE_WIDTH: 0.383527
G1 F3000;_EXTRUDE_SET_SPEED
G1 X96.124 Y144.138 E.06058
G1 X95.992 Y144.111 E.00362
G1 X95.965 Y143.979 E.00362
G1 X95.965 Y133.972 E.26924
G1 X95.991 Y133.842 E.00355
G1 X96.124 Y133.814 E.00366
G1 X97.455 Y133.814 E.0358
G1 X97.642 Y133.869 E.00524
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.460111
;_EXTRUDE_SET_SPEED
G1 X97.573 Y134.216 E.01165
G1 X97.601 Y134.277 E.00219
G1 X97.221 Y134.706 E.01891
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.383165
;_EXTRUDE_SET_SPEED
G1 X96.949 Y135.177 E.0146
G1 X96.807 Y135.703 E.01463
G1 X96.807 Y136.247 E.01464
G1 X96.948 Y136.772 E.0146
G1 X97.219 Y137.242 E.01459
G1 X97.607 Y137.63 E.01475
G1 X98.012 Y137.899 E.01307
G1 X97.982 Y138.075 E.00478
G1 X97.514 Y138.391 E.01519
G1 X97.203 Y138.716 E.01208
G1 X96.957 Y139.16 E.01365
G1 X96.811 Y139.684 E.0146
G1 X96.806 Y140.231 E.01472
G1 X96.943 Y140.757 E.01459
G1 X97.21 Y141.23 E.0146
G1 X97.592 Y141.617 E.01462
G1 X98.06 Y141.893 E.0146
G1 X98.585 Y142.039 E.01466
G1 X99.126 Y142.044 E.01453
G1 X99.654 Y141.909 E.01466
G2 X100.256 Y141.544 I-.542 J-1.573 E.01906
G1 X100.545 Y141.238 E.01131
G1 X100.8 Y140.797 E.01368
G1 X100.946 Y140.269 E.01472
G1 X100.952 Y139.725 E.01462
G1 X100.815 Y139.195 E.01473
G1 X100.548 Y138.72 E.01464
G1 X100.166 Y138.331 E.01467
G1 X99.77 Y138.083 E.01254
G1 X99.751 Y137.942 E.00381
G1 X99.818 Y137.84 E.00329
G1 X100.143 Y137.63 E.0104
G1 X100.531 Y137.242 E.01475
G1 X100.802 Y136.772 E.01459
G1 X100.943 Y136.243 E.01469
G1 X100.943 Y135.706 E.01444
G1 X100.801 Y135.177 E.01474
G1 X100.529 Y134.707 E.01458
G1 X100.149 Y134.277 E.01543
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.446421
;_EXTRUDE_SET_SPEED
G1 X100.194 Y134.182 E.00336
G1 X100.109 Y133.87 E.01029
G1 X100.295 Y133.816 E.00617
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.383043
;_EXTRUDE_SET_SPEED
G1 X124.573 Y133.814 E.65228
G1 X124.706 Y133.842 E.00365
G1 X124.732 Y133.972 E.00355
G1 X124.732 Y142.881 E.23937
; Slow Down End
G1 X125.291 Y133.35 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228073
G1 F12962.312
G1 X126.128 Y133.35 E.01224
G1 X133.872 Y133.35 F30000
; LINE_WIDTH: 0.22809
G1 F12961.064
G1 X135.609 Y133.35 E.02541
; WIPE_START
G1 X133.872 Y133.35 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.294 Y134.261 Z3.2 F30000
G1 X100.931 Y137.311 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X107.395 Y143.775 E.29399
G1 X110.225 Y143.775 E.09097
G1 X119.825 Y134.175 E.43658
G1 X120.823 Y134.175 E.0321
G1 X124.369 Y137.721 E.16127
G1 X124.369 Y137.307 E.01334
G1 X117.901 Y143.775 E.29418
G1 X115.071 Y143.775 E.09097
G1 X105.471 Y134.175 E.43658
G1 X104.473 Y134.175 E.0321
G1 X100.504 Y138.144 E.18049
G3 X98.305 Y142.361 I-1.627 J1.833 E.20896
G1 X99.72 Y143.775 E.06432
G1 X102.549 Y143.775 E.09097
G1 X112.149 Y134.175 E.43658
G1 X113.147 Y134.175 E.0321
G1 X122.747 Y143.775 E.43658
G1 X124.369 Y143.769 E.05216
G1 X99.325 Y138.074 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116045
G1 F15000
G1 X99.159 Y138.018 E.00102
; LINE_WIDTH: 0.142449
G1 X99.133 Y138.005 E.00023
; LINE_WIDTH: 0.181902
G1 X99.098 Y137.977 E.00049
G1 X99.115 Y137.963 E.00023
; LINE_WIDTH: 0.165673
G1 X99.131 Y137.949 E.00021
; LINE_WIDTH: 0.149987
G1 X99.137 Y137.945 E.00006
; LINE_WIDTH: 0.119079
G3 X99.324 Y137.879 I.366 J.743 E.00119
G1 X99.098 Y137.977 F30000
; LINE_WIDTH: 0.187634
G1 F15000
G1 X98.651 Y137.977 E.00511
G1 X98.62 Y137.95 E.00047
; LINE_WIDTH: 0.14397
G1 X98.591 Y137.935 E.00026
; LINE_WIDTH: 0.116268
G1 X98.426 Y137.88 E.00101
G1 X96.513 Y135.304 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X97.062 Y134.324 I3.081 J1.082 E.03631
G1 X97.024 Y134.297 E.00151
G1 X97.095 Y134.175 E.00453
G1 X96.797 Y134.175 E.00957
G1 X96.327 Y134.645 E.02135
G1 X96.327 Y140.383 E.18453
G3 X96.604 Y140.915 I-.486 J.59 E.01981
G2 X97.043 Y141.605 I2.417 J-1.055 E.0264
G1 X96.327 Y142.321 E.03256
G1 X96.327 Y143.775 E.04678
G1 X96.501 Y143.775 E.00558
; WIPE_START
G1 X96.327 Y143.775 E-.06598
G1 X96.327 Y142.321 E-.55278
G1 X96.59 Y142.058 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X98.107 Y134.577 Z3.2 F30000
G1 X98.192 Y134.156 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405819
G1 F6613.413
G1 X98.336 Y133.917 E.00798
; LINE_WIDTH: 0.468788
G1 F5635.553
G1 X98.359 Y133.881 E.00145
G1 X98.584 Y133.859 E.00761
; LINE_WIDTH: 0.436896
G1 F6091.744
G3 X99.139 Y133.858 I.297 J6.134 E.01728
; LINE_WIDTH: 0.46847
G1 F5639.765
G3 X99.391 Y133.881 I-.244 J3.951 E.0085
G1 X99.403 Y133.899 E.00073
; LINE_WIDTH: 0.445635
G1 F5959.555
G1 X99.414 Y133.917 E.00069
; LINE_WIDTH: 0.40581
G1 F6613.584
G1 X99.558 Y134.156 E.00798
; WIPE_START
G1 X99.414 Y133.917 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.278 Y126.516 Z3.2 F30000
G1 X104.986 Y111.786 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.964 Y111.774 E.00079
G3 X105.54 Y108.453 I.67 J-1.594 E.1495
G3 X106.073 Y108.507 I.082 J1.861 E.0173
G3 X105.178 Y111.847 I-.438 J1.673 E.17531
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.566 Y108.844 I.517 J-1.233 E.1073
G3 X105.971 Y108.886 I.054 J1.45 E.01218
G3 X105.17 Y111.433 I-.339 J1.293 E.12889
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.0894
M73 P62 R8
G1 X104.811 Y111.24 E-.06617
G1 X104.563 Y110.993 E-.13316
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13253
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.0729
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z3.2 F30000
G1 X156.053 Y111.336 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.04 Y108.253 I1.228 J-1.217 E.12771
G3 X157.573 Y108.307 I.082 J1.86 E.0173
G3 X156.104 Y111.367 I-.438 J1.673 E.19595
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.066 Y108.644 I.818 J-1.057 E.0969
G3 X157.471 Y108.686 I.054 J1.449 E.01218
G3 X156.362 Y111.072 I-.339 J1.293 E.13929
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15554
G1 X155.889 Y110.49 E-.13269
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.06629
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.07361
; WIPE_END
G1 E-.04 F1800
G1 X156.712 Y112.301 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.982 Y112.257 E.00879
G3 X157.573 Y112.307 I.143 J1.835 E.01917
G3 X156.654 Y112.318 I-.439 J1.672 E.31945
G1 X156.786 Y112.685 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X157.008 Y112.648 E.00671
G3 X157.471 Y112.686 I.116 J1.419 E.0139
G3 X156.73 Y112.704 I-.34 J1.293 E.22777
; WIPE_START
M204 S10000
G1 X157.008 Y112.648 E-.10808
G1 X157.3 Y112.652 E-.11077
G1 X157.471 Y112.686 E-.06652
G1 X157.637 Y112.742 E-.06628
G1 X157.939 Y112.917 E-.13268
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13269
G1 X158.37 Y113.491 E-.00983
; WIPE_END
G1 E-.04 F1800
G1 X153.605 Y117.959 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.959 E.33774
G1 X153.545 Y117.959 E1.22677
G1 X153.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y117.566 E1.11479
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.506 E.29387
; WIPE_START
M204 S10000
G1 X151.213 Y117.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.767 Y118.601 Z3.2 F30000
G1 X160.79 Y118.893 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.25 E.01433
G1 X105.143 Y118.153 E.45038
G1 X104.801 Y118.153 E.01099
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.14 Y107.804 E.19055
G1 X102.128 Y107.804 E.06391
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07449
G1 X97.467 Y118.153 E.30022
G1 X97.125 Y118.153 E.01099
G1 X95.95 Y116.978 E.05343
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27531
G1 X112.819 Y118.153 E.01099
G1 X115.047 Y115.925 E.10131
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23842
G1 X107.816 Y107.804 E.06391
G1 X106.998 Y108.622 E.03722
G2 X105.499 Y108.107 I-1.373 J1.555 E.0523
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.86 Y107.804 E.05236
G1 X155.941 Y107.919 E.00454
G1 X155.789 Y108.173 E.00952
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.714 E.03446
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.408963
G1 F6556.609
G1 X156.586 Y107.919 E.00807
; LINE_WIDTH: 0.468831
G1 F5634.987
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436035
G1 F6105.085
G3 X157.392 Y107.86 I.299 J5.928 E.01743
; LINE_WIDTH: 0.468369
G1 F5641.102
G3 X157.641 Y107.884 I-.244 J3.866 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447022
G1 F5939.097
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409167
G1 F6552.965
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.116595
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149291
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180169
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144887
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116597
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187184
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.86 Y112.006 E.00048
; LINE_WIDTH: 0.144848
G1 X156.833 Y112.02 E.00025
; LINE_WIDTH: 0.116593
G1 X156.666 Y112.077 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05075
G1 X153.953 Y113.574 E.05869
G1 X155.251 Y114.872 E.05903
G2 X156.232 Y115.852 I2.056 J-1.075 E.04528
G1 X158.533 Y118.153 E.10464
G1 X158.875 Y118.153 E.01099
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y111.994 E.16028
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.951 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/41
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S102
G17
G3 Z3.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.702
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.701 E.00079
G3 X98.793 Y134.247 I.006 J-1.728 E.17153
G3 X99.537 Y134.375 I.103 J1.637 E.02449
G3 X99.1 Y137.687 I-.656 J1.598 E.14584
G1 X98.959 Y137.698 E.00455
G1 X98.879 Y137.31 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.875 Y137.31 E.00012
G3 X98.818 Y134.639 I.009 J-1.336 E.12281
G3 X99.222 Y134.68 I.05 J1.493 E.01213
G3 X99.222 Y137.267 I-.338 J1.293 E.10473
G1 X98.939 Y137.303 E.0085
; WIPE_START
M204 S10000
G1 X98.875 Y137.31 E-.02436
G1 X98.701 Y137.299 E-.06631
G1 X98.528 Y137.265 E-.06688
G1 X98.206 Y137.132 E-.13258
G1 X97.93 Y136.919 E-.13236
G1 X97.813 Y136.787 E-.06699
G1 X97.639 Y136.485 E-.13263
G1 X97.548 Y136.148 E-.13254
G1 X97.547 Y136.134 E-.00535
; WIPE_END
G1 E-.04 F1800
G1 X97.486 Y141.005 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.384 Y140.835 E.00639
G3 X98.725 Y138.253 I1.5 J-.86 E.11117
G3 X99.323 Y138.302 I.15 J1.837 E.0194
G3 X97.528 Y141.047 I-.44 J1.672 E.2105
G1 X97.822 Y140.799 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.821 Y140.782 E.00049
G3 X98.751 Y138.644 I1.064 J-.809 E.08441
G3 X99.05 Y138.647 I.137 J1.096 E.00893
G3 X97.935 Y140.914 I-.165 J1.326 E.15163
G1 X97.864 Y140.842 E.00301
; WIPE_START
M204 S10000
G1 X97.821 Y140.782 E-.028
G1 X97.639 Y140.486 E-.13231
G1 X97.548 Y140.149 E-.13255
G1 X97.537 Y139.973 E-.06684
G1 X97.548 Y139.798 E-.06662
G1 X97.639 Y139.461 E-.13257
G1 X97.813 Y139.159 E-.13262
G1 X97.929 Y139.028 E-.06672
G1 X97.933 Y139.025 E-.00179
; WIPE_END
G1 E-.04 F1800
G1 X105.41 Y137.49 Z3.4 F30000
G1 X125.095 Y133.45 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.954 E.33778
G1 X125.954 Y143.954 E.02762
G1 X125.94 Y144.497 E.01748
G1 X95.602 Y144.497 E.97554
G1 X95.602 Y133.45 E.35525
G1 X125.035 Y133.45 E.94645
; WIPE_START
G1 X125.046 Y135.449 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.564 Y134.133 Z3.4 F30000
G1 X135.413 Y133.635 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.562 E.29569
G1 X133.903 Y143.562 E.04499
G1 F2640.684
G1 X133.644 Y143.562 E.00771
M106 S229.5
G1 F720
G1 X133.662 Y144.274 E.02123
M106 S102
G1 F923.649
G1 X133.663 Y144.312 E.00112
G1 F4670.209
G1 X133.263 Y144.312 E.01191
G1 F6364.704
G1 X132.863 Y144.312 E.01191
G1 X126.337 Y144.312 E.19441
G1 X126.338 Y144.274 E.00112
G1 X126.356 Y143.562 E.02123
M106 S229.5
G1 F720
G1 X126.097 Y143.562 E.00771
M106 S102
G1 F6364.704
G1 X125.487 Y143.562 E.01818
G1 X125.487 Y133.635 E.29569
G1 X126.358 Y133.635 E.02594
G1 F3906.987
G1 X126.617 Y133.635 E.00771
M106 S229.5
G1 F1440
G1 X126.622 Y133.43 E.00611
M106 S102
G1 F1778.103
G1 X126.623 Y133.385 E.00133
G1 F6364.704
G1 X127.023 Y133.385 E.01191
G1 X133.377 Y133.385 E.18925
G1 X133.378 Y133.43 E.00133
G1 F3294.558
G1 X133.383 Y133.635 E.00611
M106 S229.5
G1 F1440
G1 X133.642 Y133.635 E.00771
M106 S102
G1 F5760
G1 X134.042 Y133.635 E.01191
G1 F6364.704
G1 X134.442 Y133.635 E.01191
G1 X135.353 Y133.635 E.02713
; WIPE_START
M204 S10000
G1 X135.365 Y135.635 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.041 Z3.4 F30000
G1 X149.967 Y134.495 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.293 Y134.447 E.01061
G3 X151.037 Y134.575 I.103 J1.637 E.02449
G3 X149.909 Y134.511 I-.656 J1.598 E.31208
G1 X150.029 Y134.88 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X150.318 Y134.839 E.00871
G3 X150.722 Y134.88 I.05 J1.494 E.01212
G3 X149.977 Y134.901 I-.337 J1.293 E.22761
; WIPE_START
M204 S10000
G1 X150.318 Y134.839 E-.1319
G1 X150.549 Y134.847 E-.08785
G1 X150.722 Y134.88 E-.06684
G1 X151.044 Y135.014 E-.1327
G1 X151.32 Y135.227 E-.13236
G1 X151.437 Y135.359 E-.06699
G1 X151.611 Y135.661 E-.13243
G1 X151.619 Y135.683 E-.00893
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.45 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.454 E.32169
G1 X160.398 Y143.454 E.20908
G1 X160.398 Y144.497 E.03356
G1 X134.06 Y144.497 E.84692
G1 X134.046 Y143.954 E.01748
G1 X135.805 Y143.954 E.05656
G1 X135.805 Y133.45 E.33778
G1 X153.836 Y133.45 E.57981
G1 X154.288 Y133.635 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.061 E.28077
G1 X160.79 Y143.061 E.19367
G1 X160.79 Y144.889 E.05444
G1 X95.21 Y144.889 E1.9534
G1 X95.21 Y133.057 E.35243
G1 X160.79 Y133.057 E1.9534
G1 X160.79 Y133.635 E.01721
G1 X154.348 Y133.635 E.19189
M204 S10000
G1 X154.092 Y133.346 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22861
G1 F12924.767
G1 X160.594 Y133.346 E.09537
; WIPE_START
G1 X158.594 Y133.346 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.029 Y134.359 Z3.4 F30000
G1 X150.989 Y134.365 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40627
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X151.534 Y133.819 E.0395
G1 X152.179 Y133.819 E.03304
G1 X151.557 Y134.441 E.04505
G3 X151.906 Y134.738 I-1.267 J1.839 E.02348
G1 X152.825 Y133.819 E.06655
G1 X153.47 Y133.819 E.03304
G1 X152.183 Y135.106 E.09318
G3 X152.38 Y135.555 I-2.206 J1.233 E.02512
G1 X153.526 Y134.408 E.08302
G1 X153.526 Y135.054 E.03304
G1 X152.473 Y136.107 E.07629
G3 X152.352 Y136.873 I-1.822 J.105 E.04001
G1 X153.526 Y135.699 E.08503
G1 X153.526 Y136.344 E.03304
G1 X145.768 Y144.102 E.56173
G1 X145.774 Y144.127 E.00133
G1 X146.388 Y144.127 E.03147
G1 X153.526 Y136.989 E.51686
G1 X153.526 Y137.635 E.03304
G1 X147.033 Y144.127 E.47014
G1 X147.679 Y144.127 E.03304
G1 X153.526 Y138.28 E.42342
G1 X153.526 Y138.925 E.03304
G1 X148.324 Y144.127 E.37669
G1 X148.969 Y144.127 E.03304
G1 X153.526 Y139.57 E.32997
G1 X153.526 Y140.216 E.03304
G1 X149.614 Y144.127 E.28325
G1 X150.26 Y144.127 E.03304
G1 X153.526 Y140.861 E.23652
G1 X153.526 Y141.506 E.03304
G1 X150.905 Y144.127 E.1898
G1 X151.55 Y144.127 E.03304
G1 X153.526 Y142.151 E.14308
G1 X153.526 Y142.797 E.03304
G1 X151.993 Y144.33 E.11102
M106 S102
M73 P63 R8
G1 X153.344 Y143.668 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5895.652
G1 X153.305 Y143.629 E.00179
G1 X153.693 Y143.975 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.67951
G1 F3770.088
G1 X160.194 Y143.975 E.32695
; WIPE_START
G1 X158.194 Y143.975 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.432 Y138.011 Z3.4 F30000
G1 X150.192 Y133.953 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.64318
G1 F3998.268
G1 X150.49 Y133.958 E.01413
; WIPE_START
G1 X150.192 Y133.953 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.885 Y140.832 Z3.4 F30000
G1 X145.488 Y143.737 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40627
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X151.076 Y138.149 E.40459
G3 X150.311 Y138.269 I-.648 J-1.637 E.03997
G1 X144.825 Y143.755 E.39723
G1 X144.173 Y144.127 E.03848
G1 X143.807 Y144.127 E.01871
G1 X149.763 Y138.172 E.43124
G3 X149.307 Y137.982 I.608 J-2.096 E.02531
G1 X143.162 Y144.127 E.445
G1 X142.517 Y144.127 E.03304
G1 X148.94 Y137.704 E.46514
G3 X148.643 Y137.356 I1.519 J-1.598 E.02348
G1 X141.871 Y144.127 E.49034
G1 X141.226 Y144.127 E.03304
G1 X148.419 Y136.935 E.52083
G3 X148.289 Y136.419 I2.453 J-.89 E.02728
G1 X140.581 Y144.127 E.55818
G1 X139.935 Y144.127 E.03304
G1 X148.323 Y135.74 E.60735
G3 X149.324 Y134.353 I2.077 J.444 E.09013
G1 X149.703 Y134.168 E.02158
G1 X149.622 Y133.819 E.01832
G1 X149.598 Y133.819 E.00123
G1 X139.29 Y144.127 E.7464
G1 X138.645 Y144.127 E.03304
G1 X148.953 Y133.819 E.7464
G1 X148.308 Y133.819 E.03304
G1 X138.093 Y144.034 E.73967
G1 X137.965 Y143.517 E.02729
G1 X147.663 Y133.819 E.70221
G1 X147.017 Y133.819 E.03304
G1 X136.928 Y143.909 E.73059
G1 X136.378 Y144.22 E.03231
G1 X136.378 Y143.813 E.02082
G1 X146.372 Y133.819 E.72364
G1 X145.727 Y133.819 E.03304
G1 X136.175 Y143.371 E.69165
G1 X136.175 Y142.726 E.03304
G1 X145.082 Y133.819 E.64493
G1 X144.436 Y133.819 E.03304
G1 X136.175 Y142.081 E.59821
G1 X136.175 Y141.435 E.03304
G1 X143.791 Y133.819 E.55148
G1 X143.146 Y133.819 E.03304
G1 X136.175 Y140.79 E.50476
G1 X136.175 Y140.145 E.03304
G1 X142.501 Y133.819 E.45804
G1 X141.855 Y133.819 E.03304
G1 X136.175 Y139.5 E.41132
G1 X136.175 Y138.854 E.03304
G1 X141.21 Y133.819 E.36459
G1 X140.565 Y133.819 E.03304
G1 X136.175 Y138.209 E.31787
G1 X136.175 Y137.564 E.03304
G1 X139.919 Y133.819 E.27115
G1 X139.274 Y133.819 E.03304
G1 X136.175 Y136.919 E.22442
G1 X136.175 Y136.273 E.03304
G1 X138.629 Y133.819 E.1777
G1 X137.984 Y133.819 E.03304
G1 X136.175 Y135.628 E.13098
G1 X136.175 Y134.983 E.03304
G1 X137.338 Y133.819 E.08426
G1 X136.693 Y133.819 E.03304
G1 X135.972 Y134.54 E.0522
M106 S102
G1 X135.609 Y133.346 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22812
; LAYER_HEIGHT: 0.2
G1 F12958.964
G1 X133.572 Y133.346 E.0298
G1 X126.428 Y133.346 F30000
; LINE_WIDTH: 0.228103
G1 F12960.197
G1 X125.291 Y133.346 E.01663
G1 X124.891 Y144.225 F30000
; LINE_WIDTH: 0.17933
G1 F15000
G1 X125.743 Y144.225 E.00918
G1 X126.133 Y144.6 F30000
; LINE_WIDTH: 0.22837
G1 F12941.494
G1 X133.867 Y144.6 E.1133
G1 X134.257 Y144.225 F30000
; LINE_WIDTH: 0.17933
G1 F15000
G1 X136.009 Y144.225 E.01887
G1 X123.246 Y144.33 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40439
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X124.725 Y142.851 E.10609
G1 X124.725 Y142.209 E.0326
G1 X122.806 Y144.128 E.13766
G1 X122.749 Y144.128 E.0029
G1 X122.648 Y143.644 E.02508
G1 X124.725 Y141.566 E.14905
G1 X124.725 Y140.923 E.0326
G1 X122.009 Y143.64 E.19487
G1 X121.153 Y144.128 E.04996
G1 X120.879 Y144.128 E.01394
G1 X124.725 Y140.281 E.27597
G1 X124.725 Y139.638 E.0326
G1 X120.236 Y144.128 E.32207
G1 X119.593 Y144.128 E.0326
G1 X124.725 Y138.996 E.36817
G1 X124.725 Y138.353 E.0326
G1 X118.951 Y144.128 E.41427
G1 X118.308 Y144.128 E.0326
G1 X124.725 Y137.71 E.46037
G1 X124.725 Y137.068 E.0326
G1 X117.666 Y144.128 E.50647
G1 X117.023 Y144.128 E.0326
G1 X124.725 Y136.425 E.55257
G1 X124.725 Y135.783 E.0326
G1 X116.38 Y144.128 E.59867
G1 X115.738 Y144.128 E.0326
G1 X124.725 Y135.14 E.64477
G1 X124.725 Y134.497 E.0326
G1 X115.095 Y144.128 E.69087
G1 X114.961 Y143.619 E.02667
G1 X124.725 Y133.855 E.70052
G1 X124.725 Y133.819 E.00181
G1 X124.118 Y133.819 E.03079
G1 X114.183 Y143.755 E.71278
G1 X113.522 Y144.128 E.03848
G1 X113.167 Y144.128 E.018
G1 X123.476 Y133.819 E.73953
G1 X122.833 Y133.819 E.0326
G1 X112.525 Y144.128 E.73953
G1 X111.882 Y144.128 E.0326
G1 X122.19 Y133.819 E.73953
G1 X121.548 Y133.819 E.0326
G1 X111.239 Y144.128 E.73953
G1 X110.597 Y144.128 E.0326
G1 X120.905 Y133.819 E.73953
G1 X120.263 Y133.819 E.0326
G1 X109.954 Y144.128 E.73953
G1 X109.312 Y144.128 E.0326
G1 X119.62 Y133.819 E.73953
G1 X118.977 Y133.819 E.0326
G1 X108.669 Y144.128 E.73953
G1 X108.026 Y144.128 E.0326
G1 X118.335 Y133.819 E.73953
G1 X117.692 Y133.819 E.0326
G1 X107.42 Y144.091 E.7369
G1 X107.269 Y143.599 E.02609
G1 X117.05 Y133.819 E.70163
G1 X116.407 Y133.819 E.0326
G1 X106.361 Y143.865 E.72071
G1 X105.891 Y144.128 E.02729
G1 X105.456 Y144.128 E.02208
G1 X115.764 Y133.819 E.73953
G1 X115.122 Y133.819 E.0326
G1 X104.813 Y144.128 E.73953
G1 X104.171 Y144.128 E.0326
G1 X114.479 Y133.819 E.73953
G1 X113.837 Y133.819 E.0326
G1 X103.528 Y144.128 E.73953
G1 X102.886 Y144.128 E.0326
G1 X113.194 Y133.819 E.73953
G1 X112.551 Y133.819 E.0326
G1 X102.243 Y144.128 E.73953
G1 X101.6 Y144.128 E.0326
G1 X111.909 Y133.819 E.73953
G1 X111.266 Y133.819 E.0326
G1 X100.958 Y144.128 E.73953
G1 X100.315 Y144.128 E.0326
G1 X110.624 Y133.819 E.73953
G1 X109.981 Y133.819 E.0326
G1 X99.748 Y144.052 E.73409
G1 X99.427 Y143.731 E.02305
G1 X109.338 Y133.819 E.71104
G1 X108.696 Y133.819 E.0326
G1 X98.544 Y143.971 E.72831
G1 X98.261 Y144.128 E.0164
G1 X97.745 Y144.128 E.02617
G1 X108.053 Y133.819 E.73953
G1 X107.411 Y133.819 E.0326
G1 X100.953 Y140.277 E.46329
G2 X100.947 Y139.64 I-1.507 J-.304 E.03254
G1 X106.768 Y133.819 E.41761
M73 P64 R8
G1 X106.125 Y133.819 E.0326
G1 X100.803 Y139.141 E.38182
G2 X100.569 Y138.733 I-1.824 J.776 E.02394
G1 X105.483 Y133.819 E.35253
G1 X104.84 Y133.819 E.0326
G1 X100.26 Y138.399 E.32859
G2 X99.888 Y138.128 I-1.231 J1.295 E.02339
G1 X104.198 Y133.819 E.30913
G1 X103.555 Y133.819 E.0326
G1 X100.916 Y136.458 E.1893
G2 X100.963 Y135.769 I-2.151 J-.492 E.03519
G1 X102.912 Y133.819 E.13985
G1 X102.27 Y133.819 E.0326
G1 X100.843 Y135.246 E.10236
G2 X100.626 Y134.82 I-2.052 J.775 E.02429
G1 X101.627 Y133.819 E.0718
G1 X100.985 Y133.819 E.0326
G1 X100.337 Y134.467 E.04644
G1 X100.099 Y134.258 E.01605
G1 X100.239 Y134.174 E.00829
G1 X100.144 Y134.017 E.00932
G1 X100.544 Y133.617 E.0287
M106 S102
G1 X99.558 Y134.153 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405815
; LAYER_HEIGHT: 0.2
G1 F6613.495
G1 X99.414 Y133.914 E.00798
; LINE_WIDTH: 0.445611
G1 F5959.91
G1 X99.403 Y133.896 E.00069
; LINE_WIDTH: 0.468509
G1 F5639.253
G1 X99.391 Y133.878 E.00073
G2 X99.139 Y133.854 I-.492 J3.884 E.0085
; LINE_WIDTH: 0.436928
G1 F6091.248
G2 X98.584 Y133.856 I-.258 J6.124 E.01728
; LINE_WIDTH: 0.468852
G1 F5634.704
G1 X98.359 Y133.878 E.00761
G1 X98.336 Y133.914 E.00144
; LINE_WIDTH: 0.406079
G1 F6608.678
G1 X98.192 Y134.153 E.00799
G1 X95.769 Y134.536 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40439
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X96.486 Y133.819 E.05145
G1 X97.129 Y133.819 E.0326
G1 X95.972 Y134.976 E.08302
G1 X95.972 Y135.619 E.0326
G1 X97.653 Y133.938 E.12063
G1 X97.511 Y134.174 E.01401
G1 X97.651 Y134.258 E.00829
G2 X96.866 Y135.367 I1.316 J1.763 E.07003
G1 X95.972 Y136.262 E.06419
G1 X95.972 Y136.904 E.0326
G1 X96.781 Y136.095 E.05808
G2 X96.885 Y136.634 I2.118 J-.128 E.02792
G1 X95.972 Y137.547 E.06552
G1 X95.972 Y138.189 E.0326
G1 X97.088 Y137.073 E.08012
G2 X97.369 Y137.435 I1.438 J-.823 E.02331
G1 X95.972 Y138.832 E.10022
G1 X95.972 Y139.475 E.0326
G1 X97.722 Y137.724 E.12557
G1 X98.08 Y137.965 E.02187
G1 X97.499 Y138.39 E.0365
G2 X96.946 Y139.142 I1.457 J1.649 E.04774
G1 X95.972 Y140.117 E.06993
G1 X95.972 Y140.76 E.0326
G1 X96.774 Y139.957 E.05757
G1 X96.801 Y140.385 E.02171
G1 X96.848 Y140.526 E.00755
G1 X95.972 Y141.402 E.0629
G1 X95.972 Y142.045 E.0326
G1 X97.035 Y140.982 E.07627
G2 X97.301 Y141.359 I1.965 J-1.105 E.02343
G1 X95.972 Y142.688 E.09535
G1 X95.972 Y143.33 E.0326
G1 X97.635 Y141.667 E.11934
G2 X98.043 Y141.901 I1.096 J-1.437 E.02395
G1 X95.972 Y143.973 E.14863
G1 X95.972 Y144.128 E.00785
G1 X96.46 Y144.128 E.02475
G1 X98.542 Y142.045 E.14939
G2 X99.179 Y142.051 I.332 J-1.506 E.03253
G1 X96.9 Y144.33 E.16349
M106 S102
; WIPE_START
G1 X98.314 Y142.916 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.62 Y137.946 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187633
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X98.652 Y137.973 E.00047
G1 X99.098 Y137.973 E.00511
G1 X99.115 Y137.959 F30000
; LINE_WIDTH: 0.165799
G1 F15000
G1 X99.131 Y137.946 E.00021
; LINE_WIDTH: 0.143328
G1 X99.159 Y137.932 E.00025
; LINE_WIDTH: 0.116128
G1 X99.324 Y137.876 E.00101
G1 X99.326 Y138.071 F30000
; LINE_WIDTH: 0.116067
G1 F15000
G1 X99.159 Y138.015 E.00102
; LINE_WIDTH: 0.14248
G1 X99.133 Y138.001 E.00023
; LINE_WIDTH: 0.181918
G1 X99.098 Y137.973 E.00049
G1 X99.115 Y137.959 E.00023
G1 X98.62 Y137.946 F30000
; LINE_WIDTH: 0.144017
G1 F15000
G1 X98.592 Y137.932 E.00026
; LINE_WIDTH: 0.116284
G1 X98.426 Y137.876 E.00101
; WIPE_START
G1 X98.592 Y137.932 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.405 Y130.518 Z3.4 F30000
G1 X104.986 Y111.786 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.534 Y108.453 I.668 J-1.594 E.14938
G3 X106.287 Y108.579 I.104 J1.693 E.02477
G3 X105.178 Y111.846 I-.655 J1.6 E.16781
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.561 Y108.844 I.517 J-1.232 E.10711
G3 X105.971 Y108.886 I.061 J1.438 E.01234
G3 X105.17 Y111.433 I-.339 J1.293 E.12891
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08942
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13317
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13253
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z3.4 F30000
G1 X156.053 Y111.336 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.034 Y108.253 I1.228 J-1.217 E.12752
G3 X157.573 Y108.307 I.088 J1.852 E.01749
G3 X156.103 Y111.367 I-.438 J1.673 E.19598
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.061 Y108.644 I.818 J-1.057 E.09672
G3 X157.471 Y108.686 I.061 J1.438 E.01235
G3 X156.362 Y111.072 I-.339 J1.293 E.13929
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15556
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.06629
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.713 Y112.301 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.987 Y112.256 E.00895
G3 X157.573 Y112.307 I.138 J1.833 E.01899
G3 X156.655 Y112.318 I-.439 J1.672 E.31946
G1 X156.781 Y112.686 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X157.014 Y112.648 E.00703
G3 X157.471 Y112.686 I.111 J1.417 E.01374
G3 X156.726 Y112.706 I-.34 J1.293 E.22765
; WIPE_START
M204 S10000
G1 X157.014 Y112.648 E-.11167
G1 X157.3 Y112.652 E-.10865
G1 X157.471 Y112.686 E-.06651
G1 X157.637 Y112.742 E-.06628
G1 X157.939 Y112.917 E-.13268
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13268
G1 X158.368 Y113.488 E-.00836
; WIPE_END
G1 E-.04 F1800
G1 X150.777 Y114.277 Z3.4 F30000
G1 X115.395 Y117.959 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z3.4 F30000
G1 X160.79 Y118.893 Z3.4
G1 Z3
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03445
G1 X155.789 Y108.173 E.00598
G1 X155.941 Y107.919 E.00952
G1 X155.86 Y107.804 E.00454
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409064
G1 F6554.807
G1 X156.586 Y107.919 E.00807
; LINE_WIDTH: 0.468846
G1 F5634.784
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436035
G1 F6105.085
G3 X157.392 Y107.86 I.299 J5.928 E.01743
; LINE_WIDTH: 0.468366
G1 F5641.144
G3 X157.641 Y107.884 I-.244 J3.866 E.0084
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446926
G1 F5940.508
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.40906
G1 F6554.871
G1 X157.808 Y108.158 E.00807
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03895
G3 X158.975 Y110.919 I-3.169 J-.498 E.02551
G1 X160.05 Y111.994 E.04887
M73 P65 R8
G1 X160.05 Y116.978 E.16028
G1 X158.875 Y118.153 E.05343
G1 X158.533 Y118.153 E.01099
G1 X156.232 Y115.852 E.10465
G3 X155.251 Y114.872 I1.075 J-2.056 E.04528
G1 X153.953 Y113.574 E.05903
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05075
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116587
G1 F15000
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146162
G1 X156.863 Y111.953 E.00027
; LINE_WIDTH: 0.187351
G1 X156.893 Y111.979 E.00045
G1 X157.358 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.149387
G1 F15000
G1 X157.417 Y111.937 E.00036
; LINE_WIDTH: 0.116624
G1 X157.584 Y111.879 E.00103
G1 X157.584 Y112.077 F30000
; LINE_WIDTH: 0.116574
G1 F15000
G1 X157.417 Y112.02 E.00103
; LINE_WIDTH: 0.144858
G1 X157.39 Y112.006 E.00025
; LINE_WIDTH: 0.18019
G1 X157.358 Y111.979 E.00046
G1 X157.38 Y111.958 E.00033
; WIPE_START
G1 X157.358 Y111.979 E-.31603
G1 X157.39 Y112.006 E-.44397
; WIPE_END
G1 E-.04 F1800
G1 X149.779 Y111.434 Z3.4 F30000
G1 X105.499 Y108.106 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.124 J2.074 E.0523
G1 X107.816 Y107.804 E.03722
G1 X109.804 Y107.804 E.06391
G1 X115.047 Y113.047 E.23842
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10131
G1 X112.477 Y118.153 E.01099
G1 X106.423 Y112.099 E.27531
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05343
G1 X97.467 Y118.153 E.01099
G1 X104.069 Y111.551 E.30022
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.07169
G1 X100.14 Y107.804 E.06391
G1 X95.95 Y111.994 E.19055
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01099
G1 X115.047 Y108.25 E.45038
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.25 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/41
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S147.9
G17
G3 Z3.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.699
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.697 E.00079
G3 X98.79 Y134.244 I.006 J-1.728 E.17142
G3 X99.537 Y134.371 I.106 J1.636 E.02459
G3 X99.1 Y137.683 I-.656 J1.598 E.14584
G1 X98.959 Y137.694 E.00455
G1 X98.882 Y137.306 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.875 Y137.306 E.0002
G3 X98.815 Y134.635 I.009 J-1.336 E.12271
G3 X99.222 Y134.677 I.054 J1.488 E.01222
G3 X99.222 Y137.263 I-.337 J1.293 E.10474
G1 X98.941 Y137.299 E.00843
; WIPE_START
M204 S10000
G1 X98.875 Y137.306 E-.02531
G1 X98.701 Y137.295 E-.06633
G1 X98.528 Y137.262 E-.06687
G1 X98.206 Y137.128 E-.13256
G1 X97.93 Y136.916 E-.13238
G1 X97.813 Y136.784 E-.067
G1 X97.639 Y136.481 E-.13264
G1 X97.548 Y136.144 E-.13251
G1 X97.548 Y136.133 E-.0044
; WIPE_END
G1 E-.04 F1800
G1 X97.486 Y141.001 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.384 Y140.831 E.00638
G3 X98.717 Y138.25 I1.499 J-.861 E.11092
G3 X99.323 Y138.299 I.157 J1.841 E.01965
G3 X97.528 Y141.043 I-.44 J1.672 E.2104
G1 X97.824 Y140.797 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.821 Y140.779 E.00055
G3 X98.743 Y138.641 I1.063 J-.809 E.08421
G3 X99.05 Y138.644 I.143 J1.124 E.00916
G3 X97.935 Y140.91 I-.166 J1.326 E.15149
G1 X97.866 Y140.84 E.00295
; WIPE_START
M204 S10000
G1 X97.821 Y140.779 E-.0288
G1 X97.639 Y140.482 E-.13229
G1 X97.548 Y140.145 E-.13253
G1 X97.537 Y139.97 E-.06686
G1 X97.548 Y139.795 E-.06663
G1 X97.639 Y139.458 E-.13257
G1 X97.813 Y139.155 E-.1326
G1 X97.929 Y139.024 E-.06669
G1 X97.932 Y139.022 E-.00103
; WIPE_END
G1 E-.04 F1800
G1 X105.408 Y137.488 Z3.6 F30000
G1 X125.095 Y133.446 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.95 E.33778
G1 X126.254 Y143.95 E.03726
G1 X126.239 Y144.494 E.01748
G1 X95.602 Y144.494 E.98519
G1 X95.602 Y133.446 E.35525
G1 X125.035 Y133.446 E.94645
; WIPE_START
G1 X125.046 Y135.446 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.564 Y134.13 Z3.6 F30000
G1 X135.413 Y133.631 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.558 E.29569
G1 X133.603 Y143.558 E.05392
G1 F2640.684
G1 X133.344 Y143.558 E.00771
M106 S229.5
G1 F720
G1 X133.362 Y144.271 E.02123
M106 S147.9
G1 F923.649
G1 X133.363 Y144.308 E.00112
G1 F4670.209
G1 X132.963 Y144.308 E.01191
G1 F6364.704
G1 X132.563 Y144.308 E.01191
G1 X126.637 Y144.308 E.17654
G1 X126.638 Y144.271 E.00112
G1 X126.656 Y143.558 E.02123
M106 S229.5
G1 F720
G1 X126.397 Y143.558 E.00771
M106 S147.9
G1 F6364.704
G1 X125.487 Y143.558 E.02712
G1 X125.487 Y133.631 E.29569
G1 X126.658 Y133.631 E.03488
G1 F3906.868
G1 X126.917 Y133.631 E.00771
M106 S229.5
G1 F1440
G1 X126.922 Y133.426 E.00611
M106 S147.9
G1 F1778.103
G1 X126.923 Y133.382 E.00133
G1 F6364.704
G1 X127.323 Y133.382 E.01191
G1 X133.077 Y133.382 E.17138
G1 X133.078 Y133.426 E.00133
G1 F3294.34
G1 X133.083 Y133.631 E.00611
M106 S229.5
G1 F1440
G1 X133.342 Y133.631 E.00771
M106 S147.9
G1 F5760
G1 X133.742 Y133.631 E.01191
G1 F6364.704
G1 X134.142 Y133.631 E.01191
G1 X135.353 Y133.631 E.03607
; WIPE_START
M204 S10000
G1 X135.365 Y135.631 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.037 Z3.6 F30000
G1 X149.967 Y134.491 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.29 Y134.444 E.01051
G3 X151.037 Y134.571 I.106 J1.637 E.02459
G3 X149.909 Y134.508 I-.656 J1.599 E.31208
G1 X150.029 Y134.877 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X150.315 Y134.835 E.00861
G3 X150.722 Y134.877 I.054 J1.489 E.01222
G3 X149.977 Y134.897 I-.337 J1.293 E.22761
; WIPE_START
M204 S10000
G1 X150.315 Y134.835 E-.13069
G1 X150.549 Y134.843 E-.08901
G1 X150.722 Y134.877 E-.06686
G1 X151.044 Y135.011 E-.13268
G1 X151.32 Y135.223 E-.13236
G1 X151.437 Y135.355 E-.06702
G1 X151.611 Y135.657 E-.13242
G1 X151.619 Y135.679 E-.00897
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.446 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.45 E.32169
G1 X160.398 Y143.45 E.20908
G1 X160.398 Y144.494 E.03356
G1 X133.76 Y144.494 E.85656
G1 X133.746 Y143.95 E.01748
G1 X135.805 Y143.95 E.0662
G1 X135.805 Y133.446 E.33778
G1 X153.836 Y133.446 E.57981
G1 X154.288 Y133.632 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.058 E.28077
G1 X160.79 Y143.058 E.19367
G1 X160.79 Y144.886 E.05444
G1 X95.21 Y144.886 E1.9534
G1 X95.21 Y133.054 E.35243
G1 X160.79 Y133.054 E1.9534
G1 X160.79 Y133.632 E.01721
G1 X154.348 Y133.632 E.19189
M204 S10000
G1 X154.092 Y133.343 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22866
G1 F12921.288
G1 X160.594 Y133.343 E.0954
; WIPE_START
G1 X158.594 Y133.343 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.733 Y135.017 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42555
G1 F6272.378
G1 X152.43 Y136.32 E.05568
G2 X152.403 Y135.806 I-2.066 J-.15 E.01561
G1 X153.563 Y134.646 E.04957
G1 X153.563 Y134.105 E.01636
G1 X152.284 Y135.383 E.05465
G2 X152.093 Y135.033 I-2.841 J1.321 E.01206
G1 X153.348 Y133.779 E.05361
G1 X152.807 Y133.779 E.01636
G1 X151.854 Y134.732 E.04072
G2 X151.56 Y134.484 I-1.812 J1.851 E.01162
G1 X152.265 Y133.779 E.03014
G1 X151.724 Y133.779 E.01636
G1 X151.216 Y134.288 E.02174
G2 X150.807 Y134.155 I-.886 J2.03 E.013
G1 X151.183 Y133.779 E.01606
G1 X150.642 Y133.779 E.01636
G1 X150.31 Y134.112 E.01421
G1 X149.847 Y134.172 E.01411
G1 X149.634 Y134.246 E.0068
G1 X150.101 Y133.779 E.01996
G1 X149.56 Y133.779 E.01636
G1 X140.099 Y143.24 E.40441
G1 X140.64 Y143.24 E.01636
G1 X148.45 Y135.43 E.33384
G2 X148.315 Y136.106 I2.022 J.755 E.02093
G1 X141.181 Y143.24 E.30494
G1 X141.722 Y143.24 E.01636
G1 X148.36 Y136.602 E.28376
G2 X148.493 Y137.011 I2.199 J-.484 E.01301
G1 X142.263 Y143.24 E.26627
G1 X142.804 Y143.24 E.01636
G1 X148.689 Y137.355 E.25155
G2 X148.937 Y137.649 I2.101 J-1.524 E.01162
G1 X143.345 Y143.24 E.23901
G1 X143.887 Y143.24 E.01636
G1 X149.239 Y137.888 E.22878
G2 X149.589 Y138.078 I.864 J-1.173 E.0121
M73 P65 R7
G1 X144.428 Y143.24 E.22064
G1 X144.969 Y143.24 E.01636
G1 X150.014 Y138.195 E.21565
G2 X150.526 Y138.224 I.336 J-1.398 E.01559
G1 X145.51 Y143.24 E.21442
G1 X146.051 Y143.24 E.01636
G1 X153.563 Y135.728 E.32109
G1 X153.563 Y136.269 E.01636
G1 X146.592 Y143.24 E.29796
G1 X147.133 Y143.24 E.01636
G1 X153.563 Y136.811 E.27483
G1 X153.563 Y137.352 E.01636
G1 X147.674 Y143.24 E.2517
G1 X148.216 Y143.24 E.01636
G1 X153.563 Y137.893 E.22857
G1 X153.563 Y138.434 E.01636
G1 X148.757 Y143.24 E.20544
G1 X149.298 Y143.24 E.01636
G1 X153.563 Y138.975 E.18231
G1 X153.563 Y139.516 E.01636
G1 X149.839 Y143.24 E.15918
G1 X150.38 Y143.24 E.01636
G1 X153.563 Y140.057 E.13605
G1 X153.563 Y140.598 E.01636
G1 X150.921 Y143.24 E.11292
G1 X151.462 Y143.24 E.01636
G1 X153.563 Y141.139 E.08979
G1 X153.563 Y141.681 E.01636
G1 X152.003 Y143.24 E.06666
G1 X152.544 Y143.24 E.01636
G1 X153.563 Y142.222 E.04353
G1 X153.563 Y142.763 E.01636
G1 X152.916 Y143.41 E.02765
G1 X153.693 Y143.972 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.6795
G1 F3770.147
G1 X160.194 Y143.972 E.32695
G1 X152.193 Y144.145 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.344 Y144.145 E.03702
G1 X153.344 Y143.668 E.01534
G1 X148.748 Y143.632 E.14782
G1 X148.234 Y144.145 E.02334
G1 X146.145 Y144.145 E.06717
G1 X145.632 Y143.632 E.02334
G1 X141.072 Y143.632 E.14665
G1 X140.558 Y144.145 E.02334
G1 X138.469 Y144.145 E.06717
G1 X137.956 Y143.632 E.02334
G1 X136.328 Y143.632 E.05236
G1 X136.009 Y144.222 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17931
G1 F15000
G1 X133.957 Y144.222 E.0221
G1 X133.567 Y144.597 F30000
; LINE_WIDTH: 0.22835
G1 F12942.89
G1 X126.433 Y144.597 E.1045
G1 X126.043 Y144.222 F30000
; LINE_WIDTH: 0.17931
G1 F15000
G1 X124.891 Y144.222 E.01241
G1 X124.125 Y143.41 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42068
G1 F6353.24
G1 X124.762 Y142.773 E.02687
G1 X124.762 Y142.239 E.01594
G1 X123.761 Y143.24 E.04225
G1 X123.226 Y143.24 E.01594
G1 X124.762 Y141.705 E.0648
G1 X124.762 Y141.17 E.01594
G1 X122.692 Y143.24 E.08734
G1 X122.158 Y143.24 E.01594
G1 X124.762 Y140.636 E.10989
G1 X124.762 Y140.102 E.01594
G1 X121.624 Y143.24 E.13243
G1 X121.09 Y143.24 E.01594
G1 X124.762 Y139.568 E.15498
G1 X124.762 Y139.034 E.01594
G1 X120.555 Y143.24 E.17752
G1 X120.021 Y143.24 E.01594
G1 X124.762 Y138.499 E.20007
G1 X124.762 Y137.965 E.01594
G1 X119.487 Y143.24 E.22261
G1 X118.953 Y143.24 E.01594
G1 X124.762 Y137.431 E.24516
G1 X124.762 Y136.897 E.01594
G1 X118.418 Y143.24 E.2677
G1 X117.884 Y143.24 E.01594
G1 X124.762 Y136.362 E.29025
G1 X124.762 Y135.828 E.01594
G1 X117.35 Y143.24 E.31279
G1 X116.816 Y143.24 E.01594
G1 X124.762 Y135.294 E.33534
G1 X124.762 Y134.76 E.01594
G1 X116.281 Y143.24 E.35788
G1 X115.747 Y143.24 E.01594
G1 X124.762 Y134.225 E.38043
G1 X124.762 Y133.779 E.01332
G1 X124.674 Y133.779 E.00262
G1 X115.213 Y143.24 E.39926
G1 X114.679 Y143.24 E.01594
G1 X124.14 Y133.779 E.39926
G1 X123.606 Y133.779 E.01594
G1 X114.144 Y143.24 E.39926
G1 X113.61 Y143.24 E.01594
G1 X123.071 Y133.779 E.39926
G1 X122.537 Y133.779 E.01594
G1 X113.076 Y143.24 E.39926
G1 X112.542 Y143.24 E.01594
G1 X122.003 Y133.779 E.39926
G1 X121.469 Y133.779 E.01594
G1 X112.008 Y143.24 E.39926
G1 X111.473 Y143.24 E.01594
G1 X120.934 Y133.779 E.39926
G1 X120.4 Y133.779 E.01594
G1 X110.939 Y143.24 E.39926
G1 X110.405 Y143.24 E.01594
G1 X119.866 Y133.779 E.39926
G1 X119.332 Y133.779 E.01594
G1 X109.871 Y143.24 E.39926
G1 X109.336 Y143.24 E.01594
G1 X118.797 Y133.779 E.39926
G1 X118.263 Y133.779 E.01594
G1 X108.802 Y143.24 E.39926
M73 P66 R7
G1 X108.268 Y143.24 E.01594
G1 X117.729 Y133.779 E.39926
G1 X117.195 Y133.779 E.01594
G1 X107.734 Y143.24 E.39926
G1 X107.199 Y143.24 E.01594
G1 X116.661 Y133.779 E.39926
G1 X116.126 Y133.779 E.01594
G1 X106.665 Y143.24 E.39926
G1 X106.131 Y143.24 E.01594
G1 X115.592 Y133.779 E.39926
G1 X115.058 Y133.779 E.01594
G1 X105.597 Y143.24 E.39926
G1 X105.063 Y143.24 E.01594
G1 X114.524 Y133.779 E.39926
G1 X113.989 Y133.779 E.01594
G1 X104.528 Y143.24 E.39926
G1 X103.994 Y143.24 E.01594
G1 X113.455 Y133.779 E.39926
G1 X112.921 Y133.779 E.01594
G1 X103.46 Y143.24 E.39926
G1 X102.926 Y143.24 E.01594
G1 X112.387 Y133.779 E.39926
G1 X111.852 Y133.779 E.01594
G1 X102.391 Y143.24 E.39926
G1 X101.857 Y143.24 E.01594
G1 X111.318 Y133.779 E.39926
G1 X110.784 Y133.779 E.01594
G1 X101.323 Y143.24 E.39926
G1 X100.789 Y143.24 E.01594
G1 X110.25 Y133.779 E.39926
G1 X109.715 Y133.779 E.01594
G1 X100.254 Y143.24 E.39926
G1 X99.72 Y143.24 E.01594
G1 X109.181 Y133.779 E.39926
G1 X108.647 Y133.779 E.01594
G1 X99.186 Y143.24 E.39926
G1 X98.652 Y143.24 E.01594
G1 X108.113 Y133.779 E.39926
G1 X107.579 Y133.779 E.01594
G1 X100.873 Y140.485 E.28298
G2 X100.934 Y139.889 I-2.162 J-.522 E.01791
G1 X107.044 Y133.779 E.25786
G1 X106.51 Y133.779 E.01594
G1 X100.865 Y139.424 E.23822
G2 X100.714 Y139.041 I-1.446 J.35 E.01233
G1 X105.976 Y133.779 E.22206
G1 X105.442 Y133.779 E.01594
G1 X100.511 Y138.71 E.20807
G2 X100.25 Y138.436 I-1.228 J.91 E.0113
G1 X104.907 Y133.779 E.19653
G1 X104.373 Y133.779 E.01594
G1 X99.945 Y138.207 E.18686
G2 X99.754 Y138.107 I-.459 J.642 E.00646
G1 X99.709 Y137.973 E.0042
G1 X99.742 Y137.876 E.00308
G1 X103.839 Y133.779 E.17287
G1 X103.305 Y133.779 E.01594
G1 X100.927 Y136.156 E.10032
G2 X100.91 Y135.639 I-2.246 J-.183 E.01547
G1 X102.77 Y133.779 E.07851
G1 X102.236 Y133.779 E.01594
G1 X100.796 Y135.219 E.06076
G2 X100.615 Y134.866 I-2.276 J.945 E.01185
G1 X101.702 Y133.779 E.04587
G1 X101.168 Y133.779 E.01594
G1 X100.383 Y134.564 E.03313
G2 X100.101 Y134.311 I-1.847 J1.775 E.0113
G1 X100.634 Y133.779 E.02247
G1 X100.099 Y133.779 E.01594
G1 X99.889 Y133.989 E.00886
G1 X99.558 Y134.149 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405915
G1 F6611.663
G1 X99.414 Y133.91 E.00799
; LINE_WIDTH: 0.445726
G1 F5958.204
G1 X99.403 Y133.892 E.00069
; LINE_WIDTH: 0.468535
G1 F5638.9
G1 X99.391 Y133.874 E.00072
G2 X99.139 Y133.851 I-.494 J3.911 E.0085
; LINE_WIDTH: 0.436964
G1 F6090.699
G2 X98.584 Y133.852 I-.258 J6.122 E.01729
; LINE_WIDTH: 0.468855
G1 F5634.662
G1 X98.359 Y133.874 E.0076
G1 X98.336 Y133.91 E.00145
; LINE_WIDTH: 0.405858
G1 F6612.712
G1 X98.192 Y134.149 E.00798
G1 X95.765 Y134.373 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42068
G1 F6353.24
G1 X96.36 Y133.779 E.02508
G1 X96.894 Y133.779 E.01594
G1 X95.935 Y134.738 E.04046
G1 X95.935 Y135.272 E.01594
G1 X97.428 Y133.779 E.06301
G1 X97.744 Y133.779 E.00944
G1 X97.678 Y133.881 E.00364
G1 X97.714 Y133.904 E.00127
G1 X97.561 Y134.158 E.00884
G1 X97.575 Y134.167 E.00048
G1 X95.935 Y135.806 E.0692
G1 X95.935 Y136.341 E.01594
G1 X96.901 Y135.374 E.04077
G2 X96.812 Y135.998 I1.473 J.53 E.01894
G1 X95.935 Y136.875 E.03699
G1 X95.935 Y137.409 E.01594
G1 X96.874 Y136.47 E.03963
G2 X97.018 Y136.861 I2.292 J-.619 E.01244
G1 X95.935 Y137.943 E.04568
G1 X95.935 Y138.477 E.01594
G1 X97.216 Y137.196 E.05407
G2 X97.47 Y137.477 I2.069 J-1.613 E.0113
G1 X95.935 Y139.012 E.06476
G1 X95.935 Y139.546 E.01594
G1 X97.771 Y137.71 E.07749
G2 X98.075 Y137.871 I.738 J-1.02 E.01031
G1 X98.041 Y137.975 E.00325
G1 X95.935 Y140.08 E.08885
G1 X95.935 Y140.614 E.01594
G1 X96.826 Y139.723 E.03762
G2 X96.831 Y140.253 I2.703 J.245 E.01585
G1 X95.935 Y141.149 E.03779
G1 X95.935 Y141.683 E.01594
G1 X96.94 Y140.678 E.04239
G2 X97.112 Y141.04 I2.217 J-.839 E.01197
G1 X95.765 Y142.387 E.05684
G1 X95.765 Y143.989 F30000
G1 F6353.24
G1 X95.956 Y143.799 E.00804
G1 X95.935 Y142.751 E.03127
G1 X97.341 Y141.345 E.05933
G2 X97.615 Y141.605 I1.18 J-.971 E.01131
G1 X96.549 Y142.672 E.04501
G1 X96.885 Y142.672 E.01005
G1 X96.984 Y142.771 E.00417
G1 X97.946 Y141.809 E.0406
G2 X98.329 Y141.96 I.774 J-1.395 E.01232
G1 X97.088 Y143.201 E.05235
G2 X97.1 Y143.24 I.025 J.014 E.00136
G1 X97.583 Y143.24 E.01443
G1 X98.794 Y142.029 E.05111
G2 X99.389 Y141.968 I.073 J-2.225 E.0179
G1 X97.948 Y143.41 E.06084
; WIPE_START
G1 X99.362 Y141.996 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.62 Y137.943 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.143978
G1 F15000
G1 X98.591 Y137.928 E.00026
; LINE_WIDTH: 0.116278
G1 X98.426 Y137.873 E.00101
G1 X98.62 Y137.943 F30000
; LINE_WIDTH: 0.187625
G1 F15000
G1 X98.651 Y137.97 E.00047
G1 X99.099 Y137.97 E.00511
G1 X99.115 Y137.956 F30000
; LINE_WIDTH: 0.181979
G1 F15000
G1 X99.099 Y137.97 E.00023
G1 X99.133 Y137.998 E.00049
; LINE_WIDTH: 0.142565
G1 X99.159 Y138.011 E.00023
; LINE_WIDTH: 0.116081
G1 X99.326 Y138.068 E.00102
G1 X99.324 Y137.872 F30000
; LINE_WIDTH: 0.116135
G1 F15000
G1 X99.159 Y137.928 E.00101
; LINE_WIDTH: 0.143428
G1 X99.131 Y137.942 E.00025
; LINE_WIDTH: 0.165946
G1 X99.115 Y137.956 E.00021
G1 X121.489 Y144.145 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X123.118 Y144.145 E.05236
G1 X122.604 Y143.632 E.02334
G1 X118.044 Y143.632 E.14665
G1 X117.531 Y144.145 E.02334
G1 X115.442 Y144.145 E.06717
G1 X114.928 Y143.632 E.02334
G1 X110.368 Y143.632 E.14665
G1 X109.855 Y144.145 E.02334
G1 X107.766 Y144.145 E.06717
G1 X107.252 Y143.632 E.02334
G1 X102.692 Y143.632 E.14665
G1 X102.179 Y144.145 E.02334
G1 X100.09 Y144.145 E.06717
G1 X99.576 Y143.632 E.02334
G1 X97.948 Y143.632 E.05236
G1 X125.291 Y133.343 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228123
G1 F12958.788
G1 X126.728 Y133.343 E.02102
G1 X133.272 Y133.343 F30000
; LINE_WIDTH: 0.22814
G1 F12957.565
G1 X135.609 Y133.343 E.03419
G1 X135.968 Y134.383 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42555
G1 F6272.378
G1 X136.573 Y133.779 E.02584
G1 X137.114 Y133.779 E.01636
G1 X136.138 Y134.755 E.04171
G1 X136.138 Y135.296 E.01636
G1 X137.655 Y133.779 E.06484
G1 X138.196 Y133.779 E.01636
G1 X136.138 Y135.837 E.08797
G1 X136.138 Y136.378 E.01636
G1 X138.737 Y133.779 E.1111
G1 X139.278 Y133.779 E.01636
G1 X136.138 Y136.919 E.13423
G1 X136.138 Y137.461 E.01636
G1 X139.82 Y133.779 E.15736
G1 X140.361 Y133.779 E.01636
G1 X136.138 Y138.002 E.18049
G1 X136.138 Y138.543 E.01636
G1 X140.902 Y133.779 E.20362
G1 X141.443 Y133.779 E.01636
G1 X136.138 Y139.084 E.22675
G1 X136.138 Y139.625 E.01636
G1 X141.984 Y133.779 E.24988
G1 X142.525 Y133.779 E.01636
G1 X136.138 Y140.166 E.27301
G1 X136.138 Y140.707 E.01636
G1 X143.066 Y133.779 E.29614
G1 X143.607 Y133.779 E.01636
G1 X136.138 Y141.248 E.31927
G1 X136.138 Y141.79 E.01636
G1 X144.149 Y133.779 E.3424
G1 X144.69 Y133.779 E.01636
G1 X136.138 Y142.331 E.36553
G1 X136.138 Y142.872 E.01636
G1 X145.231 Y133.779 E.38866
G1 X145.772 Y133.779 E.01636
G1 X136.311 Y143.24 E.40441
G1 X136.852 Y143.24 E.01636
G1 X146.313 Y133.779 E.40441
G1 X146.854 Y133.779 E.01636
G1 X137.393 Y143.24 E.40441
G1 X137.934 Y143.24 E.01636
G1 X147.395 Y133.779 E.40441
G1 X147.936 Y133.779 E.01636
G1 X138.475 Y143.24 E.40441
G1 X139.016 Y143.24 E.01636
G1 X148.478 Y133.779 E.40441
G1 X149.019 Y133.779 E.01636
G1 X139.388 Y143.41 E.41166
; WIPE_START
G1 X140.802 Y141.996 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.968 Y137.075 Z3.6 F30000
G1 X104.986 Y111.786 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.528 Y108.454 I.668 J-1.594 E.14919
G3 X106.287 Y108.579 I.11 J1.692 E.02495
G3 X105.178 Y111.846 I-.654 J1.6 E.16782
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.555 Y108.845 I.518 J-1.232 E.10693
G3 X105.971 Y108.886 I.068 J1.43 E.01251
G3 X105.17 Y111.433 I-.339 J1.293 E.12891
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08941
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13317
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.0729
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z3.6 F30000
G1 X156.053 Y111.336 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.028 Y108.254 I1.226 J-1.218 E.12741
G3 X157.787 Y108.379 I.11 J1.692 E.02495
G3 X156.104 Y111.367 I-.654 J1.6 E.18847
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.055 Y108.645 I.818 J-1.057 E.09654
G3 X157.471 Y108.686 I.068 J1.43 E.01251
G3 X156.363 Y111.072 I-.339 J1.293 E.1393
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15556
G1 X155.889 Y110.49 E-.13267
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.713 Y112.301 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.993 Y112.256 E.00911
G3 X157.573 Y112.307 I.132 J1.832 E.01881
G3 X156.656 Y112.318 I-.439 J1.672 E.31947
G1 X156.78 Y112.69 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.02 Y112.647 I.353 J1.289 E.00727
G3 X157.471 Y112.686 I.105 J1.414 E.01357
G3 X156.722 Y112.707 I-.339 J1.293 E.22752
; WIPE_START
M204 S10000
G1 X157.02 Y112.647 E-.11532
G1 X157.3 Y112.652 E-.10651
G1 X157.471 Y112.686 E-.0665
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.13268
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13268
G1 X158.367 Y113.484 E-.00684
; WIPE_END
G1 E-.04 F1800
G1 X150.776 Y114.274 Z3.6 F30000
G1 X115.395 Y117.959 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z3.6 F30000
G1 X160.79 Y118.893 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.25 E.01433
G1 X105.143 Y118.153 E.45038
G1 X104.801 Y118.153 E.01099
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.14 Y107.804 E.19055
G1 X102.128 Y107.804 E.06391
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07449
G1 X97.467 Y118.153 E.30022
G1 X97.125 Y118.153 E.01099
G1 X95.95 Y116.978 E.05343
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27531
G1 X112.819 Y118.153 E.01099
G1 X115.047 Y115.925 E.10131
G1 X115.047 Y113.047 E.09257
M73 P67 R7
G1 X109.804 Y107.804 E.23842
G1 X107.816 Y107.804 E.06391
G1 X106.998 Y108.622 E.03722
G2 X105.499 Y108.106 I-1.376 J1.561 E.0523
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.86 Y107.804 E.05236
G1 X155.941 Y107.919 E.00453
G1 X155.789 Y108.173 E.00953
G1 X155.949 Y108.268 E.00598
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409205
G1 F6552.284
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468868
G1 F5634.494
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.43604
G1 F6105.01
G3 X157.392 Y107.86 I.299 J5.926 E.01743
; LINE_WIDTH: 0.468376
G1 F5641.012
G3 X157.641 Y107.884 I-.24 J3.818 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447058
G1 F5938.567
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409226
G1 F6551.898
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.116603
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149258
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180098
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144775
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116569
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187352
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146161
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116578
G1 X156.666 Y111.88 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05075
G1 X153.953 Y113.574 E.05869
G1 X155.251 Y114.872 E.05903
G2 X156.232 Y115.852 I2.055 J-1.075 E.04528
G1 X158.533 Y118.153 E.10465
G1 X158.875 Y118.153 E.01099
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y111.994 E.16028
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.951 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/41
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S140.25
G17
G3 Z3.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.695
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.694 E.00079
G3 X98.787 Y134.241 I.006 J-1.728 E.17131
G3 X99.537 Y134.368 I.11 J1.636 E.0247
G3 X99.1 Y137.68 I-.656 J1.598 E.14585
G1 X98.959 Y137.691 E.00455
G1 X98.884 Y137.303 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.875 Y137.303 E.00027
G3 X98.812 Y134.632 I.009 J-1.336 E.12261
G3 X99.222 Y134.673 I.058 J1.483 E.01231
G3 X99.222 Y137.26 I-.337 J1.293 E.10474
G1 X98.944 Y137.295 E.00836
; WIPE_START
M204 S10000
G1 X98.875 Y137.303 E-.0262
G1 X98.701 Y137.292 E-.06631
G1 X98.528 Y137.258 E-.06685
G1 X98.206 Y137.125 E-.13258
G1 X97.93 Y136.912 E-.1324
G1 X97.813 Y136.78 E-.06699
G1 X97.639 Y136.478 E-.13264
G1 X97.548 Y136.141 E-.13254
G1 X97.548 Y136.132 E-.0035
; WIPE_END
G1 E-.04 F1800
G1 X97.486 Y140.997 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.383 Y140.828 E.00638
G3 X98.675 Y138.249 I1.499 J-.862 E.10972
G3 X99.102 Y138.251 I.207 J1.563 E.01377
G3 X97.527 Y141.041 I-.221 J1.715 E.21758
G1 X97.825 Y140.795 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.818 Y140.778 E.00056
G3 X98.724 Y138.639 I1.062 J-.811 E.08384
G3 X99.05 Y138.64 I.157 J1.196 E.00975
G3 X97.933 Y140.909 I-.17 J1.326 E.1514
G1 X97.866 Y140.839 E.00289
; WIPE_START
M204 S10000
G1 X97.818 Y140.778 E-.02965
G1 X97.639 Y140.479 E-.13243
G1 X97.548 Y140.142 E-.13254
G1 X97.537 Y139.966 E-.06686
G1 X97.548 Y139.791 E-.06665
G1 X97.639 Y139.454 E-.13257
G1 X97.813 Y139.152 E-.13261
G1 X97.929 Y139.021 E-.06668
G1 X97.929 Y139.021 E-.00002
; WIPE_END
G1 E-.04 F1800
G1 X105.406 Y137.485 Z3.8 F30000
G1 X125.095 Y133.442 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.947 E.33778
G1 X126.554 Y143.947 E.04691
G1 X126.539 Y144.49 E.01748
G1 X95.602 Y144.49 E.99483
G1 X95.602 Y133.442 E.35525
G1 X125.035 Y133.442 E.94645
; WIPE_START
G1 X125.046 Y135.442 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.564 Y134.126 Z3.8 F30000
G1 X135.413 Y133.628 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.555 E.29569
G1 X133.303 Y143.555 E.06286
G1 F2640.684
G1 X133.044 Y143.555 E.00771
M106 S229.5
G1 F720
G1 X133.063 Y144.267 E.02123
M106 S140.25
G1 F923.649
G1 X133.063 Y144.305 E.00112
G1 F4670.209
G1 X132.663 Y144.305 E.01191
G1 F6364.704
G1 X132.263 Y144.305 E.01191
G1 X126.936 Y144.305 E.15867
G1 X126.937 Y144.267 E.00112
G1 X126.956 Y143.555 E.02123
M106 S229.5
G1 F720
G1 X126.697 Y143.555 E.00771
M106 S140.25
G1 F4196.468
G1 X126.297 Y143.555 E.01191
G1 F6364.704
G1 X125.487 Y143.555 E.02414
G1 X125.487 Y133.628 E.29569
G1 X126.958 Y133.628 E.04381
G1 F3906.987
G1 X127.217 Y133.628 E.00771
M106 S229.5
G1 F1440
G1 X127.222 Y133.423 E.0061
M106 S140.25
G1 F1778.103
G1 X127.223 Y133.378 E.00133
G1 F6364.704
G1 X127.623 Y133.378 E.01191
G1 X132.777 Y133.378 E.15351
G1 X132.778 Y133.423 E.00133
G1 F3294.12
G1 X132.783 Y133.628 E.00611
M106 S229.5
G1 F1440
G1 X133.042 Y133.628 E.00771
M106 S140.25
G1 F5760
G1 X133.442 Y133.628 E.01191
G1 F6364.704
G1 X133.842 Y133.628 E.01191
G1 X135.353 Y133.628 E.045
; WIPE_START
M204 S10000
G1 X135.365 Y135.628 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.034 Z3.8 F30000
G1 X149.966 Y134.488 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.287 Y134.441 E.01043
G3 X151.037 Y134.568 I.109 J1.636 E.02469
G3 X149.909 Y134.504 I-.656 J1.598 E.31206
G1 X150.029 Y134.873 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X150.312 Y134.832 E.00851
G3 X150.722 Y134.873 I.057 J1.484 E.01231
G3 X149.977 Y134.894 I-.337 J1.293 E.22761
; WIPE_START
M204 S10000
G1 X150.312 Y134.832 E-.12956
G1 X150.549 Y134.84 E-.09017
G1 X150.722 Y134.873 E-.06686
G1 X151.044 Y135.007 E-.13269
G1 X151.32 Y135.22 E-.13235
G1 X151.437 Y135.352 E-.067
G1 X151.611 Y135.654 E-.13245
G1 X151.619 Y135.676 E-.00892
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.442 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.446 E.32169
G1 X160.398 Y143.446 E.20908
G1 X160.398 Y144.49 E.03356
G1 X133.461 Y144.49 E.86621
G1 X133.446 Y143.947 E.01748
G1 X135.805 Y143.947 E.07585
G1 X135.805 Y133.442 E.33778
G1 X153.836 Y133.442 E.57981
G1 X154.288 Y133.628 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.054 E.28077
G1 X160.79 Y143.054 E.19367
G1 X160.79 Y144.882 E.05444
G1 X95.21 Y144.882 E1.9534
G1 X95.21 Y133.05 E.35243
G1 X160.79 Y133.05 E1.9534
G1 X160.79 Y133.628 E.01721
G1 X154.348 Y133.628 E.19189
M204 S10000
G1 X154.092 Y133.339 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22872
G1 F12917.115
G1 X160.594 Y133.339 E.09543
; WIPE_START
G1 X158.594 Y133.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.732 Y134.371 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42124
G1 F6343.835
G1 X153.137 Y133.776 E.02516
G1 X152.602 Y133.776 E.01599
G1 X153.563 Y134.736 E.0406
G1 X153.563 Y135.271 E.01599
G1 X152.067 Y133.776 E.06321
G1 X151.532 Y133.776 E.01599
G1 X153.563 Y135.806 E.08582
G1 X153.563 Y136.341 E.01599
G1 X150.997 Y133.776 E.10843
G1 X150.462 Y133.776 E.01599
G1 X150.845 Y134.159 E.01618
G2 X150.26 Y134.108 I-.556 J3.039 E.01759
G1 X149.927 Y133.776 E.01405
G1 X149.392 Y133.776 E.01599
G1 X149.801 Y134.185 E.01729
G2 X149.421 Y134.339 I.442 J1.629 E.0123
G1 X148.857 Y133.776 E.02383
G1 X148.322 Y133.776 E.01599
G1 X149.095 Y134.549 E.03267
G2 X148.823 Y134.811 I.871 J1.177 E.01134
G1 X147.787 Y133.776 E.04377
G1 X147.252 Y133.776 E.01599
G1 X148.597 Y135.12 E.05683
G2 X148.429 Y135.488 I2.26 J1.251 E.01208
G1 X146.717 Y133.776 E.07236
G1 X146.182 Y133.776 E.01599
G1 X148.326 Y135.92 E.09062
G2 X148.333 Y136.462 I2.628 J.238 E.01622
G1 X145.647 Y133.776 E.11352
G1 X145.112 Y133.776 E.01599
G1 X153.563 Y142.227 E.35716
G1 X153.563 Y141.692 E.01599
G1 X150.069 Y138.198 E.14766
G2 X150.62 Y138.214 I.321 J-1.508 E.01657
G1 X153.563 Y141.157 E.12436
G1 X153.563 Y140.621 E.01599
G1 X151.053 Y138.111 E.10608
G2 X151.421 Y137.945 I-.951 J-2.598 E.0121
G1 X153.563 Y140.086 E.09051
G1 X153.563 Y139.551 E.01599
G1 X151.729 Y137.718 E.07748
G2 X151.993 Y137.447 I-.913 J-1.149 E.01134
G1 X153.563 Y139.016 E.06635
G1 X153.563 Y138.481 E.01599
G1 X152.201 Y137.12 E.05754
G2 X152.356 Y136.74 I-1.305 J-.751 E.01231
G1 X153.563 Y137.946 E.05101
G1 X153.563 Y137.411 E.01599
G1 X152.433 Y136.281 E.04777
G2 X152.382 Y135.696 I-2.102 J-.114 E.01762
G1 X153.732 Y137.046 E.05707
; WIPE_START
G1 X152.382 Y135.696 E-.7257
G1 X152.4 Y135.784 E-.0343
; WIPE_END
G1 E-.04 F1800
G1 X157.664 Y141.311 Z3.8 F30000
G1 X160.194 Y143.968 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67949
G1 F3770.206
G1 X153.693 Y143.968 E.32694
G1 X153.732 Y142.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42124
G1 F6343.835
G1 X144.577 Y133.776 E.38695
G1 X144.042 Y133.776 E.01599
G1 X153.561 Y143.295 E.40233
G1 X153.359 Y143.295 E.00604
G1 X153.359 Y143.628 E.00995
G1 X143.507 Y133.776 E.4164
G1 X142.972 Y133.776 E.01599
G1 X153.353 Y144.157 E.43875
G1 X152.818 Y144.157 E.01599
G1 X142.437 Y133.776 E.43875
G1 X141.902 Y133.776 E.01599
G1 X152.283 Y144.157 E.43875
G1 X151.748 Y144.157 E.01599
G1 X141.367 Y133.776 E.43875
G1 X140.832 Y133.776 E.01599
G1 X151.213 Y144.157 E.43875
G1 X150.678 Y144.157 E.01599
G1 X140.297 Y133.776 E.43875
G1 X139.762 Y133.776 E.01599
G1 X150.143 Y144.157 E.43875
G1 X149.608 Y144.157 E.01599
G1 X139.227 Y133.776 E.43875
G1 X138.692 Y133.776 E.01599
G1 X149.073 Y144.157 E.43875
G1 X148.538 Y144.157 E.01599
G1 X138.157 Y133.776 E.43875
G1 X137.621 Y133.776 E.01599
G1 X148.003 Y144.157 E.43875
G1 X147.468 Y144.157 E.01599
G1 X137.086 Y133.776 E.43875
G1 X136.551 Y133.776 E.01599
G1 X146.933 Y144.157 E.43875
G1 X146.398 Y144.157 E.01599
G1 X136.138 Y133.897 E.4336
G1 X136.138 Y134.432 E.01599
G1 X145.863 Y144.157 E.41099
G1 X145.328 Y144.157 E.01599
G1 X136.138 Y134.968 E.38838
G1 X136.138 Y135.503 E.01599
G1 X144.793 Y144.157 E.36576
G1 X144.258 Y144.157 E.01599
G1 X136.138 Y136.038 E.34315
G1 X136.138 Y136.573 E.01599
G1 X143.723 Y144.157 E.32054
G1 X143.188 Y144.157 E.01599
G1 X136.138 Y137.108 E.29793
G1 X136.138 Y137.643 E.01599
G1 X142.653 Y144.157 E.27532
G1 X142.118 Y144.157 E.01599
G1 X136.138 Y138.178 E.2527
G1 X136.138 Y138.713 E.01599
G1 X141.583 Y144.157 E.23009
G1 X141.047 Y144.157 E.01599
M73 P68 R7
G1 X136.138 Y139.248 E.20748
G1 X136.138 Y139.783 E.01599
G1 X140.512 Y144.157 E.18487
G1 X139.977 Y144.157 E.01599
G1 X136.138 Y140.318 E.16226
G1 X136.138 Y140.853 E.01599
G1 X139.442 Y144.157 E.13965
G1 X138.907 Y144.157 E.01599
G1 X136.138 Y141.388 E.11703
G1 X136.138 Y141.923 E.01599
G1 X138.372 Y144.157 E.09442
G1 X137.837 Y144.157 E.01599
G1 X136.138 Y142.458 E.07181
G1 X136.138 Y142.993 E.01599
G1 X137.302 Y144.157 E.0492
G1 X136.767 Y144.157 E.01599
G1 X135.969 Y143.358 E.03376
G1 X136.009 Y144.218 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17929
G1 F15000
G1 X133.657 Y144.218 E.02533
G1 X133.267 Y144.593 F30000
; LINE_WIDTH: 0.22833
G1 F12944.286
G1 X126.733 Y144.593 E.0957
G1 X126.343 Y144.218 F30000
; LINE_WIDTH: 0.17929
G1 F15000
G1 X124.891 Y144.218 E.01564
; WIPE_START
G1 X126.343 Y144.218 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.292 Y138.408 Z3.8 F30000
G1 X135.609 Y133.339 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.22816
G1 F12956.165
G1 X132.972 Y133.339 E.03859
G1 X127.028 Y133.339 F30000
; LINE_WIDTH: 0.228133
G1 F12958.081
G1 X125.291 Y133.339 E.02541
G1 X124.931 Y134.378 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42477
G1 F6285.19
G1 X124.329 Y133.776 E.02571
G1 X123.789 Y133.776 E.01629
G1 X124.762 Y134.749 E.04151
G1 X124.762 Y135.289 E.01629
G1 X123.249 Y133.776 E.06454
G1 X122.709 Y133.776 E.01629
G1 X124.762 Y135.829 E.08758
G1 X124.762 Y136.369 E.01629
G1 X122.169 Y133.776 E.11062
G1 X121.629 Y133.776 E.01629
G1 X124.762 Y136.909 E.13365
G1 X124.762 Y137.449 E.01629
G1 X121.089 Y133.776 E.15669
G1 X120.549 Y133.776 E.01629
G1 X124.762 Y137.989 E.17972
G1 X124.762 Y138.529 E.01629
G1 X120.009 Y133.776 E.20276
G1 X119.469 Y133.776 E.01629
G1 X124.762 Y139.069 E.22579
G1 X124.762 Y139.609 E.01629
G1 X118.929 Y133.776 E.24883
G1 X118.389 Y133.776 E.01629
G1 X124.762 Y140.149 E.27187
G1 X124.762 Y140.689 E.01629
G1 X117.849 Y133.776 E.2949
G1 X117.309 Y133.776 E.01629
G1 X124.762 Y141.229 E.31794
G1 X124.762 Y141.769 E.01629
G1 X116.768 Y133.776 E.34097
G1 X116.228 Y133.776 E.01629
G1 X124.762 Y142.309 E.36401
G1 X124.762 Y142.849 E.01629
G1 X115.688 Y133.776 E.38704
G1 X115.148 Y133.776 E.01629
G1 X124.762 Y143.389 E.41008
G1 X124.762 Y143.796 E.01226
G1 X124.628 Y143.796 E.00403
G1 X114.608 Y133.776 E.42742
G1 X114.068 Y133.776 E.01629
G1 X124.45 Y144.157 E.44284
G1 X123.91 Y144.157 E.01629
G1 X113.528 Y133.776 E.44284
G1 X112.988 Y133.776 E.01629
G1 X123.37 Y144.157 E.44284
G1 X122.83 Y144.157 E.01629
G1 X112.448 Y133.776 E.44284
G1 X111.908 Y133.776 E.01629
G1 X122.29 Y144.157 E.44284
G1 X121.75 Y144.157 E.01629
G1 X111.368 Y133.776 E.44284
G1 X110.828 Y133.776 E.01629
G1 X121.21 Y144.157 E.44284
G1 X120.67 Y144.157 E.01629
G1 X110.288 Y133.776 E.44284
G1 X109.748 Y133.776 E.01629
G1 X120.13 Y144.157 E.44284
G1 X119.59 Y144.157 E.01629
G1 X109.208 Y133.776 E.44284
G1 X108.668 Y133.776 E.01629
G1 X119.05 Y144.157 E.44284
G1 X118.51 Y144.157 E.01629
G1 X108.128 Y133.776 E.44284
G1 X107.588 Y133.776 E.01629
G1 X117.97 Y144.157 E.44284
G1 X117.429 Y144.157 E.01629
G1 X107.048 Y133.776 E.44284
G1 X106.508 Y133.776 E.01629
G1 X116.889 Y144.157 E.44284
G1 X116.349 Y144.157 E.01629
G1 X105.968 Y133.776 E.44284
G1 X105.428 Y133.776 E.01629
G1 X115.809 Y144.157 E.44284
G1 X115.269 Y144.157 E.01629
G1 X104.888 Y133.776 E.44284
G1 X104.348 Y133.776 E.01629
G1 X114.729 Y144.157 E.44284
G1 X114.189 Y144.157 E.01629
G1 X103.808 Y133.776 E.44284
G1 X103.268 Y133.776 E.01629
G1 X113.649 Y144.157 E.44284
G1 X113.109 Y144.157 E.01629
G1 X102.728 Y133.776 E.44284
G1 X102.188 Y133.776 E.01629
G1 X112.569 Y144.157 E.44284
G1 X112.029 Y144.157 E.01629
G1 X101.648 Y133.776 E.44284
G1 X101.108 Y133.776 E.01629
G1 X111.489 Y144.157 E.44284
G1 X110.949 Y144.157 E.01629
G1 X100.568 Y133.776 E.44284
G1 X100.028 Y133.776 E.01629
G1 X110.409 Y144.157 E.44284
G1 X109.869 Y144.157 E.01629
G1 X100.679 Y134.966 E.39205
G3 X100.926 Y135.754 I-1.63 J.945 E.0251
G1 X109.329 Y144.157 E.35846
G1 X108.789 Y144.157 E.01629
G1 X100.913 Y136.281 E.33597
G3 X100.799 Y136.707 I-1.723 J-.231 E.01334
G1 X108.249 Y144.157 E.31779
G1 X107.709 Y144.157 E.01629
G1 X100.618 Y137.066 E.3025
G3 X100.383 Y137.371 I-1.21 J-.688 E.01165
G1 X107.169 Y144.157 E.28948
G1 X106.629 Y144.157 E.01629
G1 X100.098 Y137.626 E.27859
G3 X99.759 Y137.827 I-.897 J-1.129 E.01193
G1 X106.089 Y144.157 E.27003
G1 X105.549 Y144.157 E.01629
G1 X100.88 Y139.488 E.19915
G3 X100.932 Y140.08 I-2.071 J.478 E.01797
G1 X105.009 Y144.157 E.17392
G1 X104.469 Y144.157 E.01629
G1 X100.855 Y140.543 E.15417
G3 X100.699 Y140.926 I-1.462 J-.372 E.01253
G1 X103.929 Y144.157 E.13781
G1 X103.389 Y144.157 E.01629
G1 X100.486 Y141.254 E.12383
G1 X100.22 Y141.528 E.01152
G1 X102.849 Y144.157 E.11214
G1 X102.309 Y144.157 E.01629
G1 X99.907 Y141.755 E.10248
G3 X99.531 Y141.919 I-.821 J-1.36 E.0124
G1 X101.769 Y144.157 E.09545
G1 X101.229 Y144.157 E.01629
G1 X99.089 Y142.017 E.09127
G3 X98.531 Y141.999 I-.206 J-2.228 E.0169
G1 X100.689 Y144.157 E.09206
G1 X100.149 Y144.157 E.01629
G1 X95.935 Y139.943 E.17975
G1 X95.935 Y139.403 E.01629
G1 X96.843 Y140.311 E.03871
G3 X96.824 Y139.752 I2.148 J-.351 E.0169
G1 X95.935 Y138.863 E.03792
G1 X95.935 Y138.323 E.01629
G1 X96.922 Y139.31 E.04209
G3 X97.087 Y138.935 I1.424 J.404 E.01239
G1 X95.935 Y137.783 E.04914
G1 X95.935 Y137.243 E.01629
G1 X97.316 Y138.624 E.05892
G3 X97.592 Y138.36 I.903 J.664 E.01158
G1 X95.935 Y136.703 E.07066
G1 X95.935 Y136.163 E.01629
G1 X97.915 Y138.143 E.08444
G1 X97.997 Y138.103 E.00275
G1 X98.075 Y137.868 E.00746
G3 X96.916 Y136.604 I.814 J-1.911 E.05335
G1 X95.935 Y135.623 E.04182
G1 X95.935 Y135.083 E.01629
G1 X96.81 Y135.958 E.03732
G3 X96.871 Y135.479 I1.871 J-.005 E.01461
G1 X95.935 Y134.543 E.03993
G1 X95.935 Y134.003 E.01629
G1 X97.014 Y135.082 E.04601
G3 X97.214 Y134.742 I1.503 J.659 E.01192
G1 X96.248 Y133.776 E.04123
G1 X96.788 Y133.776 E.01629
G1 X97.47 Y134.458 E.0291
G3 X97.728 Y134.255 I.926 J.91 E.00992
G1 X97.561 Y134.155 E.00587
G1 X97.616 Y134.064 E.00321
G1 X97.158 Y133.606 E.01952
G1 X98.192 Y134.146 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406007
G1 F6609.999
G1 X98.336 Y133.907 E.00799
; LINE_WIDTH: 0.46889
G1 F5634.207
G1 X98.359 Y133.871 E.00145
G1 X98.584 Y133.849 E.00761
; LINE_WIDTH: 0.436988
G1 F6090.318
G3 X99.139 Y133.847 I.297 J6.118 E.01728
; LINE_WIDTH: 0.468545
G1 F5638.769
G3 X99.391 Y133.871 I-.242 J3.932 E.0085
G1 X99.403 Y133.889 E.00073
; LINE_WIDTH: 0.445572
G1 F5960.484
G1 X99.414 Y133.907 E.00069
; LINE_WIDTH: 0.405704
G1 F6615.518
G1 X99.558 Y134.146 E.00798
; WIPE_START
G1 X99.414 Y133.907 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.426 Y137.869 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.11627
G1 F15000
G1 X98.592 Y137.925 E.00101
; LINE_WIDTH: 0.143895
G1 X98.62 Y137.939 E.00025
; LINE_WIDTH: 0.187605
G1 X98.652 Y137.966 E.00047
G1 X99.098 Y137.966 E.00511
G1 X99.324 Y137.869 F30000
; LINE_WIDTH: 0.116117
G1 F15000
G1 X99.159 Y137.925 E.00101
; LINE_WIDTH: 0.14332
G1 X99.131 Y137.939 E.00025
; LINE_WIDTH: 0.165791
G1 X99.115 Y137.952 E.00021
; LINE_WIDTH: 0.181917
G1 X99.098 Y137.966 E.00023
G1 X99.132 Y137.994 E.00049
; LINE_WIDTH: 0.142487
G1 X99.159 Y138.008 E.00023
; LINE_WIDTH: 0.116081
G1 X99.326 Y138.064 E.00102
; WIPE_START
G1 X99.159 Y138.008 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.779 Y144.327 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42477
G1 F6285.19
G1 X95.935 Y140.483 E.16395
G1 X95.935 Y141.023 E.01629
G1 X99.069 Y144.157 E.13368
G1 X98.529 Y144.157 E.01629
G1 X95.935 Y141.563 E.11064
G1 X95.935 Y142.103 E.01629
G1 X97.989 Y144.157 E.0876
G1 X97.449 Y144.157 E.01629
G1 X95.935 Y142.643 E.06457
G1 X95.935 Y143.183 E.01629
G1 X96.909 Y144.157 E.04153
G1 X96.369 Y144.157 E.01629
G1 X95.766 Y143.554 E.02573
; WIPE_START
G1 X96.369 Y144.157 E-.3242
G1 X96.909 Y144.157 E-.2052
G1 X96.48 Y143.728 E-.23059
; WIPE_END
G1 E-.04 F1800
G1 X98.444 Y136.352 Z3.8 F30000
G1 X104.986 Y111.786 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.523 Y108.454 I.668 J-1.594 E.149
G3 X106.287 Y108.579 I.116 J1.692 E.02514
G3 X105.178 Y111.846 I-.654 J1.6 E.16782
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.549 Y108.845 I.518 J-1.232 E.10676
G3 X105.971 Y108.886 I.074 J1.424 E.01268
G3 X105.17 Y111.433 I-.339 J1.293 E.12893
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08942
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13318
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07289
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z3.8 F30000
G1 X156.053 Y111.336 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.023 Y108.254 I1.226 J-1.218 E.12722
G3 X157.787 Y108.379 I.116 J1.691 E.02514
G3 X156.104 Y111.367 I-.654 J1.6 E.18848
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.049 Y108.645 I.818 J-1.057 E.09636
G3 X157.471 Y108.686 I.074 J1.425 E.01268
G3 X156.363 Y111.072 I-.339 J1.293 E.13932
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15556
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.06629
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.714 Y112.301 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.999 Y112.256 E.00927
G3 X157.787 Y112.379 I.139 J1.691 E.02591
G3 X156.656 Y112.317 I-.654 J1.6 E.3121
G1 X156.78 Y112.69 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.025 Y112.647 I.353 J1.289 E.00744
G3 X157.471 Y112.686 I.1 J1.415 E.0134
G3 X156.722 Y112.707 I-.339 J1.293 E.22751
; WIPE_START
M204 S10000
G1 X157.025 Y112.647 E-.11745
G1 X157.3 Y112.652 E-.10439
G1 X157.471 Y112.686 E-.06651
G1 X157.637 Y112.742 E-.06628
G1 X157.939 Y112.917 E-.13268
M73 P69 R7
G1 X158.187 Y113.164 E-.13318
G1 X158.361 Y113.467 E-.13268
G1 X158.367 Y113.484 E-.00684
; WIPE_END
G1 E-.04 F1800
G1 X150.776 Y114.274 Z3.8 F30000
G1 X115.395 Y117.959 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z3.8 F30000
G1 X160.79 Y118.893 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03445
G1 X155.789 Y108.173 E.00598
G1 X155.942 Y107.919 E.00953
G1 X155.86 Y107.804 E.00454
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409013
G1 F6555.726
G1 X156.586 Y107.919 E.00807
; LINE_WIDTH: 0.468851
G1 F5634.718
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436046
G1 F6104.925
G3 X157.392 Y107.86 I.299 J5.917 E.01743
; LINE_WIDTH: 0.468379
G1 F5640.974
G3 X157.641 Y107.884 I-.246 J3.89 E.00841
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446922
G1 F5940.567
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409004
G1 F6555.875
G1 X157.808 Y108.158 E.00807
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03895
G3 X158.975 Y110.919 I-3.17 J-.498 E.02551
G1 X160.05 Y111.994 E.04887
G1 X160.05 Y116.978 E.16028
G1 X158.875 Y118.153 E.05343
G1 X158.533 Y118.153 E.01099
G1 X156.232 Y115.852 E.10465
G3 X155.251 Y114.872 I1.075 J-2.055 E.04528
G1 X153.953 Y113.574 E.05903
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05075
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116601
G1 F15000
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146228
G1 X156.863 Y111.953 E.00028
; LINE_WIDTH: 0.187348
G1 X156.892 Y111.979 E.00045
G1 X157.357 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.149293
G1 F15000
G1 X157.417 Y111.937 E.00036
; LINE_WIDTH: 0.116601
G1 X157.584 Y111.88 E.00103
G1 X157.584 Y112.077 F30000
; LINE_WIDTH: 0.116592
G1 F15000
G1 X157.417 Y112.02 E.00103
; LINE_WIDTH: 0.144896
G1 X157.39 Y112.006 E.00025
; LINE_WIDTH: 0.180184
G1 X157.357 Y111.979 E.00046
G1 X157.38 Y111.958 E.00033
; WIPE_START
G1 X157.357 Y111.979 E-.31669
G1 X157.39 Y112.006 E-.44331
; WIPE_END
G1 E-.04 F1800
G1 X149.779 Y111.434 Z3.8 F30000
G1 X105.499 Y108.105 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.121 J2.081 E.05231
G1 X107.816 Y107.804 E.03722
G1 X109.804 Y107.804 E.06391
G1 X115.047 Y113.047 E.23842
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10131
G1 X112.477 Y118.153 E.01099
G1 X106.423 Y112.099 E.27531
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05343
G1 X97.467 Y118.153 E.01099
G1 X104.069 Y111.551 E.30022
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.07169
G1 X100.14 Y107.804 E.06391
G1 X95.95 Y111.994 E.19055
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01099
G1 X115.047 Y108.25 E.45038
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.25 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/41
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S142.8
G17
G3 Z3.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X98.9 Y137.692
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X98.875 Y137.69 E.00079
G3 X98.784 Y134.238 I.006 J-1.728 E.1712
G3 X99.537 Y134.364 I.113 J1.636 E.02481
G3 X99.1 Y137.676 I-.656 J1.598 E.14585
G1 X98.959 Y137.687 E.00455
G1 X98.886 Y137.299 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.875 Y137.299 E.00033
G3 X98.809 Y134.629 I.01 J-1.336 E.12251
G3 X99.222 Y134.67 I.061 J1.478 E.0124
G3 X99.222 Y137.256 I-.337 J1.293 E.10475
G1 X98.946 Y137.291 E.00829
; WIPE_START
M204 S10000
G1 X98.875 Y137.299 E-.02702
G1 X98.701 Y137.288 E-.06633
G1 X98.528 Y137.255 E-.06685
G1 X98.206 Y137.121 E-.1326
G1 X97.93 Y136.909 E-.13235
G1 X97.813 Y136.777 E-.06697
G1 X97.639 Y136.474 E-.13263
G1 X97.548 Y136.137 E-.13254
G1 X97.548 Y136.13 E-.00271
; WIPE_END
G1 E-.04 F1800
G1 X97.486 Y140.994 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X97.381 Y140.826 E.00639
G3 X98.665 Y138.246 I1.498 J-.864 E.10954
G3 X99.102 Y138.247 I.214 J1.598 E.01408
G3 X97.526 Y141.039 I-.223 J1.715 E.21749
G1 X97.827 Y140.793 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X97.817 Y140.775 E.00062
G3 X98.715 Y138.636 I1.061 J-.812 E.08367
G3 X99.05 Y138.637 I.164 J1.226 E.01
G3 X97.932 Y140.906 I-.171 J1.326 E.15127
G1 X97.868 Y140.837 E.00283
; WIPE_START
M204 S10000
G1 X97.817 Y140.775 E-.03046
G1 X97.639 Y140.475 E-.1325
G1 X97.548 Y140.138 E-.13254
G1 X97.537 Y139.963 E-.06685
G1 X97.548 Y139.788 E-.06661
G1 X97.639 Y139.451 E-.13259
G1 X97.813 Y139.148 E-.13264
G1 X97.928 Y139.019 E-.06582
; WIPE_END
G1 E-.04 F1800
G1 X105.404 Y137.483 Z4 F30000
G1 X125.095 Y133.439 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.943 E.33778
G1 X126.854 Y143.943 E.05655
G1 X126.839 Y144.487 E.01748
G1 X95.602 Y144.487 E1.00448
G1 X95.602 Y133.439 E.35525
G1 X125.035 Y133.439 E.94645
; WIPE_START
G1 X125.046 Y135.439 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.564 Y134.123 Z4 F30000
G1 X135.413 Y133.624 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.551 E.29569
G1 X133.003 Y143.551 E.07179
G1 F2640.684
G1 X132.744 Y143.551 E.00771
M106 S229.5
G1 F720
G1 X132.763 Y144.264 E.02123
M106 S142.8
G1 F923.649
G1 X132.764 Y144.301 E.00112
G1 F4670.209
G1 X132.364 Y144.301 E.01191
G1 F6364.704
G1 X131.964 Y144.301 E.01191
G1 X127.236 Y144.301 E.14081
G1 X127.237 Y144.264 E.00112
G1 X127.256 Y143.551 E.02123
M106 S229.5
G1 F720
G1 X126.997 Y143.551 E.00771
M106 S142.8
G1 F4196.468
G1 X126.597 Y143.551 E.01191
G1 F6364.704
G1 X126.197 Y143.551 E.01191
G1 X125.487 Y143.551 E.02116
G1 X125.487 Y133.624 E.29569
G1 X127.258 Y133.624 E.05275
G1 F3906.868
G1 X127.517 Y133.624 E.00771
M106 S229.5
G1 F1440
G1 X127.522 Y133.419 E.0061
M106 S142.8
G1 F1778.103
G1 X127.523 Y133.375 E.00133
G1 F6364.704
G1 X127.923 Y133.375 E.01191
G1 X132.477 Y133.375 E.13564
G1 X132.478 Y133.419 E.00133
G1 F3293.902
G1 X132.483 Y133.624 E.00611
M106 S229.5
G1 F1440
G1 X132.742 Y133.624 E.00771
M106 S142.8
G1 F5760
G1 X133.142 Y133.624 E.01191
G1 F6364.704
G1 X133.542 Y133.624 E.01191
G1 X135.353 Y133.624 E.05394
; WIPE_START
M204 S10000
G1 X135.365 Y135.624 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.974 Y135.03 Z4 F30000
G1 X149.966 Y134.484 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X150.284 Y134.438 E.01033
G3 X151.037 Y134.564 I.112 J1.637 E.02479
G3 X149.909 Y134.501 I-.656 J1.599 E.31206
G1 X150.029 Y134.87 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X150.309 Y134.829 E.00841
G3 X150.722 Y134.87 I.061 J1.478 E.0124
G3 X149.977 Y134.89 I-.337 J1.293 E.22761
; WIPE_START
M204 S10000
G1 X150.309 Y134.829 E-.12831
G1 X150.549 Y134.836 E-.09134
G1 X150.722 Y134.87 E-.06687
G1 X151.044 Y135.004 E-.13268
G1 X151.32 Y135.216 E-.13239
G1 X151.437 Y135.348 E-.06704
G1 X151.611 Y135.65 E-.13234
G1 X151.619 Y135.673 E-.00905
; WIPE_END
G1 E-.04 F1800
G1 X153.896 Y133.439 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y143.443 E.32169
G1 X160.398 Y143.443 E.20908
G1 X160.398 Y144.487 E.03356
G1 X133.161 Y144.487 E.87585
G1 X133.146 Y143.943 E.01748
G1 X135.805 Y143.943 E.08549
G1 X135.805 Y133.439 E.33778
G1 X153.836 Y133.439 E.57981
G1 X154.288 Y133.625 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.051 E.28077
G1 X160.79 Y143.051 E.19367
G1 X160.79 Y144.879 E.05444
G1 X95.21 Y144.879 E1.9534
G1 X95.21 Y133.047 E.35243
G1 X160.79 Y133.047 E1.9534
G1 X160.79 Y133.625 E.01721
G1 X154.348 Y133.625 E.19189
M204 S10000
G1 X154.092 Y133.336 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22878
G1 F12912.946
G1 X160.594 Y133.336 E.09546
; WIPE_START
G1 X158.594 Y133.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.883 Z4 F30000
G1 X160.194 Y143.965 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.67948
G1 F3770.265
G1 X153.693 Y143.965 E.32694
G1 X152.764 Y144.323 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42124
G1 F6343.835
G1 X153.359 Y143.728 E.02516
G1 X153.359 Y143.292 E.01303
G1 X153.563 Y143.292 E.00608
G1 X153.563 Y142.989 E.00904
G1 X152.399 Y144.153 E.04919
G1 X151.864 Y144.153 E.01599
G1 X153.563 Y142.454 E.07181
G1 X153.563 Y141.919 E.01599
G1 X151.329 Y144.153 E.09442
G1 X150.794 Y144.153 E.01599
G1 X153.563 Y141.384 E.11703
G1 X153.563 Y140.849 E.01599
G1 X150.259 Y144.153 E.13964
G1 X149.724 Y144.153 E.01599
G1 X153.563 Y140.314 E.16225
G1 X153.563 Y139.779 E.01599
G1 X149.189 Y144.153 E.18487
G1 X148.654 Y144.153 E.01599
G1 X153.563 Y139.244 E.20748
G1 X153.563 Y138.709 E.01599
G1 X148.119 Y144.153 E.23009
G1 X147.584 Y144.153 E.01599
G1 X153.563 Y138.174 E.2527
G1 X153.563 Y137.639 E.01599
G1 X147.049 Y144.153 E.27531
G1 X146.513 Y144.153 E.01599
G1 X153.563 Y137.104 E.29792
G1 X153.563 Y136.569 E.01599
G1 X145.978 Y144.153 E.32054
G1 X145.443 Y144.153 E.01599
G1 X153.563 Y136.034 E.34315
G1 X153.563 Y135.499 E.01599
G1 X152.37 Y136.692 E.0504
M73 P69 R6
G2 X152.435 Y136.091 I-2.258 J-.549 E.0181
G1 X153.563 Y134.964 E.04764
M73 P70 R6
G1 X153.563 Y134.429 E.01599
G1 X152.368 Y135.624 E.0505
G2 X152.217 Y135.24 I-1.454 J.349 E.01237
G1 X153.563 Y133.894 E.05688
G1 X153.563 Y133.772 E.00364
G1 X153.15 Y133.772 E.01235
G1 X152.015 Y134.907 E.04796
G2 X151.754 Y134.632 I-1.184 J.862 E.01133
G1 X152.615 Y133.772 E.03635
G1 X152.08 Y133.772 E.01599
G1 X151.449 Y134.402 E.02664
G2 X151.088 Y134.229 I-1.217 J2.075 E.012
G1 X151.545 Y133.772 E.01931
G1 X151.01 Y133.772 E.01599
G1 X150.662 Y134.119 E.01467
G1 X150.637 Y134.114 E.00078
G2 X150.122 Y134.125 I-.228 J1.462 E.01547
G1 X150.475 Y133.772 E.0149
G1 X149.939 Y133.772 E.01599
G1 X139.558 Y144.153 E.43875
G1 X140.093 Y144.153 E.01599
G1 X148.326 Y135.921 E.34794
G2 X148.331 Y136.45 I2.738 J.236 E.01585
G1 X140.628 Y144.153 E.32556
G1 X141.163 Y144.153 E.01599
G1 X148.441 Y136.876 E.30759
G2 X148.615 Y137.237 I2.204 J-.841 E.01199
G1 X141.698 Y144.153 E.29233
G1 X142.233 Y144.153 E.01599
G1 X148.845 Y137.542 E.27941
G2 X149.12 Y137.801 I2.274 J-2.141 E.01132
G1 X142.768 Y144.153 E.26846
G1 X143.303 Y144.153 E.01599
G1 X149.452 Y138.004 E.25988
G2 X149.844 Y138.148 I.623 J-1.098 E.01253
G1 X143.838 Y144.153 E.25383
G1 X144.373 Y144.153 E.01599
G1 X150.306 Y138.221 E.25073
G2 X150.904 Y138.158 I.073 J-2.183 E.01802
G1 X144.739 Y144.323 E.26055
; WIPE_START
G1 X146.153 Y142.909 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.216 Y139.726 Z4 F30000
G1 X125.291 Y133.336 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.228153
G1 F12956.679
G1 X127.328 Y133.336 E.02981
G1 X132.672 Y133.336 F30000
; LINE_WIDTH: 0.22818
G1 F12954.767
G1 X135.609 Y133.336 E.04298
G1 X136.734 Y133.602 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42124
G1 F6343.835
G1 X136.138 Y134.198 E.02516
G1 X136.138 Y134.733 E.01599
G1 X137.099 Y133.772 E.0406
G1 X137.634 Y133.772 E.01599
G1 X136.138 Y135.268 E.06321
G1 X136.138 Y135.803 E.01599
G1 X138.169 Y133.772 E.08582
G1 X138.704 Y133.772 E.01599
G1 X136.138 Y136.338 E.10844
G1 X136.138 Y136.873 E.01599
G1 X139.239 Y133.772 E.13105
G1 X139.774 Y133.772 E.01599
G1 X136.138 Y137.408 E.15366
G1 X136.138 Y137.943 E.01599
G1 X140.309 Y133.772 E.17627
G1 X140.844 Y133.772 E.01599
G1 X136.138 Y138.478 E.19888
G1 X136.138 Y139.013 E.01599
G1 X141.379 Y133.772 E.2215
G1 X141.914 Y133.772 E.01599
G1 X136.138 Y139.548 E.24411
G1 X136.138 Y140.083 E.01599
G1 X142.449 Y133.772 E.26672
G1 X142.984 Y133.772 E.01599
G1 X136.138 Y140.618 E.28933
G1 X136.138 Y141.153 E.01599
G1 X143.519 Y133.772 E.31194
G1 X144.054 Y133.772 E.01599
G1 X136.138 Y141.688 E.33455
G1 X136.138 Y142.223 E.01599
G1 X144.589 Y133.772 E.35717
G1 X145.124 Y133.772 E.01599
G1 X136.138 Y142.758 E.37978
G1 X136.138 Y143.293 E.01599
G1 X145.659 Y133.772 E.40239
G1 X146.194 Y133.772 E.01599
G1 X136.174 Y143.792 E.42347
G1 X136.342 Y143.792 E.005
G1 X136.342 Y144.153 E.0108
G1 X146.729 Y133.772 E.43888
G1 X147.264 Y133.772 E.01599
G1 X136.883 Y144.153 E.43875
G1 X137.418 Y144.153 E.01599
G1 X147.799 Y133.772 E.43875
G1 X148.334 Y133.772 E.01599
G1 X137.953 Y144.153 E.43875
G1 X138.488 Y144.153 E.01599
G1 X148.869 Y133.772 E.43875
G1 X149.404 Y133.772 E.01599
G1 X138.853 Y144.323 E.44592
G1 X136.009 Y144.215 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17926
G1 F15000
G1 X133.357 Y144.215 E.02856
G1 X132.967 Y144.59 F30000
; LINE_WIDTH: 0.22831
G1 F12945.682
G1 X127.033 Y144.59 E.0869
G1 X126.643 Y144.215 F30000
; LINE_WIDTH: 0.17927
G1 F15000
G1 X124.891 Y144.215 E.01886
G1 X123.96 Y144.323 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42283
G1 F6317.285
G1 X124.762 Y143.521 E.03404
G1 X124.762 Y142.984 E.01612
G1 X123.592 Y144.153 E.04964
G1 X123.055 Y144.153 E.01612
G1 X124.762 Y142.447 E.07244
G1 X124.762 Y141.909 E.01612
G1 X122.518 Y144.153 E.09524
G1 X121.98 Y144.153 E.01612
G1 X124.762 Y141.372 E.11805
G1 X124.762 Y140.835 E.01612
G1 X121.443 Y144.153 E.14085
G1 X120.906 Y144.153 E.01612
G1 X124.762 Y140.297 E.16365
G1 X124.762 Y139.76 E.01612
G1 X120.368 Y144.153 E.18645
G1 X119.831 Y144.153 E.01612
G1 X124.762 Y139.223 E.20926
G1 X124.762 Y138.686 E.01612
G1 X119.294 Y144.153 E.23206
G1 X118.757 Y144.153 E.01612
G1 X124.762 Y138.148 E.25486
G1 X124.762 Y137.611 E.01612
G1 X118.219 Y144.153 E.27766
G1 X117.682 Y144.153 E.01612
G1 X124.762 Y137.074 E.30047
G1 X124.762 Y136.537 E.01612
G1 X117.145 Y144.153 E.32327
G1 X116.608 Y144.153 E.01612
G1 X124.762 Y135.999 E.34607
G1 X124.762 Y135.462 E.01612
G1 X116.07 Y144.153 E.36887
G1 X115.533 Y144.153 E.01612
G1 X124.762 Y134.925 E.39167
G1 X124.762 Y134.387 E.01612
G1 X114.996 Y144.153 E.41448
G1 X114.458 Y144.153 E.01612
G1 X124.762 Y133.85 E.43728
G1 X124.762 Y133.772 E.00234
G1 X124.303 Y133.772 E.01378
G1 X113.921 Y144.153 E.44059
G1 X113.384 Y144.153 E.01612
G1 X123.765 Y133.772 E.44059
G1 X123.228 Y133.772 E.01612
G1 X112.847 Y144.153 E.44059
G1 X112.309 Y144.153 E.01612
G1 X122.691 Y133.772 E.44059
G1 X122.153 Y133.772 E.01612
G1 X111.772 Y144.153 E.44059
G1 X111.235 Y144.153 E.01612
G1 X121.616 Y133.772 E.44059
G1 X121.079 Y133.772 E.01612
G1 X110.698 Y144.153 E.44059
G1 X110.16 Y144.153 E.01612
G1 X120.542 Y133.772 E.44059
G1 X120.004 Y133.772 E.01612
G1 X109.623 Y144.153 E.44059
G1 X109.086 Y144.153 E.01612
G1 X119.467 Y133.772 E.44059
G1 X118.93 Y133.772 E.01612
G1 X108.548 Y144.153 E.44059
G1 X108.011 Y144.153 E.01612
G1 X118.393 Y133.772 E.44059
G1 X117.855 Y133.772 E.01612
G1 X107.474 Y144.153 E.44059
G1 X106.937 Y144.153 E.01612
G1 X117.318 Y133.772 E.44059
G1 X116.781 Y133.772 E.01612
G1 X106.399 Y144.153 E.44059
G1 X105.862 Y144.153 E.01612
G1 X116.243 Y133.772 E.44059
G1 X115.706 Y133.772 E.01612
G1 X105.325 Y144.153 E.44059
G1 X104.788 Y144.153 E.01612
G1 X115.169 Y133.772 E.44059
G1 X114.632 Y133.772 E.01612
G1 X104.25 Y144.153 E.44059
G1 X103.713 Y144.153 E.01612
G1 X114.094 Y133.772 E.44059
G1 X113.557 Y133.772 E.01612
G1 X103.176 Y144.153 E.44059
G1 X102.638 Y144.153 E.01612
G1 X113.02 Y133.772 E.44059
G1 X112.483 Y133.772 E.01612
G1 X102.101 Y144.153 E.44059
G1 X101.564 Y144.153 E.01612
G1 X111.945 Y133.772 E.44059
G1 X111.408 Y133.772 E.01612
G1 X101.027 Y144.153 E.44059
G1 X100.489 Y144.153 E.01612
G1 X110.871 Y133.772 E.44059
G1 X110.333 Y133.772 E.01612
G1 X99.952 Y144.153 E.44059
G1 X99.415 Y144.153 E.01612
G1 X109.796 Y133.772 E.44059
G1 X109.259 Y133.772 E.01612
G1 X98.878 Y144.153 E.44059
G1 X98.34 Y144.153 E.01612
G1 X108.722 Y133.772 E.44059
G1 X108.184 Y133.772 E.01612
G1 X97.803 Y144.153 E.44059
G1 X97.266 Y144.153 E.01612
G1 X99.489 Y141.93 E.09435
G3 X98.856 Y142.026 I-.545 J-1.47 E.01934
G1 X96.728 Y144.153 E.0903
G1 X96.191 Y144.153 E.01612
G1 X98.38 Y141.965 E.09288
G3 X97.986 Y141.821 I.609 J-2.281 E.01259
G1 X95.935 Y143.872 E.08703
G1 X95.935 Y143.335 E.01612
G1 X97.649 Y141.621 E.07272
G3 X97.366 Y141.367 I1.586 J-2.044 E.01143
G1 X95.935 Y142.798 E.06073
G1 X95.935 Y142.26 E.01612
G1 X97.132 Y141.063 E.05081
G3 X96.951 Y140.707 I2.053 J-1.267 E.01201
G1 X95.935 Y141.723 E.04313
G1 X95.935 Y141.186 E.01612
G1 X96.838 Y140.283 E.03831
G3 X96.823 Y139.76 I2.241 J-.323 E.01573
G1 X95.935 Y140.648 E.03769
G1 X95.935 Y140.111 E.01612
G1 X98.022 Y138.025 E.08854
G1 X98.075 Y137.865 E.00508
G3 X97.792 Y137.717 I.394 J-1.1 E.00961
G1 X95.935 Y139.574 E.07881
G1 X95.935 Y139.037 E.01612
G1 X97.487 Y137.485 E.06585
G3 X97.228 Y137.207 I1.989 J-2.11 E.01142
G1 X95.935 Y138.499 E.05486
G1 X95.935 Y137.962 E.01612
G1 X97.026 Y136.871 E.0463
G3 X96.878 Y136.482 I2.358 J-1.121 E.01251
G1 X95.935 Y137.425 E.04001
G1 X95.935 Y136.888 E.01612
G1 X96.813 Y136.01 E.03725
G3 X96.893 Y135.393 I1.493 J-.121 E.01881
G1 X95.935 Y136.35 E.04063
G1 X95.935 Y135.813 E.01612
G1 X97.584 Y134.165 E.06996
G1 X97.561 Y134.151 E.00079
G1 X97.714 Y133.897 E.00889
G1 X97.678 Y133.874 E.00127
G1 X97.744 Y133.772 E.00365
G1 X97.439 Y133.772 E.00917
G1 X95.935 Y135.276 E.06381
G1 X95.935 Y134.738 E.01612
G1 X96.902 Y133.772 E.04101
G1 X96.364 Y133.772 E.01612
G1 X95.766 Y134.371 E.02541
G1 X98.192 Y134.142 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.405841
G1 F6613.008
G1 X98.336 Y133.903 E.00798
; LINE_WIDTH: 0.468888
G1 F5634.233
G1 X98.359 Y133.867 E.00145
G1 X98.584 Y133.845 E.0076
; LINE_WIDTH: 0.437013
G1 F6089.933
G3 X99.139 Y133.844 I.297 J6.12 E.01728
; LINE_WIDTH: 0.468559
G1 F5638.583
G3 X99.391 Y133.867 I-.244 J3.959 E.0085
G1 X99.402 Y133.885 E.00073
; LINE_WIDTH: 0.445522
G1 F5961.231
G1 X99.414 Y133.903 E.00069
; LINE_WIDTH: 0.405609
G1 F6617.255
G1 X99.558 Y134.142 E.00797
G1 X100.295 Y133.602 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42283
G1 F6317.285
G1 X100.053 Y133.845 E.01028
G1 X100.062 Y133.881 E.00111
G1 X100.036 Y133.897 E.00093
G1 X100.189 Y134.151 E.00889
M73 P71 R6
G1 X100.022 Y134.251 E.00583
G1 X100.119 Y134.316 E.00348
G1 X100.662 Y133.772 E.02309
G1 X101.2 Y133.772 E.01612
G1 X100.398 Y134.574 E.03404
G3 X100.629 Y134.88 I-.972 J.976 E.01155
G1 X101.737 Y133.772 E.04702
G1 X102.274 Y133.772 E.01612
G1 X100.806 Y135.24 E.06232
G3 X100.917 Y135.667 I-1.603 J.645 E.01325
G1 X102.812 Y133.772 E.08041
G1 X103.349 Y133.772 E.01612
G1 X100.714 Y136.407 E.11182
G1 X98.426 Y137.866 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.11628
G1 F15000
G1 X98.591 Y137.921 E.00101
; LINE_WIDTH: 0.144017
G1 X98.62 Y137.936 E.00026
; LINE_WIDTH: 0.187628
G1 X98.651 Y137.963 E.00047
G1 X99.099 Y137.963 E.00511
G1 X99.324 Y137.865 F30000
; LINE_WIDTH: 0.116176
G1 F15000
G1 X99.159 Y137.921 E.00101
; LINE_WIDTH: 0.143527
G1 X99.131 Y137.935 E.00025
; LINE_WIDTH: 0.166034
G1 X99.115 Y137.949 E.00021
; LINE_WIDTH: 0.181944
G1 X99.099 Y137.963 E.00023
G1 X99.133 Y137.991 E.00049
; LINE_WIDTH: 0.142465
G1 X99.159 Y138.004 E.00023
; LINE_WIDTH: 0.116045
G1 X99.326 Y138.06 E.00102
G1 X99.495 Y138.163 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42283
G1 F6317.285
G1 X103.886 Y133.772 E.18634
G1 X104.423 Y133.772 E.01612
G1 X99.975 Y138.22 E.18878
G3 X100.279 Y138.454 I-.748 J1.283 E.01153
G1 X104.961 Y133.772 E.19871
G1 X105.498 Y133.772 E.01612
G1 X100.534 Y138.736 E.21068
G3 X100.734 Y139.074 I-1.315 J1.006 E.0118
G1 X106.035 Y133.772 E.225
G1 X106.572 Y133.772 E.01612
G1 X100.877 Y139.468 E.24172
G3 X100.938 Y139.944 I-1.7 J.459 E.01446
G1 X107.11 Y133.772 E.26194
G1 X107.647 Y133.772 E.01612
G1 X100.522 Y140.898 E.30241
; WIPE_START
G1 X101.936 Y139.483 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.771 Y131.897 Z4 F30000
G1 X104.986 Y111.786 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.517 Y108.454 I.668 J-1.594 E.14882
G3 X106.287 Y108.579 I.121 J1.691 E.02532
G3 X105.178 Y111.846 I-.654 J1.6 E.16783
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.544 Y108.846 I.518 J-1.232 E.10658
G3 X105.971 Y108.886 I.081 J1.42 E.01285
G3 X105.171 Y111.433 I-.339 J1.293 E.12892
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08943
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13316
G1 X104.389 Y110.69 E-.13269
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z4 F30000
G1 X156.053 Y111.336 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.017 Y108.254 I1.226 J-1.218 E.12704
G3 X157.787 Y108.379 I.121 J1.692 E.02532
G3 X156.104 Y111.367 I-.654 J1.6 E.18848
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.044 Y108.646 I.818 J-1.057 E.09619
G3 X157.471 Y108.686 I.081 J1.42 E.01285
G3 X156.363 Y111.072 I-.339 J1.293 E.13931
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15555
G1 X155.889 Y110.49 E-.13267
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.714 Y112.301 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.004 Y112.255 E.00943
G3 X157.787 Y112.379 I.134 J1.692 E.02573
G3 X156.657 Y112.317 I-.654 J1.6 E.31211
G1 X156.775 Y112.688 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.78 Y112.69 E.00016
G3 X157.031 Y112.646 I.353 J1.289 E.00761
G3 X157.471 Y112.686 I.094 J1.415 E.01323
G3 X156.615 Y112.747 I-.339 J1.293 E.22411
G1 X156.718 Y112.708 E.00328
; WIPE_START
M204 S10000
G1 X156.78 Y112.69 E-.02428
G1 X157.031 Y112.646 E-.09687
G1 X157.3 Y112.652 E-.10226
G1 X157.471 Y112.686 E-.0665
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.1327
G1 X158.187 Y113.164 E-.13313
G1 X158.361 Y113.467 E-.13269
G1 X158.366 Y113.48 E-.00527
; WIPE_END
G1 E-.04 F1800
G1 X150.774 Y114.271 Z4 F30000
G1 X115.395 Y117.959 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z4 F30000
G1 X160.79 Y118.893 Z4
G1 Z3.6
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.25 E.01433
G1 X105.143 Y118.153 E.45038
G1 X104.801 Y118.153 E.01099
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.14 Y107.804 E.19055
G1 X102.128 Y107.804 E.06391
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07449
G1 X97.467 Y118.153 E.30022
G1 X97.125 Y118.153 E.01099
G1 X95.95 Y116.978 E.05343
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27531
G1 X112.819 Y118.153 E.01099
G1 X115.047 Y115.925 E.10131
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23842
G1 X107.816 Y107.804 E.06391
G1 X106.998 Y108.622 E.03722
G2 X105.499 Y108.106 I-1.443 J1.753 E.05209
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.86 Y107.804 E.05236
G1 X155.942 Y107.918 E.00453
G1 X155.789 Y108.173 E.00954
G1 X155.948 Y108.268 E.00598
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
G1 X156.442 Y108.159 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40928
G1 F6550.937
G1 X156.586 Y107.919 E.00809
; LINE_WIDTH: 0.468884
G1 F5634.284
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436046
G1 F6104.914
G3 X157.392 Y107.86 I.299 J5.924 E.01743
; LINE_WIDTH: 0.468389
G1 F5640.84
G3 X157.641 Y107.884 I-.245 J3.878 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.4471
G1 F5937.954
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409263
G1 F6551.242
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.116624
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149352
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180169
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144836
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116575
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187334
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146056
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116548
G1 X156.666 Y111.88 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05075
G1 X153.953 Y113.574 E.05869
G1 X155.251 Y114.872 E.05903
G2 X156.232 Y115.852 I2.056 J-1.075 E.04528
G1 X158.533 Y118.153 E.10464
G1 X158.875 Y118.153 E.01099
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y111.994 E.16028
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.953 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/41
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S127.5
G17
G3 Z4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X135.413 Y133.621
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X135.413 Y143.548 E.29569
G1 X132.703 Y143.548 E.08073
G1 F2640.684
G1 X132.444 Y143.548 E.00771
M106 S229.5
G1 F720
G1 X132.463 Y144.26 E.02123
M106 S127.5
G1 F923.649
G1 X132.464 Y144.298 E.00112
G1 F4670.209
G1 X132.064 Y144.298 E.01191
G1 F6364.704
G1 X131.664 Y144.298 E.01191
G1 X127.536 Y144.298 E.12294
G1 X127.537 Y144.26 E.00112
G1 X127.556 Y143.548 E.02123
M106 S229.5
G1 F720
G1 X127.297 Y143.548 E.00771
M106 S127.5
G1 F4196.468
G1 X126.897 Y143.548 E.01191
G1 F6364.704
G1 X126.497 Y143.548 E.01191
G1 X125.487 Y143.548 E.03009
G1 X125.487 Y133.621 E.29569
G1 X127.558 Y133.621 E.06168
G1 F3906.987
G1 X127.817 Y133.621 E.00771
M106 S229.5
G1 F1440
G1 X127.822 Y133.416 E.0061
M106 S127.5
G1 F1778.103
G1 X127.823 Y133.371 E.00133
G1 F6364.704
G1 X128.223 Y133.371 E.01191
G1 X132.177 Y133.371 E.11777
G1 X132.178 Y133.416 E.00133
G1 F3293.684
G1 X132.183 Y133.621 E.0061
M106 S229.5
G1 F1440
G1 X132.442 Y133.621 E.00771
M106 S127.5
G1 F5760
G1 X132.842 Y133.621 E.01191
G1 F6364.704
G1 X133.242 Y133.621 E.01191
G1 X135.353 Y133.621 E.06287
; WIPE_START
M204 S10000
G1 X135.365 Y135.621 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.987 Y135.229 Z4.2 F30000
G1 X150.027 Y134.867 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X150.03 Y134.871 E.00015
G3 X150.306 Y134.826 I.355 J1.288 E.00835
G3 X150.722 Y134.866 I.065 J1.475 E.0125
G3 X149.865 Y134.928 I-.337 J1.293 E.22407
G1 X149.971 Y134.888 E.00336
; WIPE_START
M204 S10000
G1 X150.03 Y134.871 E-.02321
G1 X150.306 Y134.826 E-.10629
G1 X150.549 Y134.833 E-.09257
G1 X150.722 Y134.866 E-.06683
G1 X151.044 Y135 E-.13268
G1 X151.321 Y135.213 E-.13245
G1 X151.437 Y135.345 E-.06695
G1 X151.611 Y135.647 E-.13239
G1 X151.617 Y135.663 E-.00663
; WIPE_END
G1 E-.04 F1800
G1 X146.477 Y141.305 Z4.2 F30000
G1 X145.264 Y142.636 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.896 Y142.636 E.27756
G1 X153.896 Y143.439 E.02582
G1 X160.398 Y143.439 E.20908
G1 X160.398 Y144.483 E.03356
G1 X132.861 Y144.483 E.8855
G1 X132.846 Y143.94 E.01748
G1 X135.805 Y143.94 E.09514
G1 X135.805 Y142.636 E.04191
G1 X145.204 Y142.636 E.30225
; WIPE_START
G1 X147.204 Y142.636 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.618 Y141.798 Z4.2 F30000
G1 X98.888 Y137.295 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X98.875 Y137.296 E.00039
G3 X98.806 Y134.625 I.01 J-1.336 E.12243
G3 X99.222 Y134.666 I.065 J1.476 E.01248
G3 X99.222 Y137.253 I-.337 J1.293 E.10474
G1 X98.948 Y137.287 E.00824
; WIPE_START
M204 S10000
G1 X98.875 Y137.296 E-.02775
G1 X98.701 Y137.285 E-.06632
G1 X98.528 Y137.251 E-.06689
G1 X98.206 Y137.118 E-.13254
G1 X97.93 Y136.905 E-.13235
G1 X97.813 Y136.773 E-.06702
G1 X97.639 Y136.471 E-.13263
G1 X97.548 Y136.134 E-.13257
G1 X97.548 Y136.129 E-.00194
; WIPE_END
G1 E-.04 F1800
G1 X97.646 Y140.468 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G3 X98.707 Y138.633 I1.235 J-.511 E.07292
G1 X98.875 Y138.621 E.00502
G3 X97.671 Y140.523 I.006 J1.336 E.17037
; WIPE_START
M204 S10000
G1 X97.548 Y140.135 E-.15477
G1 X97.537 Y139.959 E-.06685
G1 X97.583 Y139.613 E-.1326
G1 X97.639 Y139.447 E-.06661
G1 X97.813 Y139.145 E-.13254
G1 X98.007 Y138.945 E-.10567
G1 X98.206 Y138.801 E-.09359
G1 X98.224 Y138.793 E-.00737
; WIPE_END
G1 E-.04 F1800
G1 X105.779 Y139.874 Z4.2 F30000
G1 X125.095 Y142.636 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X125.095 Y143.94 E.04191
G1 X127.154 Y143.94 E.0662
G1 X127.139 Y144.483 E.01748
G1 X95.602 Y144.483 E1.01412
G1 X95.602 Y133.435 E.35525
G1 X95.92 Y133.435 E.01023
G1 X95.92 Y142.636 E.29587
G1 X125.035 Y142.636 E.93622
; WIPE_START
G1 X125.095 Y143.94 E-.49577
G1 X125.79 Y143.94 E-.26423
; WIPE_END
G1 E-.04 F1800
G1 X132.967 Y141.341 Z4.2 F30000
G1 X154.288 Y133.621 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X154.288 Y143.047 E.28077
G1 X160.79 Y143.047 E.19367
G1 X160.79 Y144.875 E.05444
G1 X95.21 Y144.875 E1.9534
G1 X95.21 Y133.043 E.35243
G1 X160.79 Y133.043 E1.9534
G1 X160.79 Y133.621 E.01722
G1 X154.348 Y133.621 E.19189
M204 S10000
G1 X154.081 Y133.683 F30000
; FEATURE: Top surface
G1 F6364.704
M204 S2000
G1 X153.648 Y133.251 E.01822
G1 X153.115 Y133.251
G1 X154.081 Y134.217 E.04068
G1 X154.081 Y134.75
G1 X152.582 Y133.251 E.06315
G1 X152.048 Y133.251
G1 X154.081 Y135.283 E.08561
G1 X154.081 Y135.816
G1 X151.515 Y133.251 E.10807
G1 X150.982 Y133.251
G1 X154.081 Y136.35 E.13054
G1 X154.081 Y136.883
G1 X150.449 Y133.251 E.153
G1 X149.915 Y133.251
G1 X154.081 Y137.416 E.17546
G1 X154.081 Y137.949
G1 X151.857 Y135.726 E.09368
G1 X151.911 Y136.313
G1 X154.081 Y138.483 E.0914
G1 X154.081 Y139.016
G1 X151.806 Y136.742 E.0958
G1 X151.614 Y137.082
G1 X154.081 Y139.549 E.10392
G1 X154.081 Y140.082
G1 X151.352 Y137.354 E.11495
G1 X151.024 Y137.559
G1 X154.081 Y140.616 E.12878
G1 X154.081 Y141.149
G1 X150.615 Y137.683 E.14598
G1 X150.069 Y137.671
G1 X154.081 Y141.682 E.16898
; WIPE_START
M204 S10000
G1 X152.666 Y140.268 E-.76
; WIPE_END
M73 P72 R6
G1 E-.04 F1800
G1 X150.808 Y134.677 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X149.382 Y133.251 E.06007
G1 X148.849 Y133.251
G1 X150.221 Y134.623 E.05782
G1 X149.793 Y134.728
G1 X148.316 Y133.251 E.06224
G1 X147.782 Y133.251
G1 X149.452 Y134.921 E.07035
G1 X149.18 Y135.182
G1 X147.249 Y133.251 E.08135
G1 X146.716 Y133.251
G1 X148.975 Y135.51 E.09517
G1 X148.85 Y135.918
G1 X146.182 Y133.251 E.11237
G1 X145.649 Y133.251
G1 X148.863 Y136.465 E.13538
; WIPE_START
M204 S10000
G1 X147.449 Y135.05 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.116 Y133.251 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X154.081 Y142.215 E.37763
G1 X153.746 Y142.414
G1 X144.583 Y133.251 E.38599
G1 X144.049 Y133.251
G1 X153.213 Y142.414 E.38599
G1 X152.679 Y142.414
G1 X143.516 Y133.251 E.38599
G1 X142.983 Y133.251
G1 X152.146 Y142.414 E.38599
G1 X151.613 Y142.414
G1 X142.45 Y133.251 E.38599
G1 X141.916 Y133.251
G1 X151.08 Y142.414 E.38599
G1 X150.546 Y142.414
G1 X141.383 Y133.251 E.38599
G1 X140.85 Y133.251
G1 X150.013 Y142.414 E.38599
G1 X149.48 Y142.414
G1 X140.317 Y133.251 E.38599
G1 X139.783 Y133.251
G1 X148.947 Y142.414 E.38599
G1 X148.413 Y142.414
G1 X139.25 Y133.251 E.38599
G1 X138.717 Y133.251
G1 X147.88 Y142.414 E.38599
G1 X147.347 Y142.414
G1 X138.184 Y133.251 E.38599
G1 X137.65 Y133.251
G1 X146.814 Y142.414 E.38599
G1 X146.28 Y142.414
G1 X137.117 Y133.251 E.38599
G1 X136.584 Y133.251
G1 X145.747 Y142.414 E.38599
G1 X145.214 Y142.414
G1 X136.051 Y133.251 E.38599
G1 X135.62 Y133.354
G1 X144.68 Y142.414 E.38165
G1 X144.147 Y142.414
G1 X135.62 Y133.887 E.35919
G1 X135.62 Y134.42
G1 X143.614 Y142.414 E.33673
G1 X143.081 Y142.414
G1 X135.62 Y134.954 E.31426
G1 X135.62 Y135.487
G1 X142.547 Y142.414 E.2918
G1 X142.014 Y142.414
G1 X135.62 Y136.02 E.26934
G1 X135.62 Y136.553
G1 X141.481 Y142.414 E.24687
G1 X140.948 Y142.414
G1 X135.62 Y137.087 E.22441
G1 X135.62 Y137.62
G1 X140.414 Y142.414 E.20195
G1 X139.881 Y142.414
G1 X135.62 Y138.153 E.17948
G1 X135.62 Y138.686
G1 X139.348 Y142.414 E.15702
G1 X138.815 Y142.414
G1 X135.62 Y139.22 E.13456
G1 X135.62 Y139.753
G1 X138.281 Y142.414 E.11209
G1 X137.748 Y142.414
G1 X135.62 Y140.286 E.08963
G1 X135.62 Y140.819
G1 X137.215 Y142.414 E.06717
G1 X136.682 Y142.414
G1 X135.62 Y141.353 E.0447
G1 X135.62 Y141.886
G1 X136.148 Y142.414 E.02224
; WIPE_START
M204 S10000
G1 X135.62 Y141.886 E-.28375
G1 X135.62 Y141.353 E-.20264
G1 X136.13 Y141.862 E-.27361
; WIPE_END
G1 E-.04 F1800
G1 X143.446 Y139.689 Z4.2 F30000
G1 X149.995 Y137.745 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10653
G1 F15000
G3 X149.709 Y137.55 I2.964 J-4.676 E.00174
; WIPE_START
G1 X149.995 Y137.745 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.983 Y136.824 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.105769
G1 F15000
G3 X148.789 Y136.539 I4.075 J-2.981 E.00171
; WIPE_START
G1 X148.983 Y136.824 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.268 Y134.899 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.100132
G1 F15000
G1 X151.154 Y134.805 E.00067
; LINE_WIDTH: 0.129193
G1 X151.072 Y134.747 E.00069
; LINE_WIDTH: 0.173065
G2 X150.874 Y134.611 I-2.285 J3.113 E.00247
; WIPE_START
G1 X151.072 Y134.747 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.923 Y135.659 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.179728
G1 F15000
G1 X151.846 Y135.544 E.0015
; LINE_WIDTH: 0.161681
G1 X151.787 Y135.462 E.00095
; LINE_WIDTH: 0.128665
G1 X151.726 Y135.377 E.00071
; LINE_WIDTH: 0.100111
G1 X151.636 Y135.267 E.00064
; WIPE_START
G1 X151.726 Y135.377 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.62 Y133.332 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.22883
G1 F12909.472
G1 X160.594 Y133.332 E.07305
; WIPE_START
G1 X158.594 Y133.332 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.88 Z4.2 F30000
G1 X160.194 Y143.961 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.67946
G1 F3770.384
G1 X153.693 Y143.961 E.32693
G1 X136.197 Y143.028 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X136.197 Y143.73 E.02088
G1 X136.339 Y143.778 E.00446
G3 X136.401 Y144.091 I-.322 J.226 E.00977
G1 X153.3 Y144.091 E.50338
G1 X153.3 Y143.418 E.02005
G1 X153.43 Y143.239 E.00658
G1 X153.504 Y143.214 E.00232
G1 X153.504 Y143.028 E.00554
G1 X136.257 Y143.028 E.51371
G1 X136.557 Y143.388 F30000
; LINE_WIDTH: 0.38565
G1 F7002.597
G1 X136.58 Y143.512 E.0034
G1 X136.711 Y143.731 E.00691
G1 X152.941 Y143.731 E.4394
G1 X152.962 Y143.388 E.0093
G1 X136.617 Y143.388 E.44251
G1 X136.009 Y144.211 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17924
G1 F15000
G1 X133.057 Y144.211 E.03178
G1 X132.667 Y144.586 F30000
; LINE_WIDTH: 0.22829
G1 F12947.079
G1 X127.333 Y144.586 E.07811
G1 X126.943 Y144.211 F30000
; LINE_WIDTH: 0.17924
G1 F15000
G1 X124.891 Y144.211 E.02209
G1 X124.703 Y143.028 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X95.994 Y143.028 E.85511
G1 X95.994 Y144.091 E.03165
G1 X124.499 Y144.091 E.84905
G1 X124.524 Y143.824 E.00798
G1 X124.688 Y143.73 E.00563
G2 X124.703 Y143.088 I-5.806 J-.456 E.01911
G1 X124.343 Y143.388 F30000
; LINE_WIDTH: 0.385645
G1 F7002.7
G1 X96.354 Y143.388 E.75774
G1 X96.354 Y143.731 E.00928
G1 X124.189 Y143.731 E.75358
G2 X124.343 Y143.448 I-.683 J-.554 E.00876
; WIPE_START
G1 X124.189 Y143.731 E-.12227
G1 X122.511 Y143.731 E-.63773
; WIPE_END
G1 E-.04 F1800
G1 X124.175 Y136.282 Z4.2 F30000
G1 X124.852 Y133.251 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S2000
G1 X125.28 Y133.678 E.018
G1 X125.28 Y134.211
G1 X124.319 Y133.251 E.04047
G1 X123.786 Y133.251
G1 X125.28 Y134.745 E.06293
G1 X125.28 Y135.278
G1 X123.252 Y133.251 E.08539
G1 X122.719 Y133.251
G1 X125.28 Y135.811 E.10786
G1 X125.28 Y136.344
G1 X122.186 Y133.251 E.13032
G1 X121.653 Y133.251
G1 X125.28 Y136.878 E.15278
G1 X125.28 Y137.411
G1 X121.119 Y133.251 E.17525
G1 X120.586 Y133.251
G1 X125.28 Y137.944 E.19771
G1 X125.28 Y138.478
G1 X120.053 Y133.251 E.22017
G1 X119.52 Y133.251
G1 X125.28 Y139.011 E.24264
G1 X125.28 Y139.544
G1 X118.986 Y133.251 E.2651
G1 X118.453 Y133.251
G1 X125.28 Y140.077 E.28756
G1 X125.28 Y140.611
G1 X117.92 Y133.251 E.31003
G1 X117.387 Y133.251
G1 X125.28 Y141.144 E.33249
G1 X125.28 Y141.677
G1 X116.853 Y133.251 E.35495
G1 X116.32 Y133.251
G1 X125.28 Y142.21 E.37742
G1 X124.95 Y142.414
G1 X115.787 Y133.251 E.38599
G1 X115.254 Y133.251
G1 X124.417 Y142.414 E.38599
G1 X123.883 Y142.414
G1 X114.72 Y133.251 E.38599
G1 X114.187 Y133.251
G1 X123.35 Y142.414 E.38599
G1 X122.817 Y142.414
G1 X113.654 Y133.251 E.38599
G1 X113.121 Y133.251
G1 X122.284 Y142.414 E.38599
G1 X121.75 Y142.414
G1 X112.587 Y133.251 E.38599
G1 X112.054 Y133.251
G1 X121.217 Y142.414 E.38599
G1 X120.684 Y142.414
G1 X111.521 Y133.251 E.38599
G1 X110.987 Y133.251
G1 X120.151 Y142.414 E.38599
G1 X119.617 Y142.414
G1 X110.454 Y133.251 E.38599
G1 X109.921 Y133.251
G1 X119.084 Y142.414 E.38599
G1 X118.551 Y142.414
G1 X109.388 Y133.251 E.38599
M73 P73 R6
G1 X108.854 Y133.251
G1 X118.018 Y142.414 E.38599
G1 X117.484 Y142.414
G1 X108.321 Y133.251 E.38599
G1 X107.788 Y133.251
G1 X116.951 Y142.414 E.38599
G1 X116.418 Y142.414
G1 X107.255 Y133.251 E.38599
G1 X106.721 Y133.251
G1 X115.885 Y142.414 E.38599
G1 X115.351 Y142.414
G1 X106.188 Y133.251 E.38599
G1 X105.655 Y133.251
G1 X114.818 Y142.414 E.38599
G1 X114.285 Y142.414
G1 X105.122 Y133.251 E.38599
G1 X104.588 Y133.251
G1 X113.752 Y142.414 E.38599
G1 X113.218 Y142.414
G1 X104.055 Y133.251 E.38599
G1 X103.522 Y133.251
G1 X112.685 Y142.414 E.38599
G1 X112.152 Y142.414
G1 X102.989 Y133.251 E.38599
G1 X102.455 Y133.251
G1 X111.619 Y142.414 E.38599
G1 X111.085 Y142.414
G1 X101.922 Y133.251 E.38599
G1 X101.389 Y133.251
G1 X110.552 Y142.414 E.38599
G1 X110.019 Y142.414
G1 X100.856 Y133.251 E.38599
G1 X100.322 Y133.251
G1 X109.485 Y142.414 E.38599
G1 X108.952 Y142.414
G1 X99.789 Y133.251 E.38599
G1 X99.256 Y133.251
G1 X108.419 Y142.414 E.38599
G1 X107.886 Y142.414
G1 X98.723 Y133.251 E.38599
G1 X98.189 Y133.251
G1 X99.473 Y134.535 E.0541
G1 X98.822 Y134.417
G1 X97.656 Y133.251 E.04911
G1 X97.123 Y133.251
G1 X98.373 Y134.501 E.05265
G1 X98.016 Y134.678
G1 X96.59 Y133.251 E.06011
G1 X96.143 Y133.337
G1 X97.73 Y134.925 E.06688
G1 X97.511 Y135.239
G1 X96.143 Y133.87 E.05763
G1 X96.143 Y134.404
G1 X97.368 Y135.629 E.05161
G1 X97.341 Y136.135
G1 X96.143 Y134.937 E.05046
; WIPE_START
M204 S10000
G1 X97.341 Y136.135 E-.64375
G1 X97.357 Y135.829 E-.11626
; WIPE_END
G1 E-.04 F1800
G1 X100.301 Y135.363 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X107.352 Y142.414 E.29703
G1 X106.819 Y142.414
G1 X100.417 Y136.012 E.26969
G1 X100.333 Y136.461
G1 X106.286 Y142.414 E.25075
G1 X105.753 Y142.414
G1 X100.156 Y136.818 E.23574
G1 X99.909 Y137.103
G1 X105.219 Y142.414 E.2237
G1 X104.686 Y142.414
G1 X99.596 Y137.323 E.21444
G1 X99.205 Y137.466
G1 X104.153 Y142.414 E.20844
G1 X103.62 Y142.414
G1 X98.698 Y137.493 E.20731
G1 X99.105 Y138.433
G1 X96.143 Y135.47 E.1248
G1 X96.143 Y136.003
G1 X98.585 Y138.445 E.10286
G1 X98.186 Y138.58
G1 X96.143 Y136.537 E.08605
G1 X96.143 Y137.07
G1 X97.866 Y138.793 E.07258
G1 X97.612 Y139.073
G1 X96.143 Y137.603 E.0619
G1 X96.143 Y138.137
G1 X97.428 Y139.422 E.05415
G1 X97.335 Y139.862
G1 X96.143 Y138.67 E.05023
G1 X96.143 Y139.203
G1 X97.424 Y140.484 E.05398
; WIPE_START
M204 S10000
G1 X96.143 Y139.203 E-.68859
G1 X96.143 Y139.015 E-.07141
; WIPE_END
G1 E-.04 F1800
G1 X100.402 Y139.73 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X103.086 Y142.414 E.11307
G1 X102.553 Y142.414
G1 X100.39 Y140.251 E.09113
G1 X100.255 Y140.649
G1 X102.02 Y142.414 E.07435
G1 X101.487 Y142.414
G1 X100.042 Y140.969 E.06087
G1 X99.762 Y141.222
G1 X100.953 Y142.414 E.05021
G1 X100.42 Y142.414
G1 X99.412 Y141.406 E.04246
G1 X98.972 Y141.499
G1 X99.887 Y142.414 E.03855
G1 X99.354 Y142.414
G1 X98.35 Y141.41 E.04229
G1 X98.82 Y142.414
G1 X96.143 Y139.736 E.11279
G1 X96.143 Y140.27
G1 X98.287 Y142.414 E.09033
G1 X97.754 Y142.414
G1 X96.143 Y140.803 E.06787
G1 X96.143 Y141.336
G1 X97.221 Y142.414 E.0454
G1 X96.687 Y142.414
G1 X96.143 Y141.869 E.02294
; WIPE_START
M204 S10000
G1 X96.687 Y142.414 E-.29267
G1 X97.221 Y142.414 E-.20264
G1 X96.728 Y141.921 E-.26469
; WIPE_END
G1 E-.04 F1800
G1 X100.489 Y135.817 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.1001
G1 F15000
G1 X100.401 Y136.027 E.00103
G1 X100.363 Y135.301 F30000
; LINE_WIDTH: 0.20348
G1 F14947.762
G1 X100.257 Y135.156 E.00228
; LINE_WIDTH: 0.16781
G1 F15000
G1 X100.126 Y134.995 E.00204
; LINE_WIDTH: 0.141418
G1 X99.834 Y134.704 E.00322
; LINE_WIDTH: 0.169498
G1 X99.671 Y134.57 E.0021
; LINE_WIDTH: 0.203528
G1 F14943.227
G1 X99.535 Y134.473 E.00212
; WIPE_START
G1 X99.671 Y134.57 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.412 Y136.452 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.124203
G1 F15000
G1 X97.27 Y136.206 E.00182
; WIPE_START
G1 X97.412 Y136.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.587 Y137.541 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.123411
G1 F15000
G1 X98.382 Y137.422 E.00151
; WIPE_START
G1 X98.587 Y137.541 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.44 Y138.518 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.160629
G1 F15000
G2 X99.209 Y138.388 I-2.261 J3.737 E.00247
; WIPE_START
G1 X99.44 Y138.518 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.471 Y139.661 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.159605
G1 F15000
G1 X100.317 Y139.395 E.00283
G1 X100.473 Y140.067 F30000
; LINE_WIDTH: 0.116331
G1 F15000
G1 X100.394 Y140.227 E.00103
; WIPE_START
G1 X100.473 Y140.067 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.256 Y141.454 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.175741
G1 F15000
G1 X98.08 Y141.328 E.00227
; LINE_WIDTH: 0.134725
G1 X97.922 Y141.198 E.00149
; LINE_WIDTH: 0.108358
G1 X97.633 Y140.909 E.00211
; LINE_WIDTH: 0.135692
G1 X97.502 Y140.748 E.00152
; LINE_WIDTH: 0.169945
G1 X97.431 Y140.649 E.00123
; LINE_WIDTH: 0.195808
G1 X97.359 Y140.549 E.00148
; WIPE_START
G1 X97.431 Y140.649 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.837 Y138.805 Z4.2 F30000
G1 X126.819 Y133.332 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.228153
G1 F12956.708
G1 X127.628 Y133.332 E.01184
G1 X132.372 Y133.332 F30000
; LINE_WIDTH: 0.2282
G1 F12953.368
G1 X134.081 Y133.332 E.02502
; WIPE_START
G1 X132.372 Y133.332 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.373 Y128.613 Z4.2 F30000
G1 X104.986 Y111.786 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.512 Y108.455 I.668 J-1.594 E.14864
G3 X106.287 Y108.579 I.127 J1.691 E.0255
G3 X105.178 Y111.846 I-.654 J1.6 E.16783
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.538 Y108.846 I.518 J-1.232 E.10641
G3 X105.971 Y108.886 I.087 J1.417 E.01301
G3 X105.171 Y111.433 I-.339 J1.293 E.12892
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08943
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13318
G1 X104.389 Y110.69 E-.13268
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z4.2 F30000
G1 X156.053 Y111.336 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.012 Y108.255 I1.226 J-1.218 E.12686
G3 X157.787 Y108.379 I.127 J1.691 E.0255
G3 X156.104 Y111.367 I-.654 J1.6 E.18848
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.038 Y108.646 I.818 J-1.057 E.09603
G3 X157.471 Y108.686 I.087 J1.417 E.01301
G3 X156.362 Y111.072 I-.339 J1.293 E.13932
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15556
G1 X155.889 Y110.49 E-.13267
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.06631
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.1328
G1 X155.985 Y109.299 E-.07359
; WIPE_END
G1 E-.04 F1800
G1 X156.715 Y112.301 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.01 Y112.255 E.00959
G3 X157.787 Y112.379 I.128 J1.692 E.02555
G3 X156.657 Y112.317 I-.654 J1.6 E.31213
G1 X156.77 Y112.689 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.78 Y112.69 E.00027
G3 X157.036 Y112.646 I.353 J1.289 E.00777
G3 X157.471 Y112.686 I.089 J1.416 E.01307
G3 X156.615 Y112.747 I-.339 J1.293 E.2241
G1 X156.714 Y112.71 E.00315
; WIPE_START
M204 S10000
G1 X156.78 Y112.69 E-.02597
G1 X157.036 Y112.646 E-.09899
G1 X157.3 Y112.652 E-.10014
G1 X157.471 Y112.686 E-.0665
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.13267
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13267
G1 X158.364 Y113.476 E-.00359
; WIPE_END
G1 E-.04 F1800
G1 X150.773 Y114.268 Z4.2 F30000
G1 X115.395 Y117.959 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
M73 P74 R6
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z4.2 F30000
G1 X160.79 Y118.893 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03445
G1 X155.789 Y108.172 E.00599
G1 X155.941 Y107.918 E.00952
G1 X155.86 Y107.804 E.00453
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409117
G1 F6553.857
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468869
G1 F5634.483
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436046
G1 F6104.914
G3 X157.392 Y107.86 I.299 J5.922 E.01743
; LINE_WIDTH: 0.46839
G1 F5640.829
G3 X157.641 Y107.884 I-.246 J3.881 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.4471
G1 F5937.954
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409263
G1 F6551.242
G1 X157.808 Y108.158 E.00808
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03895
G3 X158.975 Y110.919 I-3.17 J-.498 E.02551
G1 X160.05 Y111.994 E.04887
G1 X160.05 Y116.978 E.16028
G1 X158.875 Y118.153 E.05343
G1 X158.533 Y118.153 E.01099
G1 X156.232 Y115.852 E.10464
M73 P74 R5
G3 X155.251 Y114.872 I1.075 J-2.056 E.04528
G1 X153.953 Y113.574 E.05903
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05075
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116587
G1 F15000
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146142
G1 X156.863 Y111.953 E.00027
; LINE_WIDTH: 0.187342
G1 X156.893 Y111.979 E.00045
G1 X157.358 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.180197
G1 F15000
G1 X157.358 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144908
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116607
G1 X157.584 Y112.078 E.00103
G1 X157.584 Y111.88 F30000
; LINE_WIDTH: 0.116594
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149339
G1 X157.38 Y111.958 E.00036
; WIPE_START
G1 X157.417 Y111.937 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.805 Y111.375 Z4.2 F30000
G1 X105.499 Y108.106 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.058 J2.266 E.05208
G1 X107.816 Y107.804 E.03722
G1 X109.804 Y107.804 E.06391
G1 X115.047 Y113.047 E.23842
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10131
G1 X112.477 Y118.153 E.01099
G1 X106.423 Y112.099 E.27531
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05343
G1 X97.467 Y118.153 E.01099
G1 X104.069 Y111.551 E.30022
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.07169
G1 X100.14 Y107.804 E.06391
G1 X95.95 Y111.994 E.19055
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01099
G1 X115.047 Y108.25 E.45038
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.25 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/41
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S201.45
G17
G3 Z4.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X127.015 Y144.48
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X127.015 Y143.936 E.01747
G1 X127.454 Y143.936 E.01411
G1 X127.439 Y144.48 E.01748
G1 X127.075 Y144.48 E.01172
; WIPE_START
G1 X127.015 Y143.936 E-.21945
G1 X127.454 Y143.936 E-.17609
G1 X127.439 Y144.48 E-.2182
G1 X127.075 Y144.48 E-.14627
; WIPE_END
G1 E-.04 F1800
G1 X132.561 Y144.48 Z4.4 F30000
G1 Z4
G1 E.8 F1800
G1 F5895.652
G1 X132.547 Y143.936 E.01748
G1 X133.885 Y143.936 E.04304
G1 X133.885 Y144.48 E.01747
G1 X132.621 Y144.48 E.04066
; WIPE_START
G1 X132.547 Y143.936 E-.2084
G1 X133.885 Y143.936 E-.50867
G1 X133.885 Y144.049 E-.04293
; WIPE_END
G1 E-.04 F1800
G1 X141.516 Y144.199 Z4.4 F30000
G1 X155.816 Y144.48 Z4.4
G1 Z4
G1 E.8 F1800
G1 F5895.652
G1 X155.816 Y143.436 E.03356
G1 X160.398 Y143.436 E.14734
G1 X160.398 Y144.48 E.03356
G1 X155.876 Y144.48 E.14541
; WIPE_START
G1 X155.816 Y143.436 E-.39722
G1 X156.771 Y143.436 E-.36278
; WIPE_END
G1 E-.04 F1800
G1 X149.139 Y143.336 Z4.4 F30000
G1 X95.92 Y142.636 Z4.4
G1 Z4
G1 E.8 F1800
G1 F5895.652
G1 X95.92 Y144.48 E.05927
G1 X95.602 Y144.48 E.01023
G1 X95.602 Y133.432 E.35525
G1 X96.396 Y133.432 E.02553
G1 X96.396 Y140.241 E.21895
G1 X95.92 Y140.241 E.0153
G1 X95.92 Y142.576 E.07511
; WIPE_START
G1 X95.92 Y144.48 E-.72319
G1 X95.823 Y144.48 E-.03681
; WIPE_END
G1 E-.04 F1800
G1 X96.788 Y141.769 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X125.487 Y141.769 E.85485
G1 X125.487 Y143.544 E.05289
G1 X126.797 Y143.544 E.03903
G1 X127.197 Y143.544 E.01191
G1 F4196.468
G1 X127.597 Y143.544 E.01191
M106 S229.5
G1 F720
G1 X127.856 Y143.544 E.00771
M106 S201.45
G1 F6364.704
G1 X127.837 Y144.257 E.02123
G1 X127.836 Y144.294 E.00112
G1 X131.364 Y144.294 E.10507
G1 X131.764 Y144.294 E.01191
G1 F4670.209
G1 X132.164 Y144.294 E.01191
G1 F923.649
G1 X132.163 Y144.257 E.00112
M106 S229.5
G1 F720
G1 X132.144 Y143.544 E.02123
M106 S201.45
G1 F2640.684
G1 X132.403 Y143.544 E.00771
G1 F6364.704
G1 X132.803 Y143.544 E.01191
G1 X135.413 Y143.544 E.07775
G1 X135.413 Y141.769 E.05289
G1 X154.288 Y141.769 E.56222
G1 X154.288 Y143.044 E.03799
G1 X160.79 Y143.044 E.19367
G1 X160.79 Y144.872 E.05444
G1 X95.21 Y144.872 E1.9534
G1 X95.21 Y133.04 E.35243
G1 X160.79 Y133.04 E1.9534
G1 X160.79 Y133.617 E.0172
G1 X132.942 Y133.617 E.82949
G1 X132.542 Y133.617 E.01191
G1 F5760
G1 X132.142 Y133.617 E.01191
M106 S229.5
G1 F1440
G1 X131.883 Y133.617 E.00771
M106 S201.45
G1 F3293.031
G1 X131.878 Y133.412 E.0061
G1 F3795.083
G1 X131.877 Y133.368 E.00132
G1 F6364.704
G1 X131.477 Y133.368 E.01191
G1 X128.523 Y133.368 E.08798
G1 X128.123 Y133.368 E.01191
G1 F1778.023
G1 X128.122 Y133.412 E.00132
M106 S229.5
G1 F1440
G1 X128.117 Y133.617 E.0061
M106 S201.45
G1 F3907.106
G1 X127.858 Y133.617 E.00771
G1 F6364.704
G1 X127.458 Y133.617 E.01191
G1 X96.788 Y133.617 E.91355
G1 X96.788 Y141.709 E.24102
; WIPE_START
M204 S10000
G1 X98.788 Y141.713 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.999 Y140.037 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42972
G1 F6204.757
G1 X95.999 Y133.635 E.1956
G1 X96.592 Y133.329 F30000
; LINE_WIDTH: 0.22818
G1 F12954.767
G1 X127.928 Y133.329 E.45858
G1 X132.072 Y133.329 F30000
G1 F12954.767
G1 X160.594 Y133.329 E.4174
; WIPE_START
G1 X158.594 Y133.329 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.73 Y140.876 Z4.4 F30000
G1 X160.194 Y143.958 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.67945
G1 F3770.443
G1 X156.019 Y143.958 E.20992
G1 X155.62 Y144.444 F30000
; LINE_WIDTH: 0.506231
G1 F5180.111
G1 X134.081 Y144.444 E.78827
G1 X133.682 Y144.208 F30000
; LINE_WIDTH: 0.17922
G1 F15000
G1 X132.757 Y144.208 E.00995
G1 X132.367 Y144.583 F30000
; LINE_WIDTH: 0.22827
G1 F12948.476
G1 X127.633 Y144.583 E.06932
G1 X126.819 Y144.444 F30000
; LINE_WIDTH: 0.50626
G1 F5179.782
G1 X96.116 Y144.444 E1.12372
G1 X125.545 Y144.186 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S2000
G1 X125.979 Y143.752 E.01829
G1 X125.446 Y143.752
G1 X125.012 Y144.186 E.01829
G1 X124.479 Y144.186
G1 X125.28 Y143.385 E.03374
G1 X125.28 Y142.852
G1 X123.945 Y144.186 E.0562
G1 X123.412 Y144.186
G1 X125.28 Y142.318 E.07866
G1 X125.089 Y141.976
G1 X122.879 Y144.186 E.09309
G1 X122.346 Y144.186
G1 X124.555 Y141.976 E.09309
G1 X124.022 Y141.976
G1 X121.812 Y144.186 E.09309
G1 X121.279 Y144.186
G1 X123.489 Y141.976 E.09309
G1 X122.956 Y141.976
G1 X120.746 Y144.186 E.09309
G1 X120.213 Y144.186
G1 X122.422 Y141.976 E.09309
G1 X121.889 Y141.976
G1 X119.679 Y144.186 E.09309
G1 X119.146 Y144.186
G1 X121.356 Y141.976 E.09309
G1 X120.823 Y141.976
G1 X118.613 Y144.186 E.09309
G1 X118.08 Y144.186
G1 X120.289 Y141.976 E.09309
G1 X119.756 Y141.976
G1 X117.546 Y144.186 E.09309
G1 X117.013 Y144.186
G1 X119.223 Y141.976 E.09309
G1 X118.69 Y141.976
G1 X116.48 Y144.186 E.09309
G1 X115.947 Y144.186
G1 X118.156 Y141.976 E.09309
G1 X117.623 Y141.976
G1 X115.413 Y144.186 E.09309
G1 X114.88 Y144.186
G1 X117.09 Y141.976 E.09309
G1 X116.557 Y141.976
G1 X114.347 Y144.186 E.09309
G1 X113.814 Y144.186
G1 X116.023 Y141.976 E.09309
G1 X115.49 Y141.976
G1 X113.28 Y144.186 E.09309
G1 X112.747 Y144.186
M73 P75 R5
G1 X114.957 Y141.976 E.09309
G1 X114.424 Y141.976
G1 X112.214 Y144.186 E.09309
G1 X111.681 Y144.186
G1 X113.89 Y141.976 E.09309
G1 X113.357 Y141.976
G1 X111.147 Y144.186 E.09309
G1 X110.614 Y144.186
G1 X112.824 Y141.976 E.09309
G1 X112.291 Y141.976
G1 X110.081 Y144.186 E.09309
G1 X109.547 Y144.186
G1 X111.757 Y141.976 E.09309
G1 X111.224 Y141.976
G1 X109.014 Y144.186 E.09309
G1 X108.481 Y144.186
G1 X110.691 Y141.976 E.09309
G1 X110.157 Y141.976
G1 X107.948 Y144.186 E.09309
G1 X107.414 Y144.186
G1 X109.624 Y141.976 E.09309
G1 X109.091 Y141.976
G1 X106.881 Y144.186 E.09309
G1 X106.348 Y144.186
G1 X108.558 Y141.976 E.09309
G1 X108.024 Y141.976
G1 X105.815 Y144.186 E.09309
G1 X105.281 Y144.186
G1 X107.491 Y141.976 E.09309
G1 X106.958 Y141.976
G1 X104.748 Y144.186 E.09309
G1 X104.215 Y144.186
G1 X106.425 Y141.976 E.09309
G1 X105.891 Y141.976
G1 X103.682 Y144.186 E.09309
G1 X103.148 Y144.186
G1 X105.358 Y141.976 E.09309
G1 X104.825 Y141.976
G1 X102.615 Y144.186 E.09309
G1 X102.082 Y144.186
G1 X104.292 Y141.976 E.09309
G1 X103.758 Y141.976
G1 X101.549 Y144.186 E.09309
G1 X101.015 Y144.186
G1 X103.225 Y141.976 E.09309
G1 X102.692 Y141.976
G1 X100.482 Y144.186 E.09309
G1 X99.949 Y144.186
G1 X102.159 Y141.976 E.09309
G1 X101.625 Y141.976
G1 X99.416 Y144.186 E.09309
G1 X98.882 Y144.186
G1 X101.092 Y141.976 E.09309
G1 X100.559 Y141.976
G1 X98.349 Y144.186 E.09309
G1 X97.816 Y144.186
G1 X100.026 Y141.976 E.09309
G1 X99.492 Y141.976
G1 X97.283 Y144.186 E.09309
G1 X96.749 Y144.186
G1 X98.959 Y141.976 E.09309
G1 X98.426 Y141.976
G1 X96.216 Y144.186 E.09309
G1 X96.143 Y143.726
G1 X97.893 Y141.976 E.07371
G1 X97.359 Y141.976
G1 X96.143 Y143.193 E.05125
G1 X96.143 Y142.659
G1 X96.826 Y141.976 E.02878
G1 X96.581 Y141.688
G1 X96.143 Y142.126 E.01845
G1 X96.143 Y141.593
G1 X96.581 Y141.155 E.01845
M204 S10000
G1 X96.501 Y140.908 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.202404
G1 F15000
G1 X96.364 Y141.004 E.00211
; LINE_WIDTH: 0.228209
G1 F12952.761
G1 X96.226 Y141.099 E.00245
G1 X96.131 Y141.037 E.00165
G1 X96.599 Y141.015 F30000
; LINE_WIDTH: 0.164113
G1 F15000
G2 X96.441 Y140.967 I-.189 J.34 E.0016
G1 X96.124 Y141.083 E.00323
; WIPE_START
G1 X96.441 Y140.967 E-.5099
G1 X96.599 Y141.015 E-.2501
; WIPE_END
G1 E-.04 F1800
G1 X104.196 Y141.751 Z4.4 F30000
G1 X126.607 Y143.921 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50966
G1 F5142.049
G2 X126.605 Y144.022 I-.029 J.05 E.00889
; WIPE_START
G1 X126.549 Y144.022 E-.18592
G1 X126.52 Y143.971 E-.19136
G1 X126.549 Y143.921 E-.19136
G1 X126.607 Y143.921 E-.19137
; WIPE_END
G1 E-.04 F1800
G1 X134.239 Y143.801 Z4.4 F30000
G1 X155.593 Y143.467 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S2000
G1 X154.874 Y144.186 E.03029
G1 X154.341 Y144.186
G1 X155.276 Y143.251 E.03937
G1 X154.742 Y143.251
G1 X153.808 Y144.186 E.03937
G1 X153.275 Y144.186
G1 X154.209 Y143.251 E.03937
G1 X154.081 Y142.847
G1 X152.741 Y144.186 E.05642
G1 X152.208 Y144.186
G1 X154.081 Y142.313 E.07888
G1 X153.885 Y141.976
G1 X151.675 Y144.186 E.09309
G1 X151.142 Y144.186
G1 X153.351 Y141.976 E.09309
G1 X152.818 Y141.976
G1 X150.608 Y144.186 E.09309
G1 X150.075 Y144.186
G1 X152.285 Y141.976 E.09309
G1 X151.752 Y141.976
G1 X149.542 Y144.186 E.09309
G1 X149.009 Y144.186
G1 X151.218 Y141.976 E.09309
G1 X150.685 Y141.976
G1 X148.475 Y144.186 E.09309
G1 X147.942 Y144.186
G1 X150.152 Y141.976 E.09309
G1 X149.619 Y141.976
G1 X147.409 Y144.186 E.09309
G1 X146.875 Y144.186
G1 X149.085 Y141.976 E.09309
G1 X148.552 Y141.976
G1 X146.342 Y144.186 E.09309
G1 X145.809 Y144.186
G1 X148.019 Y141.976 E.09309
G1 X147.486 Y141.976
G1 X145.276 Y144.186 E.09309
G1 X144.742 Y144.186
G1 X146.952 Y141.976 E.09309
G1 X146.419 Y141.976
G1 X144.209 Y144.186 E.09309
G1 X143.676 Y144.186
G1 X145.886 Y141.976 E.09309
G1 X145.352 Y141.976
G1 X143.143 Y144.186 E.09309
G1 X142.609 Y144.186
G1 X144.819 Y141.976 E.09309
G1 X144.286 Y141.976
G1 X142.076 Y144.186 E.09309
G1 X141.543 Y144.186
G1 X143.753 Y141.976 E.09309
G1 X143.219 Y141.976
G1 X141.01 Y144.186 E.09309
G1 X140.476 Y144.186
G1 X142.686 Y141.976 E.09309
G1 X142.153 Y141.976
G1 X139.943 Y144.186 E.09309
G1 X139.41 Y144.186
G1 X141.62 Y141.976 E.09309
G1 X141.086 Y141.976
G1 X138.877 Y144.186 E.09309
G1 X138.343 Y144.186
G1 X140.553 Y141.976 E.09309
G1 X140.02 Y141.976
G1 X137.81 Y144.186 E.09309
G1 X137.277 Y144.186
G1 X139.487 Y141.976 E.09309
G1 X138.953 Y141.976
G1 X136.744 Y144.186 E.09309
G1 X136.21 Y144.186
G1 X138.42 Y141.976 E.09309
G1 X137.887 Y141.976
G1 X135.677 Y144.186 E.09309
G1 X135.578 Y143.752
G1 X135.144 Y144.186 E.0183
G1 X134.666 Y144.13
G1 X135.045 Y143.752 E.01595
G1 X135.62 Y143.709
G1 X137.354 Y141.976 E.07301
G1 X136.82 Y141.976
G1 X135.62 Y143.176 E.05055
G1 X135.62 Y142.643
G1 X136.287 Y141.976 E.02809
; WIPE_START
M204 S10000
G1 X135.62 Y142.643 E-.35829
G1 X135.62 Y143.176 E-.20264
G1 X135.991 Y142.806 E-.19907
; WIPE_END
G1 E-.04 F1800
G1 X130.595 Y137.407 Z4.4 F30000
G1 X104.986 Y111.786 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.506 Y108.455 I.668 J-1.594 E.14846
G3 X106.287 Y108.579 I.132 J1.691 E.02568
G3 X105.178 Y111.846 I-.654 J1.6 E.16783
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.533 Y108.846 I.518 J-1.232 E.10625
G3 X105.971 Y108.886 I.093 J1.415 E.01318
G3 X105.17 Y111.433 I-.339 J1.293 E.12892
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08942
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.1332
G1 X104.389 Y110.69 E-.13265
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z4.4 F30000
G1 X156.053 Y111.336 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157.006 Y108.255 I1.226 J-1.218 E.12668
G3 X157.787 Y108.379 I.132 J1.691 E.02568
G3 X156.104 Y111.367 I-.654 J1.6 E.18848
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.033 Y108.646 I.818 J-1.057 E.09586
G3 X157.471 Y108.686 I.093 J1.415 E.01318
G3 X156.363 Y111.072 I-.339 J1.293 E.13931
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15557
G1 X155.889 Y110.49 E-.13265
G1 X155.798 Y110.153 E-.1328
G1 X155.788 Y109.978 E-.06629
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.716 Y112.301 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.015 Y112.254 E.00976
G3 X157.787 Y112.379 I.123 J1.691 E.02537
G3 X156.658 Y112.317 I-.654 J1.6 E.31215
G1 X156.766 Y112.69 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.78 Y112.69 E.0004
G3 X157.042 Y112.646 I.353 J1.289 E.00794
G3 X157.471 Y112.686 I.083 J1.419 E.0129
G3 X156.615 Y112.747 I-.339 J1.293 E.2241
G1 X156.71 Y112.711 E.00301
; WIPE_START
M204 S10000
G1 X156.78 Y112.69 E-.02768
G1 X157.042 Y112.646 E-.10113
G1 X157.3 Y112.652 E-.09801
G1 X157.471 Y112.686 E-.06649
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.13268
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13267
G1 X158.363 Y113.471 E-.00188
; WIPE_END
G1 E-.04 F1800
G1 X150.772 Y114.264 Z4.4 F30000
G1 X115.395 Y117.959 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z4.4 F30000
G1 X160.79 Y118.893 Z4.4
G1 Z4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.25 E.01433
G1 X105.143 Y118.153 E.45038
G1 X104.801 Y118.153 E.01099
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.14 Y107.804 E.19055
G1 X102.128 Y107.804 E.06391
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07449
G1 X97.467 Y118.153 E.30022
G1 X97.125 Y118.153 E.01099
G1 X95.95 Y116.978 E.05343
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27531
G1 X112.819 Y118.153 E.01099
G1 X115.047 Y115.925 E.10131
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23842
G1 X107.816 Y107.804 E.06391
G1 X106.998 Y108.622 E.03722
G2 X105.499 Y108.107 I-1.439 J1.747 E.05208
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M73 P76 R5
G1 X155.86 Y107.804 E.05236
G1 X155.941 Y107.918 E.00453
G1 X155.789 Y108.172 E.00952
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409117
G1 F6553.857
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468869
G1 F5634.483
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436046
G1 F6104.914
G3 X157.392 Y107.86 I.299 J5.921 E.01743
; LINE_WIDTH: 0.468383
G1 F5640.925
G3 X157.641 Y107.884 I-.246 J3.889 E.00841
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.44703
G1 F5938.985
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409154
G1 F6553.199
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.879 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.116638
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149362
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180164
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144798
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.11656
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187335
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146179
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116587
G1 X156.666 Y111.88 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05075
G1 X153.953 Y113.574 E.05869
G1 X155.251 Y114.872 E.05903
G2 X156.232 Y115.852 I2.055 J-1.075 E.04528
G1 X158.533 Y118.153 E.10465
G1 X158.875 Y118.153 E.01099
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y111.994 E.16028
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.952 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/41
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S224.4
G17
G3 Z4.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X96.396 Y143.933
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X127.753 Y143.933 E1.00834
G1 X127.739 Y144.476 E.01748
G1 X95.602 Y144.476 E1.03341
G1 X95.602 Y133.428 E.35525
G1 X96.396 Y133.428 E.02553
G1 X96.396 Y143.873 E.33585
; WIPE_START
G1 X98.396 Y143.876 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.027 Y144.012 Z4.6 F30000
G1 X132.261 Y144.476 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F5895.652
G1 X132.247 Y143.933 E.01748
G1 X160.398 Y143.933 E.90525
G1 X160.398 Y144.476 E.01748
G1 X132.321 Y144.476 E.90286
; WIPE_START
G1 X132.247 Y143.933 E-.20841
G1 X133.698 Y143.933 E-.55159
; WIPE_END
G1 E-.04 F1800
G1 X126.066 Y143.852 Z4.6 F30000
G1 X96.788 Y143.541 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.097 Y143.541 E.9028
G1 X127.497 Y143.541 E.01191
G1 F4196.468
G1 X127.897 Y143.541 E.01191
M106 S229.5
G1 F720
G1 X128.156 Y143.541 E.00771
M106 S224.4
G1 F6364.704
G1 X128.137 Y144.253 E.02124
G1 X128.136 Y144.291 E.00112
G1 X131.064 Y144.291 E.0872
G1 X131.464 Y144.291 E.01191
G1 F4670.209
G1 X131.864 Y144.291 E.01191
G1 F923.649
G1 X131.863 Y144.253 E.00112
M106 S229.5
G1 F720
G1 X131.844 Y143.541 E.02123
M106 S224.4
G1 F2640.586
G1 X132.103 Y143.541 E.00771
G1 F6364.704
G1 X132.503 Y143.541 E.01191
G1 X160.79 Y143.541 E.84258
G1 X160.79 Y144.868 E.03954
G1 X95.21 Y144.868 E1.9534
G1 X95.21 Y133.036 E.35243
G1 X160.79 Y133.036 E1.9534
G1 X160.79 Y133.614 E.0172
G1 X132.642 Y133.614 E.83842
G1 X132.242 Y133.614 E.01191
G1 F5760
G1 X131.842 Y133.614 E.01191
M106 S229.5
G1 F1440
G1 X131.583 Y133.614 E.00771
M106 S224.4
G1 F3293.472
G1 X131.578 Y133.409 E.0061
G1 F3795.674
G1 X131.577 Y133.364 E.00133
G1 F6364.704
G1 X131.177 Y133.364 E.01191
G1 X128.823 Y133.364 E.07011
G1 X128.423 Y133.364 E.01191
G1 F1778.103
G1 X128.422 Y133.409 E.00133
M106 S229.5
G1 F1440
G1 X128.417 Y133.614 E.0061
M106 S224.4
G1 F3906.868
G1 X128.158 Y133.614 E.00771
G1 F6364.704
G1 X127.758 Y133.614 E.01191
G1 X96.788 Y133.614 E.92248
G1 X96.788 Y143.481 E.2939
M204 S10000
G1 X96.192 Y144.204 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.20203
G1 F15000
G1 X96.063 Y144.14 E.00181
; LINE_WIDTH: 0.24749
G1 F11731.926
G1 X95.935 Y144.075 E.00233
; LINE_WIDTH: 0.29295
G1 F9598.849
G1 X95.806 Y144.011 E.00285
G1 X160.194 Y144.204 F30000
; LINE_WIDTH: 0.179271
G1 F15000
G1 X132.457 Y144.204 E.29875
G1 X132.067 Y144.579 F30000
; LINE_WIDTH: 0.22825
G1 F12949.874
G1 X127.933 Y144.579 E.06053
G1 X127.543 Y144.204 F30000
; LINE_WIDTH: 0.1793
G1 F15000
G1 X96.192 Y144.204 E.33774
G1 X95.999 Y144.273 F30000
; LINE_WIDTH: 0.42972
G1 F6204.757
G1 X95.999 Y133.632 E.32512
G1 X96.592 Y133.325 F30000
; LINE_WIDTH: 0.22827
G1 F12948.476
G1 X128.228 Y133.325 E.46319
G1 X131.772 Y133.325 F30000
G1 F12948.476
G1 X160.594 Y133.325 E.42199
; WIPE_START
G1 X158.594 Y133.325 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.512 Y130.479 Z4.6 F30000
G1 X104.986 Y111.786 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.5 Y108.456 I.668 J-1.594 E.14828
G3 X106.287 Y108.579 I.137 J1.692 E.02586
G3 X105.178 Y111.846 I-.655 J1.6 E.16782
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.527 Y108.847 I.518 J-1.232 E.1061
G3 X105.971 Y108.886 I.098 J1.415 E.01335
G3 X105.17 Y111.433 I-.339 J1.293 E.12891
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08943
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13317
G1 X104.389 Y110.69 E-.13268
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z4.6 F30000
G1 X156.053 Y111.336 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X157 Y108.256 I1.228 J-1.217 E.12643
G3 X157.573 Y108.307 I.125 J1.832 E.01857
G3 X156.104 Y111.367 I-.438 J1.673 E.19595
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.027 Y108.647 I.818 J-1.057 E.0957
G3 X157.471 Y108.686 I.098 J1.415 E.01335
G3 X156.363 Y111.072 I-.339 J1.293 E.1393
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15555
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.716 Y112.301 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.021 Y112.254 E.00992
G3 X157.787 Y112.379 I.117 J1.692 E.02519
G3 X156.658 Y112.317 I-.654 J1.6 E.31217
G1 X156.762 Y112.692 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.78 Y112.69 E.00053
G3 X157.048 Y112.645 I.353 J1.289 E.00811
G3 X157.471 Y112.686 I.076 J1.423 E.01273
G3 X156.615 Y112.747 I-.339 J1.293 E.2241
G1 X156.706 Y112.713 E.00288
; WIPE_START
M204 S10000
G1 X156.78 Y112.69 E-.02938
G1 X157.048 Y112.645 E-.10325
G1 X157.3 Y112.652 E-.09588
G1 X157.471 Y112.686 E-.0665
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.13267
G1 X158.187 Y113.164 E-.13317
G1 X158.361 Y113.467 E-.13267
G1 X158.362 Y113.467 E-.00018
; WIPE_END
G1 E-.04 F1800
G1 X150.77 Y114.261 Z4.6 F30000
G1 X115.395 Y117.959 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z4.6 F30000
G1 X160.79 Y118.893 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03446
G1 X155.789 Y108.173 E.00599
G1 X155.942 Y107.918 E.00953
G1 X155.859 Y107.804 E.00454
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409264
G1 F6551.225
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468886
G1 F5634.263
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436046
G1 F6104.917
G3 X157.392 Y107.86 I.299 J5.925 E.01743
; LINE_WIDTH: 0.468387
G1 F5640.86
G3 X157.641 Y107.884 I-.245 J3.878 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447085
G1 F5938.17
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409242
M73 P77 R5
G1 F6551.627
G1 X157.808 Y108.158 E.00808
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03896
G3 X158.975 Y110.919 I-3.17 J-.498 E.0255
G1 X160.05 Y111.994 E.04888
G1 X160.05 Y116.978 E.16027
G1 X158.875 Y118.153 E.05344
G1 X158.533 Y118.153 E.01098
G1 X156.232 Y115.852 E.10466
G3 X155.252 Y114.872 I1.075 J-2.055 E.04526
G1 X153.953 Y113.573 E.05905
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05076
G1 X156.666 Y112.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116564
G1 F15000
G1 X156.833 Y112.02 E.00103
; LINE_WIDTH: 0.144775
G1 X156.86 Y112.006 E.00025
; LINE_WIDTH: 0.187167
G1 X156.893 Y111.979 E.00048
G1 X157.357 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.180183
G1 F15000
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144854
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116584
G1 X157.584 Y112.077 E.00103
G1 X157.584 Y111.88 F30000
; LINE_WIDTH: 0.11662
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149366
G1 X157.38 Y111.958 E.00036
; WIPE_START
G1 X157.417 Y111.937 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.805 Y111.375 Z4.6 F30000
G1 X105.499 Y108.107 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.062 J2.259 E.05208
G1 X107.816 Y107.804 E.03723
G1 X109.804 Y107.804 E.0639
G1 X115.047 Y113.047 E.23843
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10132
G1 X112.477 Y118.153 E.01098
G1 X106.423 Y112.099 E.27532
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05344
G1 X97.467 Y118.153 E.01098
G1 X104.069 Y111.551 E.30023
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.0717
G1 X100.141 Y107.804 E.0639
G1 X95.95 Y111.994 E.19056
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01098
G1 X115.047 Y108.249 E.45039
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.249 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/41
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X96.396 Y143.929
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X128.053 Y143.929 E1.01799
G1 X128.039 Y144.473 E.01748
G1 X95.602 Y144.473 E1.04306
G1 X95.602 Y133.425 E.35525
G1 X96.396 Y133.425 E.02553
G1 X96.396 Y143.869 E.33585
; WIPE_START
G1 X98.396 Y143.873 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.027 Y144.009 Z4.8 F30000
G1 X131.961 Y144.473 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F5895.652
G1 X131.947 Y143.929 E.01748
G1 X160.398 Y143.929 E.91489
G1 X160.398 Y144.473 E.01748
G1 X132.021 Y144.473 E.9125
; WIPE_START
G1 X131.947 Y143.929 E-.20842
G1 X133.398 Y143.929 E-.55158
; WIPE_END
G1 E-.04 F1800
G1 X125.766 Y143.847 Z4.8 F30000
G1 X96.788 Y143.537 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.397 Y143.537 E.91174
G1 X127.797 Y143.537 E.01191
G1 F4196.468
G1 X128.197 Y143.537 E.01191
M106 S229.5
G1 F720
G1 X128.456 Y143.537 E.00771
M106 S224.4
G1 F6364.704
G1 X128.437 Y144.25 E.02124
G1 X128.436 Y144.287 E.00112
G1 X130.764 Y144.287 E.06933
G1 X131.164 Y144.287 E.01191
G1 F4670.338
G1 X131.564 Y144.287 E.01191
G1 F923.707
G1 X131.563 Y144.25 E.00112
M106 S229.5
G1 F720
G1 X131.544 Y143.537 E.02124
M106 S224.4
G1 F2640.781
G1 X131.803 Y143.537 E.00771
G1 F6364.704
G1 X132.203 Y143.537 E.01191
G1 X160.79 Y143.537 E.85151
G1 X160.79 Y144.865 E.03954
G1 X95.21 Y144.865 E1.9534
G1 X95.21 Y133.033 E.35243
G1 X160.79 Y133.033 E1.9534
G1 X160.79 Y133.61 E.0172
G1 X132.342 Y133.61 E.84736
G1 X131.942 Y133.61 E.01191
G1 F5760
G1 X131.542 Y133.61 E.01191
M106 S229.5
G1 F1440
G1 X131.283 Y133.61 E.00771
M106 S224.4
G1 F3293.914
G1 X131.278 Y133.405 E.00611
G1 F3796.15
G1 X131.277 Y133.361 E.00133
G1 F6364.704
G1 X130.877 Y133.361 E.01191
G1 X129.123 Y133.361 E.05224
G1 X128.723 Y133.361 E.01191
G1 F1778.103
G1 X128.722 Y133.405 E.00133
M106 S229.5
G1 F1440
G1 X128.717 Y133.61 E.00611
M106 S224.4
G1 F3907.106
G1 X128.458 Y133.61 E.00771
G1 F6364.704
G1 X128.058 Y133.61 E.01191
G1 X96.788 Y133.61 E.93142
G1 X96.788 Y143.477 E.2939
M204 S10000
G1 X96.192 Y144.201 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.20201
G1 F15000
G1 X96.063 Y144.136 E.00181
; LINE_WIDTH: 0.24747
G1 F11733.073
G1 X95.935 Y144.072 E.00233
; LINE_WIDTH: 0.29293
G1 F9599.616
G1 X95.806 Y144.007 E.00285
G1 X160.194 Y144.201 F30000
; LINE_WIDTH: 0.17929
G1 F15000
G1 X132.157 Y144.201 E.30202
G1 X131.767 Y144.576 F30000
; LINE_WIDTH: 0.22822
G1 F12951.97
G1 X128.233 Y144.576 E.05174
G1 X127.843 Y144.201 F30000
; LINE_WIDTH: 0.17929
G1 F15000
G1 X96.192 Y144.201 E.34094
G1 X95.999 Y144.269 F30000
; LINE_WIDTH: 0.42972
G1 F6204.757
G1 X95.999 Y133.628 E.32512
G1 X96.592 Y133.322 F30000
; LINE_WIDTH: 0.22835
G1 F12942.89
G1 X128.528 Y133.322 E.46779
G1 X131.472 Y133.322 F30000
G1 F12942.89
G1 X160.594 Y133.322 E.42657
; WIPE_START
G1 X158.594 Y133.322 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.512 Y130.476 Z4.8 F30000
G1 X104.986 Y111.786 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.774 E.00079
G3 X105.495 Y108.456 I.67 J-1.594 E.14806
G3 X106.073 Y108.507 I.13 J1.832 E.01875
G3 X105.178 Y111.847 I-.438 J1.673 E.17531
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.411 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.521 Y108.847 I.517 J-1.232 E.10594
G3 X105.971 Y108.886 I.104 J1.415 E.01352
G3 X105.17 Y111.433 I-.339 J1.293 E.1289
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08942
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13318
G1 X104.389 Y110.69 E-.13266
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z4.8 F30000
G1 X156.053 Y111.336 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X156.995 Y108.256 I1.228 J-1.217 E.12626
G3 X157.573 Y108.307 I.13 J1.833 E.01875
G3 X156.104 Y111.367 I-.438 J1.673 E.19595
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.021 Y108.647 I.818 J-1.057 E.09555
G3 X157.471 Y108.686 I.104 J1.416 E.01352
G3 X156.362 Y111.072 I-.339 J1.293 E.13929
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15558
G1 X155.889 Y110.49 E-.13266
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.06629
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X156.717 Y112.301 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.027 Y112.254 E.01008
G3 X157.787 Y112.379 I.112 J1.691 E.02501
G3 X156.659 Y112.317 I-.654 J1.6 E.31219
G1 X156.758 Y112.693 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.78 Y112.69 E.00066
G3 X157.053 Y112.645 I.353 J1.289 E.00828
G3 X157.471 Y112.686 I.07 J1.429 E.01256
G3 X156.615 Y112.747 I-.339 J1.293 E.22411
G1 X156.702 Y112.714 E.00274
; WIPE_START
M204 S10000
G1 X156.78 Y112.69 E-.03107
G1 X157.053 Y112.645 E-.10538
G1 X157.3 Y112.652 E-.09376
G1 X157.471 Y112.686 E-.06651
G1 X157.637 Y112.742 E-.06628
G1 X157.939 Y112.917 E-.1327
G1 X158.187 Y113.164 E-.13314
G1 X158.359 Y113.463 E-.13116
; WIPE_END
G1 E-.04 F1800
G1 X150.768 Y114.258 Z4.8 F30000
G1 X115.395 Y117.959 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z4.8 F30000
G1 X160.79 Y118.893 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.249 E.01433
G1 X105.143 Y118.153 E.45039
G1 X104.801 Y118.153 E.01098
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.141 Y107.804 E.19056
G1 X102.128 Y107.804 E.0639
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07448
G1 X97.467 Y118.153 E.30023
G1 X97.125 Y118.153 E.01098
G1 X95.95 Y116.978 E.05344
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
M73 P78 R5
G1 X112.477 Y118.153 E.27532
G1 X112.819 Y118.153 E.01098
G1 X115.047 Y115.925 E.10132
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23843
G1 X107.816 Y107.804 E.0639
G1 X106.998 Y108.622 E.03723
G2 X105.499 Y108.108 I-1.435 J1.741 E.05208
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.859 Y107.804 E.05236
G1 X155.942 Y107.918 E.00454
G1 X155.789 Y108.173 E.00953
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409102
G1 F6554.121
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468874
G1 F5634.413
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.43605
G1 F6104.85
G3 X157.392 Y107.86 I.299 J5.921 E.01743
; LINE_WIDTH: 0.468381
G1 F5640.939
G3 X157.641 Y107.884 I-.247 J3.895 E.00841
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446935
G1 F5940.378
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409044
G1 F6555.17
G1 X157.808 Y108.158 E.00807
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.879 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.116615
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149393
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180253
G1 X157.358 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144949
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116592
G1 X157.584 Y112.077 E.00103
G1 X157.358 Y111.979 F30000
; LINE_WIDTH: 0.187182
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.86 Y112.006 E.00048
; LINE_WIDTH: 0.144847
G1 X156.833 Y112.02 E.00025
; LINE_WIDTH: 0.116583
G1 X156.666 Y112.077 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05076
G1 X153.953 Y113.573 E.05869
G1 X155.252 Y114.872 E.05905
G2 X156.232 Y115.852 I2.056 J-1.076 E.04526
G1 X158.533 Y118.153 E.10466
G1 X158.875 Y118.153 E.01098
G1 X160.05 Y116.978 E.05344
G1 X160.05 Y111.994 E.16027
G1 X158.975 Y110.919 E.04888
G2 X159.193 Y110.159 I-2.952 J-1.259 E.0255
G1 X160.05 Y109.302 E.03896
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/41
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z4.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X96.396 Y143.926
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X128.353 Y143.926 E1.02763
G1 X128.339 Y144.469 E.01748
G1 X95.602 Y144.469 E1.0527
G1 X95.602 Y133.421 E.35525
G1 X96.396 Y133.421 E.02553
G1 X96.396 Y143.866 E.33585
; WIPE_START
G1 X98.396 Y143.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.027 Y144.007 Z5 F30000
G1 X131.661 Y144.469 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5895.652
G1 X131.647 Y143.926 E.01748
G1 X160.398 Y143.926 E.92454
G1 X160.398 Y144.469 E.01748
G1 X131.721 Y144.469 E.92215
; WIPE_START
G1 X131.647 Y143.926 E-.20842
G1 X133.098 Y143.926 E-.55158
; WIPE_END
G1 E-.04 F1800
G1 X125.466 Y143.843 Z5 F30000
G1 X96.788 Y143.533 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.697 Y143.533 E.92067
G1 X128.097 Y143.533 E.01191
G1 F4196.468
G1 X128.497 Y143.533 E.01191
M106 S229.5
G1 F720
G1 X128.756 Y143.533 E.00771
M106 S224.4
G1 F6364.704
G1 X128.737 Y144.246 E.02124
G1 X128.736 Y144.284 E.00112
G1 X130.464 Y144.284 E.05146
G1 X130.864 Y144.284 E.01191
G1 F4670.209
G1 X131.264 Y144.284 E.01191
G1 F923.649
G1 X131.263 Y144.246 E.00112
M106 S229.5
G1 F720
G1 X131.244 Y143.533 E.02124
M106 S224.4
G1 F2640.781
G1 X131.503 Y143.533 E.00771
G1 F6364.704
G1 X131.903 Y143.533 E.01191
G1 X160.79 Y143.533 E.86044
G1 X160.79 Y144.861 E.03954
G1 X95.21 Y144.861 E1.9534
G1 X95.21 Y133.029 E.35243
G1 X160.79 Y133.029 E1.9534
G1 X160.79 Y133.607 E.0172
G1 X132.042 Y133.607 E.85629
M73 P78 R4
G1 X131.642 Y133.607 E.01191
G1 F5760
G1 X131.242 Y133.607 E.01191
M106 S229.5
G1 F1440
G1 X130.984 Y133.607 E.00771
M106 S224.4
G1 F3294.449
G1 X130.978 Y133.402 E.00611
G1 F3796.722
G1 X130.977 Y133.357 E.00133
G1 F6364.704
G1 X130.577 Y133.357 E.01191
G1 X129.423 Y133.357 E.03437
G1 X129.023 Y133.357 E.01191
G1 F1778.103
G1 X129.022 Y133.402 E.00133
M106 S229.5
G1 F1440
G1 X129.016 Y133.607 E.00611
M106 S224.4
G1 F3906.868
G1 X128.758 Y133.607 E.00771
G1 F6364.704
G1 X128.358 Y133.607 E.01191
G1 X96.788 Y133.607 E.94035
G1 X96.788 Y143.473 E.29389
M204 S10000
G1 X96.192 Y144.197 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.20201
G1 F15000
G1 X96.063 Y144.133 E.00181
; LINE_WIDTH: 0.24747
G1 F11733.073
G1 X95.935 Y144.068 E.00233
; LINE_WIDTH: 0.29293
G1 F9599.616
G1 X95.806 Y144.004 E.00285
G1 X160.194 Y144.197 F30000
; LINE_WIDTH: 0.17929
G1 F15000
G1 X131.857 Y144.197 E.30525
G1 X131.467 Y144.572 F30000
; LINE_WIDTH: 0.2282
G1 F12953.368
G1 X128.533 Y144.572 E.04295
G1 X128.143 Y144.197 F30000
; LINE_WIDTH: 0.17929
G1 F15000
G1 X96.192 Y144.197 E.34418
G1 X95.999 Y144.265 F30000
; LINE_WIDTH: 0.42972
G1 F6204.757
G1 X95.999 Y133.625 E.32512
G1 X96.592 Y133.318 F30000
; LINE_WIDTH: 0.22844
G1 F12936.611
G1 X128.828 Y133.318 E.47241
G1 X131.172 Y133.318 F30000
G1 F12936.611
G1 X160.594 Y133.318 E.43117
; WIPE_START
G1 X158.594 Y133.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.511 Y130.473 Z5 F30000
G1 X104.986 Y111.786 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.773 E.00079
G3 X105.489 Y108.456 I.67 J-1.594 E.14788
G3 X106.073 Y108.507 I.136 J1.833 E.01893
G3 X105.178 Y111.847 I-.439 J1.673 E.17527
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.516 Y108.847 I.517 J-1.233 E.1058
G3 X105.971 Y108.886 I.109 J1.416 E.01368
G3 X105.17 Y111.433 I-.34 J1.293 E.12889
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08942
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13317
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13253
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.0729
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z5 F30000
G1 X156.053 Y111.336 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.907 Y111.197 E.00649
G3 X156.989 Y108.256 I1.228 J-1.218 E.1261
G3 X157.573 Y108.307 I.136 J1.832 E.01893
G3 X156.104 Y111.367 I-.439 J1.673 E.19593
G1 X156.314 Y111.036 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.016 Y108.647 I.818 J-1.057 E.0954
G3 X157.471 Y108.686 I.109 J1.415 E.01368
G3 X156.362 Y111.072 I-.34 J1.293 E.13928
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15556
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.0736
; WIPE_END
G1 E-.04 F1800
G1 X155.413 Y113.73 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.463 Y113.533 E.00652
G3 X157.032 Y112.253 I1.67 J.446 E.06957
G3 X157.787 Y112.379 I.106 J1.692 E.02483
G3 X155.415 Y113.789 I-.655 J1.6 E.24645
G1 X155.807 Y113.806 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.059 Y112.645 I1.325 J.174 E.05516
G3 X157.471 Y112.686 I.063 J1.436 E.0124
G3 X155.801 Y113.865 I-.339 J1.293 E.18079
; WIPE_START
M204 S10000
G1 X155.889 Y113.467 E-.15504
G1 X156.063 Y113.164 E-.13267
G1 X156.179 Y113.033 E-.06672
G1 X156.311 Y112.917 E-.06671
G1 X156.613 Y112.742 E-.13268
G1 X156.779 Y112.686 E-.06628
G1 X157.059 Y112.645 E-.10768
G1 X157.144 Y112.647 E-.03222
; WIPE_END
G1 E-.04 F1800
G1 X149.572 Y113.61 Z5 F30000
G1 X115.395 Y117.959 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
M73 P79 R4
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z5 F30000
G1 X160.79 Y118.893 Z5
G1 Z4.6
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03445
G1 X155.789 Y108.173 E.00598
G1 X155.942 Y107.919 E.00953
G1 X155.859 Y107.804 E.00454
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409167
G1 F6552.965
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468857
G1 F5634.637
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436036
G1 F6105.081
G3 X157.392 Y107.86 I.299 J5.927 E.01743
; LINE_WIDTH: 0.468371
G1 F5641.08
G3 X157.641 Y107.884 I-.244 J3.867 E.00841
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447036
G1 F5938.89
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409196
G1 F6552.436
G1 X157.808 Y108.158 E.00808
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03896
G3 X158.975 Y110.919 I-3.17 J-.499 E.0255
G1 X160.05 Y111.994 E.04888
G1 X160.05 Y116.978 E.16027
G1 X158.875 Y118.153 E.05344
G1 X158.533 Y118.153 E.01098
G1 X156.232 Y115.852 E.10466
G3 X155.252 Y114.872 I1.075 J-2.055 E.04526
G1 X153.953 Y113.573 E.05905
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05076
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116601
G1 F15000
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146228
G1 X156.863 Y111.953 E.00028
; LINE_WIDTH: 0.187359
G1 X156.892 Y111.979 E.00045
G1 X157.357 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.180148
G1 F15000
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144881
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116598
G1 X157.584 Y112.077 E.00103
G1 X157.584 Y111.88 F30000
; LINE_WIDTH: 0.116577
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149257
G1 X157.38 Y111.958 E.00036
; WIPE_START
G1 X157.417 Y111.937 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.805 Y111.375 Z5 F30000
G1 X105.499 Y108.108 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.065 J2.252 E.05208
G1 X107.816 Y107.804 E.03723
G1 X109.804 Y107.804 E.0639
G1 X115.047 Y113.047 E.23843
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10132
G1 X112.477 Y118.153 E.01098
G1 X106.423 Y112.099 E.27532
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05344
G1 X97.467 Y118.153 E.01098
G1 X104.069 Y111.551 E.30023
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.0717
G1 X100.141 Y107.804 E.0639
G1 X95.95 Y111.994 E.19056
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01098
G1 X115.047 Y108.249 E.45039
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.249 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/41
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X96.396 Y143.922
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X128.653 Y143.922 E1.03728
G1 X128.639 Y144.465 E.01748
G1 X95.602 Y144.465 E1.06235
G1 X95.602 Y133.418 E.35525
G1 X96.396 Y133.418 E.02553
G1 X96.396 Y143.862 E.33585
; WIPE_START
G1 X98.396 Y143.866 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.027 Y144.005 Z5.2 F30000
G1 X131.361 Y144.465 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F5895.652
G1 X131.347 Y143.922 E.01748
G1 X160.398 Y143.922 E.93418
G1 X160.398 Y144.465 E.01747
G1 X131.421 Y144.465 E.9318
; WIPE_START
G1 X131.347 Y143.922 E-.20842
G1 X132.798 Y143.922 E-.55158
; WIPE_END
G1 E-.04 F1800
G1 X125.166 Y143.839 Z5.2 F30000
G1 X96.788 Y143.53 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.997 Y143.53 E.92961
G1 X128.397 Y143.53 E.01191
G1 F4196.468
G1 X128.797 Y143.53 E.01191
M106 S229.5
G1 F720
G1 X129.056 Y143.53 E.00771
M106 S224.4
G1 F6364.704
G1 X129.037 Y144.243 E.02124
G1 X129.036 Y144.28 E.00112
G1 X130.164 Y144.28 E.03359
G1 X130.564 Y144.28 E.01191
G1 F4670.209
G1 X130.964 Y144.28 E.01191
G1 F923.649
G1 X130.963 Y144.243 E.00112
M106 S229.5
G1 F720
G1 X130.944 Y143.53 E.02124
M106 S224.4
G1 F2640.976
G1 X131.203 Y143.53 E.00771
G1 F6364.704
G1 X131.603 Y143.53 E.01191
G1 X160.79 Y143.53 E.86938
G1 X160.79 Y144.858 E.03954
G1 X95.21 Y144.858 E1.9534
G1 X95.21 Y133.026 E.35243
G1 X160.79 Y133.026 E1.9534
G1 X160.79 Y133.603 E.01721
G1 X131.742 Y133.603 E.86523
G1 X131.342 Y133.603 E.01191
G1 F5760
G1 X130.942 Y133.603 E.01191
M106 S229.5
G1 F1440
G1 X130.684 Y133.603 E.00771
M106 S224.4
G1 F3294.885
G1 X130.678 Y133.398 E.00611
G1 F3797.19
G1 X130.677 Y133.354 E.00133
G1 F6364.704
G1 X130.277 Y133.354 E.01191
G1 X129.323 Y133.354 E.02842
G1 F1778.103
G1 X129.322 Y133.398 E.00133
M106 S229.5
G1 F1440
G1 X129.316 Y133.603 E.00611
M106 S224.4
G1 F3907.106
G1 X129.058 Y133.603 E.00771
G1 F6364.704
G1 X128.658 Y133.603 E.01191
G1 X96.788 Y133.603 E.94929
G1 X96.788 Y143.47 E.29389
M204 S10000
G1 X96.192 Y144.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.202007
G1 F15000
G1 X96.063 Y144.129 E.00181
; LINE_WIDTH: 0.24746
G1 F11733.646
G1 X95.935 Y144.065 E.00233
; LINE_WIDTH: 0.292914
G1 F9600.256
G1 X95.806 Y144 E.00285
G1 X160.194 Y144.194 F30000
; LINE_WIDTH: 0.17928
G1 F15000
G1 X131.557 Y144.194 E.30846
G1 X131.167 Y144.569 F30000
; LINE_WIDTH: 0.22818
G1 F12954.767
G1 X128.832 Y144.569 E.03417
G1 X128.443 Y144.194 F30000
; LINE_WIDTH: 0.17928
G1 F15000
G1 X96.192 Y144.194 E.34738
G1 X95.999 Y144.262 F30000
; LINE_WIDTH: 0.42972
G1 F6204.757
G1 X95.999 Y133.621 E.32512
G1 X96.592 Y133.315 F30000
; LINE_WIDTH: 0.22852
G1 F12931.035
G1 X129.128 Y133.315 E.47701
G1 X130.872 Y133.315 F30000
G1 F12931.035
G1 X160.594 Y133.315 E.43575
; WIPE_START
G1 X158.594 Y133.315 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.511 Y130.47 Z5.2 F30000
G1 X104.986 Y111.786 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.965 Y111.774 E.00079
G3 X105.484 Y108.457 I.67 J-1.594 E.14772
G3 X106.073 Y108.507 I.141 J1.834 E.01911
G3 X105.178 Y111.847 I-.439 J1.673 E.17526
G1 X105.043 Y111.804 E.00455
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.51 Y108.848 I.517 J-1.233 E.10565
G3 X105.971 Y108.886 I.114 J1.418 E.01385
G3 X105.17 Y111.434 I-.34 J1.293 E.12888
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08943
G1 X104.811 Y111.24 E-.06616
G1 X104.563 Y110.993 E-.13315
G1 X104.389 Y110.69 E-.13268
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07288
; WIPE_END
G1 E-.04 F1800
G1 X111.976 Y110.077 Z5.2 F30000
G1 X156.484 Y111.585 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.465 Y111.573 E.00074
G3 X156.984 Y108.257 I.67 J-1.594 E.14772
G3 X157.573 Y108.307 I.141 J1.834 E.01911
G3 X156.678 Y111.647 I-.439 J1.673 E.17526
M73 P80 R4
G1 X156.541 Y111.603 E.0046
G1 X156.951 Y111.304 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.01 Y108.648 I.18 J-1.324 E.11607
G3 X157.471 Y108.686 I.114 J1.417 E.01385
G3 X157.011 Y111.31 I-.34 J1.293 E.11846
; WIPE_START
M204 S10000
G1 X156.613 Y111.215 E-.15524
G1 X156.456 Y111.137 E-.06679
G1 X156.311 Y111.04 E-.06615
G1 X156.063 Y110.793 E-.13316
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.1328
G1 X155.788 Y109.978 E-.06629
G1 X155.789 Y109.96 E-.00689
; WIPE_END
G1 E-.04 F1800
G1 X155.413 Y113.73 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.464 Y113.533 E.00652
G3 X157.038 Y112.253 I1.67 J.446 E.06971
G3 X157.573 Y112.307 I.084 J1.859 E.01736
G3 X155.416 Y113.788 I-.438 J1.672 E.2539
G1 X155.807 Y113.805 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.064 Y112.644 I1.325 J.174 E.05534
G3 X157.471 Y112.686 I.056 J1.446 E.01223
G3 X155.8 Y113.865 I-.339 J1.293 E.18079
; WIPE_START
M204 S10000
G1 X155.889 Y113.467 E-.15505
G1 X156.063 Y113.164 E-.13268
G1 X156.179 Y113.033 E-.0667
G1 X156.311 Y112.917 E-.06672
G1 X156.613 Y112.742 E-.13268
G1 X156.779 Y112.686 E-.0663
G1 X157.064 Y112.644 E-.1098
G1 X157.144 Y112.647 E-.03009
; WIPE_END
G1 E-.04 F1800
G1 X149.572 Y113.61 Z5.2 F30000
G1 X115.395 Y117.959 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z5.2 F30000
G1 X160.79 Y118.893 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.249 E.01433
G1 X105.143 Y118.153 E.45039
G1 X104.801 Y118.153 E.01098
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.141 Y107.804 E.19056
G1 X102.128 Y107.804 E.0639
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07448
G1 X97.467 Y118.153 E.30023
G1 X97.125 Y118.153 E.01098
G1 X95.95 Y116.978 E.05344
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27532
G1 X112.819 Y118.153 E.01098
G1 X115.047 Y115.925 E.10132
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23843
G1 X107.816 Y107.804 E.0639
G1 X106.998 Y108.622 E.03723
G2 X105.499 Y108.109 I-1.432 J1.735 E.05207
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.859 Y107.804 E.05236
G1 X155.942 Y107.919 E.00454
G1 X155.789 Y108.172 E.00952
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.715 E.03446
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409216
G1 F6552.083
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468864
G1 F5634.543
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436036
G1 F6105.075
G3 X157.392 Y107.86 I.299 J5.925 E.01743
; LINE_WIDTH: 0.468373
G1 F5641.047
G3 X157.641 Y107.884 I-.24 J3.822 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447036
G1 F5938.899
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409201
G1 F6552.348
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.116585
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149286
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180166
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144892
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116607
G1 X157.584 Y112.078 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187181
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.86 Y112.006 E.00048
; LINE_WIDTH: 0.144781
G1 X156.833 Y112.02 E.00025
; LINE_WIDTH: 0.116572
G1 X156.666 Y112.077 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05076
G1 X153.953 Y113.573 E.05869
G1 X155.252 Y114.872 E.05905
G2 X156.232 Y115.852 I2.055 J-1.075 E.04526
G1 X158.533 Y118.153 E.10466
G1 X158.875 Y118.153 E.01098
G1 X160.05 Y116.978 E.05344
G1 X160.05 Y111.994 E.16027
G1 X158.975 Y110.919 E.04888
G2 X159.193 Y110.159 I-2.952 J-1.259 E.0255
G1 X160.05 Y109.302 E.03896
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/41
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
M106 S221.85
G17
G3 Z5.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X96.396 Y143.919
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X128.953 Y143.919 E1.04692
G1 X128.939 Y144.462 E.01748
G1 X95.602 Y144.462 E1.07199
G1 X95.602 Y139.612 E.15597
G1 X96.396 Y139.612 E.02553
G1 X96.396 Y143.859 E.13656
; WIPE_START
G1 X98.396 Y143.862 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.027 Y144.002 Z5.4 F30000
G1 X131.061 Y144.462 Z5.4
G1 Z5
G1 E.8 F1800
G1 F5895.652
G1 X131.047 Y143.919 E.01748
G1 X160.398 Y143.919 E.94383
G1 X160.398 Y144.462 E.01747
G1 X131.121 Y144.462 E.94144
; WIPE_START
G1 X131.047 Y143.919 E-.20842
G1 X132.498 Y143.919 E-.55158
; WIPE_END
G1 E-.04 F1800
G1 X124.866 Y143.835 Z5.4 F30000
G1 X96.788 Y143.526 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X128.297 Y143.526 E.93854
G1 X128.697 Y143.526 E.01191
G1 F4196.468
G1 X129.097 Y143.526 E.01191
M106 S229.5
G1 F720
G1 X129.356 Y143.526 E.00771
M106 S221.85
G1 F6364.704
G1 X129.337 Y144.239 E.02124
G1 X129.336 Y144.277 E.00112
G1 X130.264 Y144.277 E.02764
G1 F4670.209
G1 X130.664 Y144.277 E.01191
G1 F923.649
G1 X130.663 Y144.239 E.00112
M106 S229.5
G1 F720
G1 X130.644 Y143.526 E.02124
M106 S221.85
G1 F2640.976
G1 X130.903 Y143.526 E.00771
G1 F6364.704
G1 X131.303 Y143.526 E.01191
G1 X160.79 Y143.526 E.87831
G1 X160.79 Y144.854 E.03954
G1 X95.21 Y144.854 E1.9534
G1 X95.21 Y133.022 E.35243
G1 X160.79 Y133.022 E1.9534
G1 X160.79 Y133.6 E.01721
G1 X131.442 Y133.6 E.87416
G1 X131.042 Y133.6 E.01191
G1 F5760
G1 X130.642 Y133.6 E.01191
M106 S229.5
G1 F1440
G1 X130.384 Y133.6 E.00771
M106 S221.85
G1 F3295.429
G1 X130.378 Y133.395 E.00611
G1 F3797.774
G1 X130.377 Y133.351 E.00133
G1 F6364.704
G1 X129.623 Y133.351 E.02246
G1 F1778.103
G1 X129.622 Y133.395 E.00133
M106 S229.5
G1 F1440
G1 X129.616 Y133.6 E.00611
M106 S221.85
G1 F3906.868
G1 X129.358 Y133.6 E.00771
G1 F6364.704
G1 X128.958 Y133.6 E.01191
G1 X96.788 Y133.6 E.95822
G1 X96.788 Y143.466 E.29389
M204 S10000
G1 X96.192 Y144.19 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.202007
G1 F15000
G1 X96.063 Y144.126 E.00181
; LINE_WIDTH: 0.24746
G1 F11733.646
G1 X95.935 Y144.061 E.00233
; LINE_WIDTH: 0.292914
G1 F9600.256
G1 X95.806 Y143.997 E.00285
G1 X95.999 Y144.258 F30000
; LINE_WIDTH: 0.42972
G1 F6204.757
G1 X95.999 Y139.815 E.13576
G1 X96.192 Y144.19 F30000
; LINE_WIDTH: 0.17928
G1 F15000
G1 X128.742 Y144.19 E.35061
G1 X129.132 Y144.565 F30000
; LINE_WIDTH: 0.22816
G1 F12956.165
G1 X130.868 Y144.565 E.02539
G1 X131.258 Y144.19 F30000
; LINE_WIDTH: 0.17928
G1 F15000
G1 X160.194 Y144.19 E.31169
; WIPE_START
G1 X158.194 Y144.19 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.838 Y136.737 Z5.4 F30000
G1 X160.594 Y133.311 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.22861
G1 F12924.767
G1 X130.572 Y133.311 E.44037
; WIPE_START
G1 X132.572 Y133.311 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P81 R4
G1 X129.428 Y133.311 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F12924.767
G1 X96.607 Y133.311 E.48142
G1 X96.035 Y133.23 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S2000
G1 X96.581 Y133.775 E.02298
G1 X96.581 Y134.308
G1 X95.502 Y133.23 E.04544
G1 X95.417 Y133.678
G1 X96.581 Y134.842 E.049
G1 X96.581 Y135.375
G1 X95.417 Y134.212 E.049
G1 X95.417 Y134.745
G1 X96.581 Y135.908 E.049
G1 X96.581 Y136.441
G1 X95.417 Y135.278 E.049
G1 X95.417 Y135.811
G1 X96.581 Y136.975 E.049
G1 X96.581 Y137.508
G1 X95.417 Y136.345 E.049
G1 X95.417 Y136.878
G1 X96.581 Y138.041 E.049
G1 X96.581 Y138.574
G1 X95.417 Y137.411 E.049
G1 X95.417 Y137.944
G1 X96.581 Y139.108 E.049
G1 X96.329 Y139.389
G1 X95.417 Y138.478 E.03839
G1 X95.417 Y139.011
G1 X95.796 Y139.389 E.01593
; WIPE_START
M204 S10000
G1 X95.417 Y139.011 E-.20324
G1 X95.417 Y138.478 E-.20264
G1 X96.076 Y139.137 E-.35413
; WIPE_END
G1 E-.04 F1800
G1 X98.44 Y131.88 Z5.4 F30000
G1 X104.986 Y111.786 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.964 Y111.774 E.00079
G3 X105.478 Y108.457 I.669 J-1.594 E.14757
G3 X106.073 Y108.507 I.146 J1.836 E.01929
G3 X105.178 Y111.847 I-.439 J1.672 E.17525
G1 X105.043 Y111.804 E.00455
G1 X105.114 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.505 Y108.848 I.517 J-1.233 E.10552
G3 X105.971 Y108.886 I.119 J1.421 E.01402
G3 X105.17 Y111.434 I-.34 J1.293 E.12887
; WIPE_START
M204 S10000
G1 X104.956 Y111.337 E-.08943
G1 X104.811 Y111.24 E-.06614
G1 X104.563 Y110.993 E-.13316
G1 X104.389 Y110.69 E-.13269
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06658
G1 X104.348 Y109.818 E-.07289
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.042 Z5.4 F30000
G1 X156.053 Y111.336 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.906 Y111.197 E.00649
G3 X156.978 Y108.257 I1.228 J-1.218 E.12578
G3 X157.573 Y108.307 I.146 J1.836 E.01929
G3 X156.103 Y111.368 I-.439 J1.672 E.19591
G1 X156.314 Y111.037 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X157.005 Y108.648 I.818 J-1.058 E.09512
G3 X157.471 Y108.686 I.119 J1.421 E.01402
G3 X156.362 Y111.072 I-.34 J1.293 E.13926
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15559
G1 X155.889 Y110.49 E-.13267
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.299 E-.07357
; WIPE_END
G1 E-.04 F1800
G1 X156.718 Y112.301 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.043 Y112.253 E.01057
G3 X157.573 Y112.307 I.077 J1.867 E.01718
G3 X156.66 Y112.317 I-.439 J1.672 E.31963
G1 X156.745 Y112.697 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.779 Y112.69 E.00104
G3 X157.07 Y112.644 I.352 J1.289 E.00878
G3 X157.471 Y112.686 I.049 J1.459 E.01206
G3 X156.615 Y112.746 I-.34 J1.293 E.22413
G1 X156.689 Y112.719 E.00236
; WIPE_START
M204 S10000
G1 X156.779 Y112.69 E-.03605
G1 X157.07 Y112.644 E-.11178
G1 X157.3 Y112.652 E-.08738
G1 X157.471 Y112.686 E-.06652
G1 X157.637 Y112.742 E-.06628
G1 X157.939 Y112.917 E-.13269
G1 X158.187 Y113.164 E-.13314
G1 X158.353 Y113.452 E-.12616
; WIPE_END
G1 E-.04 F1800
G1 X150.762 Y114.248 Z5.4 F30000
G1 X115.395 Y117.959 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z5.4 F30000
G1 X160.79 Y118.893 Z5.4
G1 Z5
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.591 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X155.258 Y109.072 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X155.949 Y108.268 I1.873 J.911 E.03446
G1 X155.789 Y108.173 E.00598
G1 X155.942 Y107.919 E.00952
G1 X155.859 Y107.804 E.00454
G1 X154.231 Y107.804 E.05236
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.408979
G1 F6556.321
G1 X156.586 Y107.919 E.00807
; LINE_WIDTH: 0.46884
G1 F5634.865
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436035
G1 F6105.082
G3 X157.392 Y107.86 I.299 J5.927 E.01743
; LINE_WIDTH: 0.468366
G1 F5641.149
G3 X157.641 Y107.884 I-.245 J3.869 E.0084
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446913
G1 F5940.705
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409029
G1 F6555.433
G1 X157.808 Y108.158 E.00807
G1 X159.92 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X160.05 Y107.804 E.00418
G1 X160.05 Y109.302 E.04818
G1 X159.193 Y110.159 E.03896
G3 X158.975 Y110.919 I-3.171 J-.499 E.0255
G1 X160.05 Y111.994 E.04888
G1 X160.05 Y116.978 E.16027
G1 X158.875 Y118.153 E.05344
G1 X158.533 Y118.153 E.01098
G1 X156.232 Y115.852 E.10466
G3 X155.252 Y114.872 I1.076 J-2.055 E.04525
G1 X153.953 Y113.573 E.05905
G1 X153.953 Y115.399 E.05869
G1 X155.069 Y114.283 E.05076
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116584
G1 F15000
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146188
G1 X156.863 Y111.953 E.00028
; LINE_WIDTH: 0.187354
G1 X156.892 Y111.979 E.00045
G1 X157.358 Y111.979 E.00531
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.18017
G1 F15000
G1 X157.358 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.14489
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116599
G1 X157.584 Y112.077 E.00103
G1 X157.584 Y111.88 F30000
; LINE_WIDTH: 0.1166
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149279
G1 X157.38 Y111.958 E.00036
; WIPE_START
G1 X157.417 Y111.937 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.805 Y111.375 Z5.4 F30000
G1 X105.499 Y108.107 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G3 X106.998 Y108.622 I.125 J2.072 E.05228
G1 X107.816 Y107.804 E.03723
G1 X109.804 Y107.804 E.0639
G1 X115.047 Y113.047 E.23843
G1 X115.047 Y115.925 E.09257
G1 X112.819 Y118.153 E.10132
G1 X112.477 Y118.153 E.01098
G1 X106.423 Y112.099 E.27532
G2 X107.546 Y110.976 I-.982 J-2.105 E.05212
G1 X95.95 Y115.35 F30000
G1 F5895.652
G1 X95.95 Y116.978 E.05236
G1 X97.125 Y118.153 E.05344
G1 X97.467 Y118.153 E.01098
G1 X104.069 Y111.551 E.30023
G3 X103.704 Y109.38 I1.661 J-1.395 E.07425
G1 X102.128 Y107.804 E.0717
G1 X100.141 Y107.804 E.0639
G1 X95.95 Y111.994 E.19056
G1 X95.95 Y109.302 E.08656
G1 X104.801 Y118.153 E.40251
G1 X105.143 Y118.153 E.01098
G1 X115.047 Y108.249 E.45039
G1 X115.047 Y107.804 E.01433
G1 X113.864 Y107.804 E.03803
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X115.047 Y107.804 E-.4494
G1 X115.047 Y108.249 E-.16936
G1 X114.784 Y108.512 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/41
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
M106 S226.95
G17
G3 Z5.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X96.788 Y143.523
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6143
M204 S5000
G1 X128.597 Y143.523 E.94748
G1 X128.997 Y143.523 E.01191
G1 F4196.468
G1 X129.397 Y143.523 E.01191
M106 S229.5
G1 F720
G1 X129.656 Y143.523 E.00771
M106 S226.95
G1 F6143
G1 X129.637 Y144.236 E.02124
G1 X129.636 Y144.273 E.00112
G1 X130.364 Y144.273 E.02169
G1 F923.65
G1 X130.363 Y144.236 E.00112
M106 S229.5
G1 F720
G1 X130.344 Y143.523 E.02124
M106 S226.95
G1 F2640.976
G1 X130.603 Y143.523 E.00771
G1 F6143
G1 X131.003 Y143.523 E.01191
G1 X160.79 Y143.523 E.88725
G1 X160.79 Y144.851 E.03954
G1 X95.21 Y144.851 E1.9534
G1 X95.21 Y138.744 E.1819
G1 X96.788 Y138.744 E.047
G1 X96.788 Y143.463 E.14057
; WIPE_START
G1 F6364.704
M204 S10000
G1 X98.788 Y143.467 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.415 Y143.765 Z5.6 F30000
G1 X128.821 Y144.643 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6143
M204 S2000
G1 X129.435 Y144.029 E.02587
G1 X129.2 Y143.73
G1 X128.287 Y144.643 E.03845
G1 X127.754 Y144.643
G1 X128.667 Y143.73 E.03845
G1 X128.134 Y143.73
G1 X127.221 Y144.643 E.03845
G1 X126.688 Y144.643
G1 X127.6 Y143.73 E.03845
G1 X127.067 Y143.73
G1 X126.154 Y144.643 E.03845
G1 X125.621 Y144.643
G1 X126.534 Y143.73 E.03845
G1 X126.001 Y143.73
G1 X125.088 Y144.643 E.03845
G1 X124.555 Y144.643
G1 X125.467 Y143.73 E.03845
G1 X124.934 Y143.73
G1 X124.021 Y144.643 E.03845
G1 X123.488 Y144.643
G1 X124.401 Y143.73 E.03845
G1 X123.868 Y143.73
G1 X122.955 Y144.643 E.03845
G1 X122.422 Y144.643
G1 X123.334 Y143.73 E.03845
G1 X122.801 Y143.73
G1 X121.888 Y144.643 E.03845
G1 X121.355 Y144.643
G1 X122.268 Y143.73 E.03845
G1 X121.735 Y143.73
G1 X120.822 Y144.643 E.03845
G1 X120.289 Y144.643
G1 X121.201 Y143.73 E.03845
G1 X120.668 Y143.73
G1 X119.755 Y144.643 E.03845
G1 X119.222 Y144.643
G1 X120.135 Y143.73 E.03845
G1 X119.602 Y143.73
G1 X118.689 Y144.643 E.03845
G1 X118.156 Y144.643
G1 X119.068 Y143.73 E.03845
G1 X118.535 Y143.73
G1 X117.622 Y144.643 E.03845
G1 X117.089 Y144.643
G1 X118.002 Y143.73 E.03845
G1 X117.469 Y143.73
G1 X116.556 Y144.643 E.03845
G1 X116.023 Y144.643
G1 X116.935 Y143.73 E.03845
G1 X116.402 Y143.73
G1 X115.489 Y144.643 E.03845
G1 X114.956 Y144.643
G1 X115.869 Y143.73 E.03845
G1 X115.336 Y143.73
G1 X114.423 Y144.643 E.03845
G1 X113.889 Y144.643
G1 X114.802 Y143.73 E.03845
M73 P82 R4
G1 X114.269 Y143.73
G1 X113.356 Y144.643 E.03845
G1 X112.823 Y144.643
G1 X113.736 Y143.73 E.03845
G1 X113.202 Y143.73
G1 X112.29 Y144.643 E.03845
G1 X111.756 Y144.643
G1 X112.669 Y143.73 E.03845
G1 X112.136 Y143.73
G1 X111.223 Y144.643 E.03845
G1 X110.69 Y144.643
G1 X111.603 Y143.73 E.03845
G1 X111.069 Y143.73
G1 X110.157 Y144.643 E.03845
G1 X109.623 Y144.643
G1 X110.536 Y143.73 E.03845
G1 X110.003 Y143.73
G1 X109.09 Y144.643 E.03845
G1 X108.557 Y144.643
G1 X109.47 Y143.73 E.03845
G1 X108.936 Y143.73
G1 X108.024 Y144.643 E.03845
G1 X107.49 Y144.643
G1 X108.403 Y143.73 E.03845
G1 X107.87 Y143.73
G1 X106.957 Y144.643 E.03845
G1 X106.424 Y144.643
G1 X107.337 Y143.73 E.03845
G1 X106.803 Y143.73
G1 X105.891 Y144.643 E.03845
G1 X105.357 Y144.643
G1 X106.27 Y143.73 E.03845
G1 X105.737 Y143.73
G1 X104.824 Y144.643 E.03845
G1 X104.291 Y144.643
G1 X105.204 Y143.73 E.03845
G1 X104.67 Y143.73
G1 X103.758 Y144.643 E.03845
G1 X103.224 Y144.643
G1 X104.137 Y143.73 E.03845
G1 X103.604 Y143.73
G1 X102.691 Y144.643 E.03845
G1 X102.158 Y144.643
G1 X103.071 Y143.73 E.03845
G1 X102.537 Y143.73
G1 X101.625 Y144.643 E.03845
G1 X101.091 Y144.643
G1 X102.004 Y143.73 E.03845
G1 X101.471 Y143.73
G1 X100.558 Y144.643 E.03845
G1 X100.025 Y144.643
G1 X100.938 Y143.73 E.03845
G1 X100.404 Y143.73
G1 X99.492 Y144.643 E.03845
G1 X98.958 Y144.643
G1 X99.871 Y143.73 E.03845
G1 X99.338 Y143.73
G1 X98.425 Y144.643 E.03845
G1 X97.892 Y144.643
G1 X98.805 Y143.73 E.03845
G1 X98.271 Y143.73
G1 X97.359 Y144.643 E.03845
G1 X96.825 Y144.643
G1 X97.738 Y143.73 E.03845
G1 X97.205 Y143.73
G1 X96.292 Y144.643 E.03845
G1 X95.759 Y144.643
G1 X96.672 Y143.73 E.03845
G1 X96.581 Y143.288
G1 X95.417 Y144.451 E.049
G1 X95.417 Y143.918
G1 X96.581 Y142.755 E.049
G1 X96.581 Y142.221
G1 X95.417 Y143.385 E.049
G1 X95.417 Y142.851
G1 X96.581 Y141.688 E.049
G1 X96.581 Y141.155
G1 X95.417 Y142.318 E.049
G1 X95.417 Y141.785
G1 X96.581 Y140.622 E.049
G1 X96.581 Y140.088
G1 X95.417 Y141.252 E.049
G1 X95.417 Y140.718
G1 X96.581 Y139.555 E.049
G1 X96.581 Y139.022
G1 X95.417 Y140.185 E.049
G1 X95.417 Y139.652
G1 X96.118 Y138.951 E.02951
; WIPE_START
G1 F6364.704
M204 S10000
G1 X95.417 Y139.652 E-.37653
G1 X95.417 Y140.185 E-.20264
G1 X95.754 Y139.849 E-.18084
; WIPE_END
G1 E-.04 F1800
G1 X95.732 Y144.617 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133566
G1 F6143
G1 X95.399 Y144.617 E.00239
; WIPE_START
G1 F15000
G1 X95.732 Y144.617 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.365 Y144.604 Z5.6 F30000
G1 X129.447 Y144.562 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.22814
G1 F6143
G1 X130.553 Y144.562 E.01617
; WIPE_START
G1 F12957.565
G1 X129.447 Y144.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.077 Y144.378 Z5.6 F30000
G1 X160.583 Y143.81 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6143
M204 S2000
G1 X159.75 Y144.643 E.03509
G1 X159.216 Y144.643
G1 X160.129 Y143.73 E.03845
G1 X159.596 Y143.73
G1 X158.683 Y144.643 E.03845
G1 X158.15 Y144.643
G1 X159.063 Y143.73 E.03845
G1 X158.529 Y143.73
G1 X157.617 Y144.643 E.03845
G1 X157.083 Y144.643
G1 X157.996 Y143.73 E.03845
G1 X157.463 Y143.73
G1 X156.55 Y144.643 E.03845
G1 X156.017 Y144.643
G1 X156.93 Y143.73 E.03845
G1 X156.396 Y143.73
G1 X155.484 Y144.643 E.03845
G1 X154.95 Y144.643
G1 X155.863 Y143.73 E.03845
G1 X155.33 Y143.73
G1 X154.417 Y144.643 E.03845
G1 X153.884 Y144.643
G1 X154.797 Y143.73 E.03845
G1 X154.263 Y143.73
G1 X153.351 Y144.643 E.03845
G1 X152.817 Y144.643
G1 X153.73 Y143.73 E.03845
G1 X153.197 Y143.73
G1 X152.284 Y144.643 E.03845
G1 X151.751 Y144.643
G1 X152.664 Y143.73 E.03845
G1 X152.13 Y143.73
G1 X151.218 Y144.643 E.03845
G1 X150.684 Y144.643
G1 X151.597 Y143.73 E.03845
G1 X151.064 Y143.73
G1 X150.151 Y144.643 E.03845
G1 X149.618 Y144.643
G1 X150.531 Y143.73 E.03845
G1 X149.997 Y143.73
G1 X149.084 Y144.643 E.03845
G1 X148.551 Y144.643
G1 X149.464 Y143.73 E.03845
G1 X148.931 Y143.73
G1 X148.018 Y144.643 E.03845
G1 X147.485 Y144.643
G1 X148.397 Y143.73 E.03845
G1 X147.864 Y143.73
G1 X146.951 Y144.643 E.03845
G1 X146.418 Y144.643
G1 X147.331 Y143.73 E.03845
G1 X146.798 Y143.73
G1 X145.885 Y144.643 E.03845
G1 X145.352 Y144.643
G1 X146.264 Y143.73 E.03845
G1 X145.731 Y143.73
G1 X144.818 Y144.643 E.03845
G1 X144.285 Y144.643
G1 X145.198 Y143.73 E.03845
G1 X144.665 Y143.73
G1 X143.752 Y144.643 E.03845
G1 X143.219 Y144.643
G1 X144.131 Y143.73 E.03845
G1 X143.598 Y143.73
G1 X142.685 Y144.643 E.03845
G1 X142.152 Y144.643
G1 X143.065 Y143.73 E.03845
G1 X142.532 Y143.73
G1 X141.619 Y144.643 E.03845
G1 X141.086 Y144.643
G1 X141.998 Y143.73 E.03845
G1 X141.465 Y143.73
G1 X140.552 Y144.643 E.03845
G1 X140.019 Y144.643
G1 X140.932 Y143.73 E.03845
G1 X140.399 Y143.73
G1 X139.486 Y144.643 E.03845
G1 X138.953 Y144.643
G1 X139.865 Y143.73 E.03845
G1 X139.332 Y143.73
G1 X138.419 Y144.643 E.03845
G1 X137.886 Y144.643
G1 X138.799 Y143.73 E.03845
G1 X138.266 Y143.73
G1 X137.353 Y144.643 E.03845
G1 X136.82 Y144.643
G1 X137.732 Y143.73 E.03845
G1 X137.199 Y143.73
G1 X136.286 Y144.643 E.03845
G1 X135.753 Y144.643
G1 X136.666 Y143.73 E.03845
G1 X136.133 Y143.73
G1 X135.22 Y144.643 E.03845
G1 X134.687 Y144.643
G1 X135.599 Y143.73 E.03845
G1 X135.066 Y143.73
G1 X134.153 Y144.643 E.03845
G1 X133.62 Y144.643
G1 X134.533 Y143.73 E.03845
G1 X134 Y143.73
G1 X133.087 Y144.643 E.03845
G1 X132.554 Y144.643
G1 X133.466 Y143.73 E.03845
G1 X132.933 Y143.73
G1 X132.02 Y144.643 E.03845
G1 X131.487 Y144.643
G1 X132.4 Y143.73 E.03845
G1 X131.867 Y143.73
G1 X130.954 Y144.643 E.03845
G1 X130.577 Y144.486
G1 X131.333 Y143.73 E.03185
; WIPE_START
G1 F6364.704
M204 S10000
G1 X130.577 Y144.486 E-.40634
G1 X130.954 Y144.643 E-.155
G1 X131.323 Y144.273 E-.19866
; WIPE_END
G1 E-.04 F1800
G1 X126.517 Y138.345 Z5.6 F30000
G1 X104.983 Y111.785 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.964 Y111.774 E.0007
G3 X105.472 Y108.457 I.669 J-1.595 E.14742
G3 X106.073 Y108.507 I.151 J1.838 E.01947
G3 X105.178 Y111.847 I-.44 J1.672 E.17523
G1 X105.04 Y111.803 E.00464
G1 X105.115 Y111.41 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6143
M204 S5000
G3 X105.499 Y108.849 I.519 J-1.232 E.10515
G3 X105.8 Y108.852 I.138 J1.104 E.00899
G3 X105.171 Y111.432 I-.165 J1.327 E.13428
; WIPE_START
G1 F6364.704
M204 S10000
G1 X104.811 Y111.24 E-.15505
G1 X104.679 Y111.124 E-.06671
G1 X104.563 Y110.993 E-.06669
G1 X104.389 Y110.69 E-.13269
G1 X104.298 Y110.353 E-.13253
G1 X104.287 Y110.178 E-.06659
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07315
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.046 Z5.6 F30000
G1 X156.092 Y111.366 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.075 Y111.347 E.00081
G3 X156.972 Y108.257 I1.058 J-1.368 E.1329
G3 X157.573 Y108.307 I.151 J1.838 E.01947
G3 X156.262 Y111.473 I-.44 J1.672 E.18977
G1 X156.143 Y111.398 E.00452
G1 X156.316 Y111.034 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6143
M204 S5000
G3 X156.999 Y108.649 I.819 J-1.056 E.09473
G3 X157.3 Y108.652 I.138 J1.104 E.00899
G3 X156.364 Y111.069 I-.165 J1.326 E.14458
; WIPE_START
G1 F6364.704
M204 S10000
G1 X156.179 Y110.924 E-.08932
G1 X156.063 Y110.793 E-.06671
G1 X155.889 Y110.49 E-.13271
G1 X155.798 Y110.153 E-.13276
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.3 E-.07311
; WIPE_END
G1 E-.04 F1800
G1 X156.719 Y112.301 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X157.049 Y112.252 E.01074
G3 X157.573 Y112.307 I.069 J1.879 E.017
G3 X156.661 Y112.316 I-.439 J1.672 E.31966
G1 X156.74 Y112.699 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6143
M204 S5000
G1 X156.779 Y112.689 E.00121
G3 X157.076 Y112.643 I.352 J1.29 E.00895
G3 X157.471 Y112.686 I.041 J1.475 E.01189
G3 X156.615 Y112.746 I-.34 J1.293 E.22415
G1 X156.684 Y112.72 E.00219
; WIPE_START
G1 F6364.704
M204 S10000
G1 X156.779 Y112.689 E-.03818
G1 X157.076 Y112.643 E-.11391
G1 X157.3 Y112.652 E-.08526
G1 X157.471 Y112.686 E-.0665
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.1327
G1 X158.187 Y113.164 E-.13316
G1 X158.35 Y113.447 E-.12401
; WIPE_END
G1 E-.04 F1800
G1 X150.759 Y114.244 Z5.6 F30000
G1 X115.395 Y117.959 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6143
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
G1 F6364.704
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z5.6 F30000
G1 X160.79 Y118.893 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F6143
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
G1 F6364.704
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F6143
G1 X115.191 Y118.23 E.41425
G1 X113.864 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X115.047 Y107.804 E.03803
G1 X115.047 Y108.249 E.01433
G1 X105.143 Y118.153 E.45039
G1 X104.801 Y118.153 E.01098
G1 X95.95 Y109.302 E.40251
G1 X95.95 Y111.994 E.08656
G1 X100.141 Y107.804 E.19056
G1 X102.128 Y107.804 E.0639
G1 X103.703 Y109.382 E.07172
G2 X104.069 Y111.551 I1.935 J.789 E.07448
G1 X97.467 Y118.153 E.30023
G1 X97.125 Y118.153 E.01098
G1 X95.95 Y116.978 E.05344
G1 X95.95 Y115.35 E.05236
G1 X107.546 Y110.976 F30000
G1 F5895.652
G3 X106.423 Y112.099 I-2.105 J-.981 E.05212
G1 X112.477 Y118.153 E.27532
G1 X112.819 Y118.153 E.01098
G1 X115.047 Y115.925 E.10132
M73 P82 R3
G1 X115.047 Y113.047 E.09257
G1 X109.804 Y107.804 E.23843
G1 X107.816 Y107.804 E.0639
G1 X106.998 Y108.622 E.03723
G2 X105.499 Y108.107 I-1.374 J1.557 E.05228
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F6143
G1 X153.409 Y107.352 E.55248
G1 X154.231 Y107.804 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.859 Y107.804 E.05236
G1 X155.942 Y107.919 E.00454
G1 X155.789 Y108.173 E.00953
G1 X155.949 Y108.268 E.00598
G2 X155.258 Y109.072 I1.182 J1.715 E.03446
G1 X156.442 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409126
G1 F6143
M73 P83 R3
G1 X156.586 Y107.919 E.00808
; LINE_WIDTH: 0.468854
G1 F5634.676
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436036
G1 F6105.075
G3 X157.392 Y107.86 I.299 J5.925 E.01743
; LINE_WIDTH: 0.468376
G1 F5641.012
G3 X157.641 Y107.884 I-.24 J3.818 E.0084
G1 X157.653 Y107.901 E.0007
; LINE_WIDTH: 0.447058
G1 F5938.567
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409226
G1 F6143
G1 X157.808 Y108.158 E.00808
; WIPE_START
G1 F6551.898
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.879 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.116641
G1 F6143
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149295
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180097
G1 X157.357 Y111.979 E.00033
G1 X157.39 Y112.006 E.00046
; LINE_WIDTH: 0.144742
G1 X157.417 Y112.02 E.00025
; LINE_WIDTH: 0.116534
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.187346
G1 F6143
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146222
G1 X156.833 Y111.937 E.00028
; LINE_WIDTH: 0.116601
G1 X156.666 Y111.88 E.00103
G1 X155.069 Y114.283 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.953 Y115.399 E.05076
G1 X153.953 Y113.573 E.05869
G1 X155.252 Y114.872 E.05905
G2 X156.232 Y115.852 I2.055 J-1.075 E.04526
G1 X158.533 Y118.153 E.10466
G1 X158.875 Y118.153 E.01098
G1 X160.05 Y116.978 E.05344
G1 X160.05 Y111.994 E.16027
G1 X158.975 Y110.919 E.04888
G2 X159.193 Y110.159 I-2.952 J-1.259 E.0255
G1 X160.05 Y109.302 E.03896
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X160.05 Y107.804 E-.04936
G1 X160.05 Y109.302 E-.5694
G1 X159.787 Y109.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/41
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z5.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X104.983 Y111.785
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4405
G1 X104.964 Y111.774 E.0007
G3 X105.467 Y108.458 I.669 J-1.595 E.14727
G3 X106.073 Y108.507 I.157 J1.843 E.01966
G3 X105.178 Y111.847 I-.44 J1.672 E.17522
G1 X105.04 Y111.803 E.00464
G1 X105.116 Y111.409 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4405
M204 S5000
G3 X105.493 Y108.849 I.518 J-1.232 E.10499
G3 X105.8 Y108.852 I.143 J1.124 E.00916
G3 X105.171 Y111.431 I-.166 J1.326 E.13415
; WIPE_START
G1 F6364.704
M204 S10000
G1 X104.811 Y111.24 E-.15502
G1 X104.679 Y111.124 E-.0667
G1 X104.563 Y110.993 E-.06669
G1 X104.389 Y110.69 E-.1327
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.179 E-.06659
G1 X104.298 Y110.004 E-.0666
G1 X104.348 Y109.818 E-.07319
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.046 Z5.8 F30000
G1 X156.092 Y111.366 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4405
G1 X156.075 Y111.347 E.00081
G3 X156.967 Y108.258 I1.058 J-1.368 E.13275
G3 X157.573 Y108.307 I.157 J1.842 E.01965
G3 X156.262 Y111.473 I-.44 J1.672 E.18976
G1 X156.143 Y111.398 E.00452
G1 X156.316 Y111.034 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4405
M204 S5000
G3 X156.993 Y108.649 I.818 J-1.056 E.09462
G3 X157.3 Y108.652 I.143 J1.124 E.00916
G3 X156.364 Y111.07 I-.166 J1.326 E.14453
; WIPE_START
G1 F6364.704
M204 S10000
G1 X156.179 Y110.924 E-.08931
G1 X156.063 Y110.793 E-.06671
G1 X155.889 Y110.49 E-.13267
G1 X155.798 Y110.153 E-.13279
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.3 E-.07313
; WIPE_END
G1 E-.04 F1800
G1 X156.719 Y112.301 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4405
G1 X157.055 Y112.252 E.0109
G3 X157.573 Y112.307 I.062 J1.893 E.01682
G3 X156.661 Y112.316 I-.439 J1.672 E.31969
G1 X156.736 Y112.701 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4405
M204 S5000
G1 X156.779 Y112.689 E.00133
G3 X157.081 Y112.643 I.351 J1.29 E.00912
G3 X157.471 Y112.686 I.032 J1.497 E.01173
G3 X156.615 Y112.746 I-.341 J1.293 E.22416
G1 X156.68 Y112.721 E.00207
; WIPE_START
G1 F6364.704
M204 S10000
G1 X156.779 Y112.689 E-.03977
G1 X157.081 Y112.643 E-.11605
G1 X157.3 Y112.652 E-.08314
G1 X157.471 Y112.686 E-.0665
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.13268
G1 X158.187 Y113.164 E-.13315
G1 X158.348 Y113.443 E-.12242
; WIPE_END
G1 E-.04 F1800
G1 X150.757 Y114.241 Z5.8 F30000
G1 X115.395 Y117.959 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4405
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4405
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
G1 F6364.704
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z5.8 F30000
G1 X160.79 Y118.893 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F4405
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
G1 F6364.704
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.05 Y117.7 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4405
G1 X160.05 Y118.153 E.01458
G1 X158.875 Y118.153 E.03778
G1 X160.05 Y116.978 E.05343
G1 X160.05 Y117.7 E.02321
G1 X160.035 Y116.356 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X160.035 Y113.365 E.08033
; Slow Down End
G1 X159.673 Y113.466 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4405
G1 X159.673 Y113.155 E.01
G1 X160.05 Y112.778 E.01715
G1 X160.05 Y111.994 E.02521
G1 X158.975 Y110.919 E.04887
G2 X159.193 Y110.159 I-2.952 J-1.259 E.02551
G1 X160.05 Y109.302 E.03895
G1 X160.05 Y107.804 E.04818
G1 X159.92 Y107.804 E.00418
G1 X157.808 Y108.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409261
G1 F4405
G1 X157.664 Y107.919 E.00808
; LINE_WIDTH: 0.447085
G1 X157.653 Y107.901 E.00067
; LINE_WIDTH: 0.468389
G1 X157.641 Y107.884 E.0007
G2 X157.392 Y107.86 I-.494 J3.854 E.0084
; LINE_WIDTH: 0.436046
G2 X156.831 Y107.862 I-.262 J5.927 E.01743
; LINE_WIDTH: 0.468886
G1 X156.609 Y107.884 E.00753
G1 X156.586 Y107.919 E.00141
; LINE_WIDTH: 0.409275
G1 X156.442 Y108.158 E.00808
G1 X153.409 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F4405
G1 X115.591 Y107.352 E.55248
G1 X113.487 Y108.181 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4405
G1 X114.669 Y108.181 E.03803
G1 X114.669 Y108.627 E.01433
G1 X105.52 Y117.776 E.41607
G1 X104.424 Y117.776 E.03525
G1 X96.327 Y109.679 E.3682
G1 X96.327 Y111.617 E.0623
G1 X99.763 Y108.181 E.15625
G1 X102.505 Y108.181 E.08816
G1 X103.423 Y109.099 E.04174
G2 X103.802 Y111.819 I2.294 J1.067 E.09334
G1 X97.844 Y117.776 E.27092
G1 X96.748 Y117.776 E.03525
G1 X96.327 Y117.355 E.01913
G1 X96.327 Y115.727 E.05236
G1 X106.229 Y108.184 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X106.445 Y108.254 E.00609
G1 X106.882 Y108.506 E.01356
G1 X107.272 Y108.889 E.0147
G1 X107.55 Y109.359 E.01466
G1 X107.697 Y109.887 E.01471
G1 X107.702 Y110.429 E.01458
G1 X107.566 Y110.96 E.01471
G1 X107.298 Y111.435 E.01466
G1 X106.915 Y111.826 E.01469
G1 X106.445 Y112.103 E.01466
G1 X105.917 Y112.25 E.01471
G1 X105.374 Y112.255 E.01458
G1 X104.844 Y112.119 E.01471
G1 X104.368 Y111.851 E.01466
G1 X103.978 Y111.468 E.01469
G1 X103.7 Y110.998 E.01466
G1 X103.554 Y110.473 E.01463
G1 X103.549 Y109.925 E.01473
G1 X103.684 Y109.397 E.01463
G1 X103.952 Y108.922 E.01465
G1 X104.335 Y108.531 E.01469
G1 X104.805 Y108.254 E.01466
G1 X104.964 Y108.203 E.00447
; Slow Down End
G1 X106.315 Y107.818 F30000
; Slow Down Start
; LINE_WIDTH: 0.383429
G1 F3000;_EXTRUDE_SET_SPEED
G1 X114.873 Y107.818 E.23019
G1 X115.005 Y107.846 E.00362
G1 X115.032 Y107.978 E.00362
G1 X115.032 Y117.619 E.25932
G1 X115.005 Y117.75 E.00362
G1 X114.856 Y117.805 E.00426
G1 X114.801 Y118.111 E.00837
G1 X114.669 Y118.139 E.00362
G1 X96.366 Y118.139 E.49232
G1 X96.088 Y118.015 E.00818
G1 X95.965 Y117.737 E.00818
G1 X95.965 Y107.978 E.26251
G1 X95.992 Y107.846 E.00362
G1 X96.124 Y107.818 E.00362
G1 X104.875 Y107.818 E.23538
; Slow Down End
G1 X108.041 Y109.751 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4405
G2 X107.265 Y108.355 I-2.699 J.587 E.05209
G1 X107.439 Y108.181 E.00792
G1 X110.181 Y108.181 E.08816
G1 X114.669 Y112.669 E.20412
G1 X114.669 Y116.303 E.11683
G1 X113.196 Y117.776 E.067
G1 X112.1 Y117.776 E.03525
M73 P84 R3
G1 X106.705 Y112.381 E.24536
G2 X107.831 Y111.25 I-1.304 J-2.425 E.05208
G1 X115.191 Y118.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F4405
G1 X153.809 Y118.23 E.41425
G1 X158.253 Y118.139 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.390488
G1 F3000;_EXTRUDE_SET_SPEED
G1 X154.331 Y118.139 E.10769
G1 X154.199 Y118.111 E.0037
G1 X154.144 Y117.805 E.00854
G1 X153.995 Y117.75 E.00435
G1 X153.968 Y117.619 E.0037
G1 X153.968 Y111.412 E.17041
; Slow Down End
G1 X156.666 Y111.88 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116609
G1 F4405
G1 X156.833 Y111.937 E.00103
; LINE_WIDTH: 0.146208
G1 X156.863 Y111.953 E.00028
; LINE_WIDTH: 0.187354
G1 X156.892 Y111.979 E.00045
G1 X157.357 Y111.979 E.0053
G1 X157.38 Y111.958 F30000
; LINE_WIDTH: 0.149282
G1 F4405
G1 X157.417 Y111.937 E.00036
; LINE_WIDTH: 0.116589
G1 X157.584 Y111.88 E.00103
G1 X157.584 Y112.077 F30000
; LINE_WIDTH: 0.116598
G1 F4405
G1 X157.417 Y112.02 E.00103
; LINE_WIDTH: 0.144841
G1 X157.39 Y112.006 E.00025
; LINE_WIDTH: 0.180142
G1 X157.357 Y111.979 E.00046
G1 X157.38 Y111.958 E.00033
G1 X159.221 Y113.976 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.384644
G1 F3000;_EXTRUDE_SET_SPEED
G1 X159.14 Y114.54 E.01539
G1 X158.926 Y115.042 E.01474
G1 X158.589 Y115.472 E.01472
G1 X158.153 Y115.8 E.01473
G1 X157.647 Y116.004 E.01474
G1 X157.104 Y116.071 E.01476
G1 X156.564 Y115.993 E.01474
G1 X156.061 Y115.779 E.01474
G1 X155.632 Y115.442 E.01473
G1 X155.304 Y115.006 E.01473
G1 X155.099 Y114.5 E.01474
G1 X155.034 Y113.958 E.01473
G1 X155.11 Y113.417 E.01475
G1 X155.324 Y112.915 E.01474
G1 X155.661 Y112.485 E.01473
G1 X156.215 Y112.085 E.01846
G1 X156.251 Y111.9 E.00508
G1 X155.835 Y111.626 E.01343
G1 X155.452 Y111.235 E.01477
G1 X155.176 Y110.705 E.01613
; Slow Down End
; WIPE_START
G1 X155.452 Y111.235 E-.2271
G1 X155.835 Y111.626 E-.20792
G1 X156.251 Y111.9 E-.18902
G1 X156.215 Y112.085 E-.07157
G1 X156.078 Y112.184 E-.06439
; WIPE_END
G1 E-.04 F1800
G1 X158.362 Y116.101 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4405
G3 X156.793 Y116.413 I-1.254 J-2.205 E.05231
G1 X158.156 Y117.776 E.06197
G1 X154.534 Y117.776 E.11647
G1 X154.534 Y117.415 E.01161
G1 X154.33 Y117.415 E.00654
G1 X154.33 Y115.021 E.07697
G1 X154.749 Y114.603 E.01902
G1 X154.69 Y114.31 E.0096
G1 X154.331 Y113.951 E.01636
G1 X154.33 Y110.714 E.10408
G1 X153.953 Y110.938 E.01411
G1 X153.953 Y107.804 E.10079
G1 X155.86 Y107.804 E.0613
G1 X155.941 Y107.918 E.00453
G1 X155.789 Y108.173 E.00953
G1 X155.949 Y108.268 E.00599
G2 X155.258 Y109.072 I1.182 J1.714 E.03445
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X155.474 Y108.712 E-.15945
G1 X155.949 Y108.268 E-.2469
G1 X155.789 Y108.173 E-.07077
G1 X155.941 Y107.918 E-.11263
G1 X155.86 Y107.804 E-.05351
G1 X155.552 Y107.804 E-.11674
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/41
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
M106 S198.9
G17
G3 Z5.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X104.983 Y111.785
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
G1 X104.965 Y111.773 E.0007
G3 X105.461 Y108.458 I.668 J-1.595 E.14708
G3 X106.073 Y108.507 I.161 J1.847 E.01983
G3 X105.178 Y111.846 I-.441 J1.672 E.17512
G1 X105.04 Y111.803 E.00464
G1 X105.116 Y111.41 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.488 Y108.849 I.517 J-1.232 E.10489
G3 X105.8 Y108.852 I.147 J1.144 E.00933
G3 X105.171 Y111.432 I-.167 J1.326 E.1341
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15503
G1 X104.679 Y111.124 E-.06671
G1 X104.563 Y110.993 E-.06672
G1 X104.389 Y110.69 E-.13268
G1 X104.298 Y110.353 E-.1325
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07316
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.046 Z6 F30000
G1 X156.092 Y111.366 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.076 Y111.347 E.00081
G3 X156.961 Y108.258 I1.057 J-1.368 E.13256
G3 X157.573 Y108.307 I.162 J1.847 E.01984
G3 X156.262 Y111.472 I-.441 J1.672 E.18966
G1 X156.143 Y111.398 E.00452
G1 X156.315 Y111.035 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X156.988 Y108.649 I.818 J-1.057 E.0945
G3 X157.3 Y108.652 I.147 J1.144 E.00933
G3 X156.363 Y111.07 I-.167 J1.326 E.14448
; WIPE_START
M204 S10000
G1 X156.179 Y110.924 E-.08932
G1 X156.063 Y110.793 E-.06672
G1 X155.889 Y110.49 E-.1327
G1 X155.798 Y110.153 E-.13277
G1 X155.788 Y109.978 E-.06629
G1 X155.798 Y109.804 E-.06629
G1 X155.889 Y109.467 E-.1328
G1 X155.985 Y109.3 E-.07311
; WIPE_END
G1 E-.04 F1800
G1 X156.7 Y112.302 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.899 Y112.266 E.00648
G3 X157.06 Y112.251 I.235 J1.713 E.00522
G3 X157.573 Y112.307 I.054 J1.91 E.01664
G3 X156.643 Y112.321 I-.44 J1.672 E.31911
G1 X156.732 Y112.702 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.78 Y112.69 E.00145
G3 X157.087 Y112.643 I.356 J1.288 E.00928
G3 X157.3 Y112.652 I.072 J.785 E.00637
G3 X156.615 Y112.747 I-.165 J1.326 E.2293
G1 X156.676 Y112.723 E.00194
; WIPE_START
M204 S10000
G1 X156.78 Y112.69 E-.04127
G1 X157.087 Y112.643 E-.11813
G1 X157.3 Y112.652 E-.08102
G1 X157.637 Y112.742 E-.13252
G1 X157.794 Y112.82 E-.06679
G1 X157.939 Y112.917 E-.06614
G1 X158.187 Y113.164 E-.13317
G1 X158.346 Y113.44 E-.12095
; WIPE_END
G1 E-.04 F1800
G1 X150.755 Y114.239 Z6 F30000
G1 X115.395 Y117.959 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z6 F30000
G1 X160.79 Y118.893 Z6
G1 Z5.6
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.025 Y118.129 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F7058.823
G1 X160.025 Y116.89 E.03329
G1 X158.715 Y115.009 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40451
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X160.231 Y113.493 E.10882
M106 S198.9
G1 X160.025 Y112.851 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F3000;_EXTRUDE_SET_SPEED
G1 X160.025 Y107.888 E.1333
; Slow Down End
G1 X159.653 Y108.071 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X159.653 Y109.699 E.05236
G1 X159.193 Y110.159 E.02091
G3 X158.975 Y110.919 I-3.169 J-.498 E.02551
G1 X159.653 Y111.597 E.03084
G1 X159.617 Y113.211 E.05189
G1 X157.584 Y112.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116587
G1 F15000
G1 X157.417 Y112.02 E.00103
; LINE_WIDTH: 0.144895
G1 X157.39 Y112.006 E.00025
; LINE_WIDTH: 0.180204
G1 X157.357 Y111.979 E.00046
G1 X157.38 Y111.958 E.00033
; LINE_WIDTH: 0.149328
G1 X157.417 Y111.937 E.00036
; LINE_WIDTH: 0.116616
G1 X157.584 Y111.88 E.00103
G1 X157.357 Y111.979 F30000
; LINE_WIDTH: 0.18735
G1 F15000
G1 X156.893 Y111.979 E.0053
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146155
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116592
G1 X156.666 Y111.88 E.00103
G1 X155.349 Y110.661 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40451
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X153.975 Y112.036 E.09865
G1 X153.975 Y112.678 E.03263
G1 X155.433 Y111.22 E.10465
G2 X155.742 Y111.554 I1.898 J-1.447 E.02312
G1 X153.975 Y113.321 E.12683
G1 X153.975 Y113.964 E.03263
G1 X156.114 Y111.824 E.15358
G1 X156.346 Y111.978 E.01414
G1 X155.846 Y112.311 E.0305
G2 X155.082 Y113.499 I1.288 J1.667 E.0731
G1 X153.975 Y114.607 E.07951
G1 X153.975 Y115.249 E.03263
G1 X155.037 Y114.187 E.07626
G2 X155.158 Y114.709 I2.246 J-.247 E.02724
G1 X153.975 Y115.892 E.08496
G1 X153.975 Y116.535 E.03263
G1 X155.375 Y115.134 E.10054
G2 X155.666 Y115.487 I1.977 J-1.33 E.02321
G1 X153.975 Y117.178 E.12137
G1 X153.975 Y117.771 E.0301
G1 X154.025 Y117.771 E.00253
G1 X156.028 Y115.767 E.14382
G2 X156.468 Y115.97 I1.161 J-1.94 E.02464
G1 X154.306 Y118.132 E.15518
G1 X154.949 Y118.132 E.03263
G1 X157.008 Y116.073 E.14781
G2 X157.739 Y115.984 I.171 J-1.654 E.03769
G1 X155.592 Y118.132 E.15414
G1 X156.235 Y118.132 E.03263
G1 X160.028 Y114.338 E.27231
G1 X160.028 Y114.981 E.03263
G1 X156.878 Y118.132 E.22617
G1 X157.52 Y118.132 E.03263
G1 X160.028 Y115.624 E.18003
G1 X160.028 Y116.267 E.03263
G1 X157.961 Y118.334 E.14842
M106 S198.9
G1 X153.809 Y118.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.228 Y108.545 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40573
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X114.508 Y107.825 E.05195
G1 X113.864 Y107.825 E.03291
G1 X115.025 Y108.987 E.08387
G1 X115.025 Y109.631 E.03291
G1 X113.219 Y107.825 E.13041
G1 X112.575 Y107.825 E.03291
G1 X115.025 Y110.276 E.17696
G1 X115.025 Y110.92 E.03291
G1 X111.93 Y107.825 E.2235
G1 X111.286 Y107.825 E.03291
G1 X115.025 Y111.565 E.27004
G1 X115.025 Y112.209 E.03291
G1 X110.641 Y107.825 E.31659
G1 X109.997 Y107.825 E.03291
G1 X115.025 Y112.854 E.36313
G1 X115.025 Y113.498 E.03291
G1 X109.352 Y107.825 E.40967
G1 X108.708 Y107.825 E.03291
G1 X115.025 Y114.143 E.45622
G1 X115.025 Y114.787 E.03291
G1 X108.063 Y107.825 E.50276
G1 X107.419 Y107.825 E.03291
G1 X115.025 Y115.432 E.5493
G1 X115.025 Y116.076 E.03291
G1 X106.774 Y107.825 E.59585
G1 X106.381 Y107.825 E.02008
G1 X106.333 Y108.029 E.01068
G1 X115.025 Y116.721 E.62769
G1 X115.025 Y117.365 E.03291
G1 X107.718 Y110.058 E.52768
G3 X107.669 Y110.653 I-2.148 J.12 E.03058
G1 X114.822 Y117.806 E.51658
G1 X114.822 Y118.132 E.01662
G1 X114.503 Y118.132 E.01629
G1 X107.496 Y111.125 E.506
G3 X107.242 Y111.515 I-1.946 J-.99 E.02383
G1 X113.858 Y118.132 E.47782
G1 X113.214 Y118.132 E.03291
G1 X106.917 Y111.835 E.45473
G3 X106.515 Y112.078 I-1.603 J-2.201 E.024
G1 X112.569 Y118.132 E.43721
G1 X111.925 Y118.132 E.03291
G1 X106.029 Y112.236 E.42576
G3 X105.415 Y112.266 I-.413 J-2.137 E.03152
G1 X111.28 Y118.132 E.42358
G1 X110.636 Y118.132 E.03291
G1 X100.329 Y107.825 E.74429
G1 X99.685 Y107.825 E.03291
G1 X109.991 Y118.132 E.74429
G1 X109.347 Y118.132 E.03291
G1 X99.04 Y107.825 E.74429
G1 X98.396 Y107.825 E.03291
G1 X108.702 Y118.132 E.74429
G1 X108.058 Y118.132 E.03291
G1 X97.751 Y107.825 E.74429
G1 X97.107 Y107.825 E.03291
G1 X107.413 Y118.132 E.74429
G1 X106.769 Y118.132 E.03291
G1 X96.462 Y107.825 E.74429
G1 X95.972 Y107.825 E.02505
G1 X95.972 Y107.979 E.00786
G1 X106.124 Y118.132 E.73317
G1 X105.48 Y118.132 E.03291
G1 X95.972 Y108.624 E.68663
G1 X95.972 Y109.268 E.03291
G1 X104.835 Y118.132 E.64009
G1 X104.191 Y118.132 E.03291
G1 X95.972 Y109.913 E.59354
G1 X95.972 Y110.557 E.03291
G1 X103.546 Y118.132 E.547
G1 X102.902 Y118.132 E.03291
G1 X95.972 Y111.202 E.50046
G1 X95.972 Y111.846 E.03291
G1 X102.257 Y118.132 E.45391
G1 X101.613 Y118.132 E.03291
G1 X95.972 Y112.491 E.40737
M73 P85 R3
G1 X95.972 Y113.135 E.03291
G1 X100.968 Y118.132 E.36083
G1 X100.324 Y118.132 E.03291
G1 X95.972 Y113.78 E.31428
G1 X95.972 Y114.424 E.03291
G1 X99.679 Y118.132 E.26774
G1 X99.035 Y118.132 E.03291
G1 X95.972 Y115.069 E.2212
G1 X95.972 Y115.713 E.03291
G1 X98.39 Y118.132 E.17465
G1 X97.746 Y118.132 E.03291
G1 X95.972 Y116.358 E.12811
G1 X95.972 Y117.002 E.03291
G1 X97.101 Y118.132 E.08157
G1 X96.457 Y118.132 E.03291
G1 X95.769 Y117.444 E.04965
M106 S198.9
G1 X100.771 Y107.623 F30000
M106 S229.5
G1 F3000
G1 X103.537 Y110.389 E.19975
G3 X103.567 Y109.774 I2.119 J-.204 E.03152
G1 X101.618 Y107.825 E.14075
G1 X102.263 Y107.825 E.03291
G1 X103.726 Y109.288 E.10566
G3 X103.969 Y108.887 I2.447 J1.204 E.024
G1 X102.907 Y107.825 E.07664
G1 X103.552 Y107.825 E.03291
G1 X104.288 Y108.562 E.05318
G3 X104.678 Y108.307 I1.379 J1.69 E.02383
G1 X104.196 Y107.825 E.03482
G1 X104.841 Y107.825 E.03291
G1 X105.149 Y108.134 E.02227
M106 S198.9
G1 X105.442 Y107.961 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.64726
; LAYER_HEIGHT: 0.2
G1 F3971.275
G1 X105.748 Y107.961 E.0146
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X156.442 Y108.158 F30000
; LINE_WIDTH: 0.409059
G1 F6554.896
G1 X156.586 Y107.919 E.00807
; LINE_WIDTH: 0.46887
G1 F5634.466
G1 X156.609 Y107.884 E.00141
G1 X156.831 Y107.862 E.00753
; LINE_WIDTH: 0.436051
G1 F6104.844
G3 X157.392 Y107.86 I.299 J5.922 E.01743
; LINE_WIDTH: 0.468379
G1 F5640.97
G3 X157.641 Y107.884 I-.247 J3.893 E.00841
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446921
G1 F5940.586
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.409017
G1 F6555.643
G1 X157.808 Y108.158 E.00807
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.997 Y110.93 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3000;_EXTRUDE_SET_SPEED
G1 X153.997 Y107.848 E.09181
G1 X155.924 Y107.848 E.05738
G1 X155.8 Y108.143 E.00953
G1 X155.886 Y108.277 E.00476
G1 X155.608 Y108.496 E.01054
G1 X155.276 Y108.939 E.01649
G1 X155.069 Y109.453 E.01651
G1 X155.004 Y109.954 E.01505
G1 X155.041 Y110.31 E.01065
G1 X154.049 Y110.899 E.03436
; Slow Down End
G1 X155.206 Y108.291 F30000
; Slow Down Start
; LINE_WIDTH: 0.53576
G1 F3000;_EXTRUDE_SET_SPEED
G1 X154.949 Y108.626 E.01646
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.532493
;_EXTRUDE_SET_SPEED
G1 X154.932 Y108.664 E.00158
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.492558
;_EXTRUDE_SET_SPEED
G1 X154.915 Y108.701 E.00145
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.452623
;_EXTRUDE_SET_SPEED
G1 X154.898 Y108.738 E.00132
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.412688
;_EXTRUDE_SET_SPEED
G1 X154.882 Y108.775 E.00119
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.498995
;_EXTRUDE_SET_SPEED
G1 X154.838 Y108.933 E.00589
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.458865
;_EXTRUDE_SET_SPEED
G1 X154.795 Y109.091 E.00537
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.418735
;_EXTRUDE_SET_SPEED
G1 X154.752 Y109.248 E.00485
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.37109
;_EXTRUDE_SET_SPEED
G1 X154.709 Y109.406 E.00424
G1 X154.67 Y110.127 E.01872
G1 X154.343 Y110.321 E.00984
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.373508
;_EXTRUDE_SET_SPEED
G1 X154.344 Y110.105 E.00565
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.403443
;_EXTRUDE_SET_SPEED
G1 X154.344 Y109.889 E.00616
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.38397
;_EXTRUDE_SET_SPEED
G1 X154.351 Y109.714 E.00472
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.43211
;_EXTRUDE_SET_SPEED
G1 X154.359 Y109.539 E.00538
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.48025
;_EXTRUDE_SET_SPEED
G1 X154.366 Y109.364 E.00605
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.492426
;_EXTRUDE_SET_SPEED
G3 X154.44 Y108.291 I16.428 J.599 E.0382
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.55246
;_EXTRUDE_SET_SPEED
G1 X155.146 Y108.291 E.02841
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X154.44 Y108.291 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/41
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S226.95
G17
G3 Z6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X104.983 Y111.785
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.964 Y111.774 E.0007
G3 X105.421 Y108.461 I.666 J-1.596 E.14601
G3 X105.852 Y108.462 I.21 J1.578 E.0139
G3 X105.178 Y111.847 I-.222 J1.715 E.1823
G1 X105.04 Y111.803 E.00464
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.47 Y108.851 I.515 J-1.234 E.1046
G3 X105.8 Y108.852 I.16 J1.208 E.00985
G3 X105.17 Y111.434 I-.17 J1.326 E.13397
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15507
G1 X104.679 Y111.124 E-.06673
G1 X104.563 Y110.993 E-.06673
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13251
G1 X104.287 Y110.178 E-.0666
G1 X104.298 Y110.004 E-.06659
G1 X104.348 Y109.818 E-.07311
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.046 Z6.2 F30000
G1 X156.092 Y111.366 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.075 Y111.348 E.0008
G3 X156.921 Y108.261 I1.055 J-1.37 E.13148
G3 X157.352 Y108.262 I.21 J1.578 E.0139
G3 X156.261 Y111.474 I-.222 J1.715 E.19685
G1 X156.143 Y111.398 E.00452
G1 X156.314 Y111.037 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X156.97 Y108.651 I.816 J-1.059 E.0942
G3 X157.3 Y108.652 I.16 J1.208 E.00985
G3 X156.362 Y111.072 I-.17 J1.326 E.14437
; WIPE_START
M204 S10000
G1 X156.179 Y110.924 E-.08934
G1 X156.063 Y110.793 E-.06672
G1 X155.889 Y110.49 E-.13268
G1 X155.798 Y110.153 E-.13278
G1 X155.788 Y109.978 E-.0663
G1 X155.798 Y109.804 E-.0663
G1 X155.889 Y109.467 E-.13279
G1 X155.985 Y109.3 E-.0731
; WIPE_END
G1 E-.04 F1800
G1 X156.486 Y112.371 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.677 Y112.306 E.00647
G3 X156.898 Y112.262 I.441 J1.672 E.00726
G1 X157.102 Y112.249 E.00657
G3 X156.43 Y112.391 I.015 J1.729 E.32709
G1 X156.713 Y112.715 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.95 Y112.652 E.0073
G1 X157.105 Y112.641 E.00463
G3 X156.613 Y112.741 I.013 J1.336 E.23509
G1 X156.655 Y112.73 E.0013
; WIPE_START
M204 S10000
G1 X156.95 Y112.652 E-.11596
G1 X157.105 Y112.641 E-.05901
G1 X157.298 Y112.652 E-.07353
G1 X157.471 Y112.686 E-.0671
G1 X157.637 Y112.742 E-.0663
G1 X157.939 Y112.917 E-.13268
G1 X158.187 Y113.164 E-.13317
G1 X158.283 Y113.309 E-.06614
G1 X158.337 Y113.418 E-.04612
; WIPE_END
G1 E-.04 F1800
G1 X150.747 Y114.221 Z6.2 F30000
G1 X115.395 Y117.959 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z6.2 F30000
G1 X160.79 Y118.893 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.247 Y113.954 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F6364.871
G1 X159.181 Y114.504 E.01652
G1 X158.974 Y115.018 E.0165
G1 X158.642 Y115.461 E.01648
G1 X158.207 Y115.803 E.01648
G1 X157.698 Y116.021 E.0165
G1 X157.15 Y116.101 E.0165
G1 X156.599 Y116.034 E.01652
G1 X156.085 Y115.828 E.0165
G1 X155.642 Y115.496 E.01649
G1 X155.3 Y115.061 E.01648
G1 X155.082 Y114.552 E.0165
G1 X155.004 Y114.003 E.01651
G1 X155.069 Y113.453 E.01649
G1 X155.276 Y112.939 E.01652
G1 X155.59 Y112.519 E.0156
G1 X156.043 Y112.154 E.01734
G1 X156.245 Y112.057 E.00667
G1 X156.206 Y111.942 E.00362
G1 X156.232 Y111.895 E.00162
G1 X156.043 Y111.803 E.00625
G1 X155.642 Y111.496 E.01503
G1 X155.3 Y111.061 E.01648
G1 X155.082 Y110.552 E.0165
G1 X155.004 Y110.003 E.01651
G1 X155.069 Y109.453 E.01649
G1 X155.276 Y108.939 E.01651
G1 X155.608 Y108.496 E.01649
G1 X155.89 Y108.274 E.01069
G1 X155.807 Y108.142 E.00465
G1 X155.92 Y107.848 E.0094
G1 X153.997 Y107.848 E.05729
G1 X153.997 Y117.748 E.2949
G1 X154.16 Y117.82 E.0053
G1 X154.201 Y118.109 E.0087
G1 X160.006 Y118.109 E.17292
G1 X160.006 Y107.848 E.30565
G1 X158.327 Y107.848 E.05
G1 X158.45 Y108.143 E.00952
G1 X158.364 Y108.278 E.00476
G1 X158.642 Y108.496 E.01054
G1 X158.95 Y108.896 E.01503
G1 X159.168 Y109.405 E.0165
G1 X159.247 Y109.954 E.0165
M73 P86 R3
G1 X159.181 Y110.504 E.01652
G1 X158.974 Y111.018 E.0165
G1 X158.642 Y111.461 E.01648
G1 X158.207 Y111.803 E.01648
G1 X158.018 Y111.895 E.00625
G1 X158.044 Y112.015 E.00366
G1 X158.018 Y112.062 E.00161
G1 X158.207 Y112.154 E.00625
G1 X158.608 Y112.461 E.01503
G1 X158.95 Y112.896 E.01649
G1 X159.168 Y113.405 E.0165
G1 X159.239 Y113.894 E.01471
G1 X159.546 Y109.248 F30000
; LINE_WIDTH: 0.474335
G1 F5563.099
G1 X159.591 Y109.398 E.00533
G2 X159.604 Y108.249 I-35.715 J-.975 E.03915
G1 X158.962 Y108.251 E.0219
G1 X159.268 Y108.652 E.01719
G1 X159.521 Y109.194 E.02039
G1 X159.591 Y109.398 F30000
; LINE_WIDTH: 0.481809
G1 F5468.357
G3 X159.594 Y110.524 I-4.761 J.572 E.03913
G1 X159.59 Y110.584 F30000
; Slow Down Start
; LINE_WIDTH: 0.478873
G1 F3000;_EXTRUDE_SET_SPEED
G1 X159.596 Y110.651 E.00233
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.445141
;_EXTRUDE_SET_SPEED
G3 X159.629 Y111.224 I-5.973 J.627 E.01823
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.438663
;_EXTRUDE_SET_SPEED
G1 X159.629 Y111.979 E.02359
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.459922
;_EXTRUDE_SET_SPEED
G3 X159.591 Y113.398 I-12.652 J.377 E.0468
G1 X159.537 Y113.252 E.00513
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.42708
;_EXTRUDE_SET_SPEED
G1 X159.249 Y112.667 E.01981
G1 X158.941 Y112.266 E.01532
G1 X158.598 Y111.978 E.01359
G1 X158.941 Y111.691 E.01359
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.439618
;_EXTRUDE_SET_SPEED
G1 X159.132 Y111.427 E.0102
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.46632
;_EXTRUDE_SET_SPEED
G1 X159.322 Y111.163 E.01089
G1 X159.564 Y110.638 E.01932
; Slow Down End
G1 X159.28 Y111.978 F30000
; LINE_WIDTH: 0.47122
G1 F5603.549
G3 X159.196 Y111.938 I-.052 J.001 E.00719
G1 X159.591 Y113.398 F30000
; LINE_WIDTH: 0.478029
G1 F5515.861
G1 X159.598 Y113.518 E.00413
G3 X159.594 Y114.524 I-4.256 J.486 E.03466
G1 X154.507 Y117.732 F30000
; LINE_WIDTH: 0.407682
G1 F6579.636
G1 X154.456 Y117.587 E.00444
G1 X154.374 Y117.547 E.00263
G1 X154.374 Y115.273 E.06552
; LINE_WIDTH: 0.404968
G1 F6628.965
G1 X154.367 Y114.923 E.01001
; LINE_WIDTH: 0.39065
G1 F6901.92
G3 X154.367 Y113.189 I24.097 J-.869 E.04765
; LINE_WIDTH: 0.408118
G1 F6571.778
G2 X154.374 Y111.273 I-69.646 J-1.211 E.05528
; LINE_WIDTH: 0.40497
G1 F6628.919
G1 X154.367 Y110.923 E.01001
; LINE_WIDTH: 0.395208
G1 F6812.619
G2 X154.344 Y109.889 I-115.093 J2.066 E.0288
; LINE_WIDTH: 0.383979
G1 F7036.912
G1 X154.351 Y109.714 E.00472
; LINE_WIDTH: 0.432117
G1 F6166.554
G1 X154.359 Y109.539 E.00538
; LINE_WIDTH: 0.480254
G1 F5487.799
G1 X154.366 Y109.364 E.00605
; LINE_WIDTH: 0.492426
G1 F5339.2
G3 X154.44 Y108.291 I16.428 J.599 E.0382
; LINE_WIDTH: 0.546517
G1 F4765.715
G1 X155.206 Y108.291 E.03046
G1 X154.949 Y108.626 E.01682
; LINE_WIDTH: 0.532493
G1 F4902.236
G1 X154.932 Y108.664 E.00158
; LINE_WIDTH: 0.492558
G1 F5337.633
G1 X154.915 Y108.701 E.00145
; LINE_WIDTH: 0.452623
G1 F5857.909
G1 X154.898 Y108.738 E.00132
; LINE_WIDTH: 0.412688
G1 F6490.566
G1 X154.882 Y108.775 E.00119
; LINE_WIDTH: 0.499158
G1 F5260.418
G1 X154.838 Y108.933 E.00589
; LINE_WIDTH: 0.459373
G1 F5762.962
G1 X154.795 Y109.091 E.00538
; LINE_WIDTH: 0.419588
G1 F6371.667
G1 X154.752 Y109.248 E.00487
; LINE_WIDTH: 0.39282
G1 F6859.104
G1 X154.709 Y109.406 E.00452
G1 X154.66 Y110.048 E.01779
G1 X154.741 Y110.693 E.01798
; LINE_WIDTH: 0.415484
G1 F6441.858
G1 X154.927 Y111.163 E.01487
G1 X155.291 Y111.667 E.01829
G1 X155.652 Y111.978 E.01404
G1 X155.291 Y112.29 E.01403
G1 X154.928 Y112.794 E.01829
; LINE_WIDTH: 0.404968
G1 F6628.965
G1 X154.818 Y113.1 E.00929
; LINE_WIDTH: 0.390538
G1 F6904.13
G1 X154.709 Y113.406 E.00892
G1 X154.66 Y114.048 E.01767
G1 X154.741 Y114.693 E.01787
; LINE_WIDTH: 0.419075
G1 F6380.359
G1 X155.001 Y115.291 E.01936
G1 X155.413 Y115.795 E.01934
G1 X155.941 Y116.176 E.01935
G1 X156.549 Y116.408 E.01936
G1 X157.2 Y116.475 E.01942
G1 X157.843 Y116.37 E.01936
G1 X158.437 Y116.102 E.01936
G1 X158.941 Y115.691 E.01934
; LINE_WIDTH: 0.439618
G1 F6049.95
G1 X159.132 Y115.427 E.0102
; LINE_WIDTH: 0.465878
G1 F5674.321
G1 X159.322 Y115.163 E.01087
G1 X159.59 Y114.584 E.0213
; LINE_WIDTH: 0.478873
G1 F5505.187
G1 X159.596 Y114.651 E.00233
; LINE_WIDTH: 0.445141
G1 F5966.875
G3 X159.629 Y115.224 I-5.977 J.627 E.01823
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X159.629 Y117.732 E.07471
G1 X154.567 Y117.732 E.15078
G1 X159.252 Y115.906 F30000
; LINE_WIDTH: 0.42779
G1 F6235.878
G1 X158.667 Y116.401 E.02331
G1 X157.993 Y116.732 E.02281
; LINE_WIDTH: 0.468518
G1 F5639.131
G1 X157.875 Y116.782 E.00431
; LINE_WIDTH: 0.502699
G1 F5219.908
G1 X157.757 Y116.831 E.00465
G1 X157.254 Y116.881 E.01836
G1 X156.493 Y116.831 E.02769
; LINE_WIDTH: 0.494593
G1 F5313.585
G1 X156.145 Y116.678 E.01358
; LINE_WIDTH: 0.423443
G1 F6307.114
G1 X155.796 Y116.524 E.01144
G1 X155.183 Y116.094 E.02252
G1 X154.751 Y115.584 E.02008
G2 X154.756 Y117.35 I94.702 J.623 E.05309
G2 X156.136 Y117.346 I.588 J-35.153 E.04147
; LINE_WIDTH: 0.45814
G1 F5780.068
G1 X156.299 Y117.326 E.00539
; LINE_WIDTH: 0.502318
G1 F5224.228
G1 X156.462 Y117.305 E.00596
G2 X157.788 Y117.305 I.663 J-12.384 E.04817
; LINE_WIDTH: 0.494608
G1 F5313.408
G1 X158.204 Y117.33 E.01486
; LINE_WIDTH: 0.424238
G1 F6293.96
G2 X159.252 Y117.355 I.732 J-8.743 E.03159
G1 X159.252 Y115.966 E.04186
G1 X158.817 Y116.825 F30000
; LINE_WIDTH: 0.60476
G1 F4271.679
G2 X158.822 Y116.938 I-.031 J.058 E.01231
G1 X156.006 Y116.998 F30000
; LINE_WIDTH: 0.38036
G1 F7112.376
G1 X155.378 Y116.694 E.01858
G1 X155.109 Y116.487 E.00907
G1 X155.109 Y116.998 E.01362
G1 X155.946 Y116.998 E.02231
G1 X154.724 Y112.453 F30000
; LINE_WIDTH: 0.36544
G1 F7441.399
G1 X155.106 Y111.978 E.01552
G1 X154.724 Y111.504 E.01552
G1 X154.724 Y112.393 E.02266
G1 X156.666 Y112.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116583
G1 F15000
G1 X156.833 Y112.02 E.00103
; LINE_WIDTH: 0.144818
G1 X156.86 Y112.006 E.00025
; LINE_WIDTH: 0.187836
G1 X156.893 Y111.979 E.00049
G1 X157.358 Y111.978 E.00532
G1 X157.584 Y111.88 F30000
; LINE_WIDTH: 0.116609
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149315
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.181867
G1 X157.358 Y111.978 E.00033
G1 X157.384 Y112.002 E.00039
; LINE_WIDTH: 0.147798
G1 X157.417 Y112.02 E.00031
; LINE_WIDTH: 0.116585
G1 X157.584 Y112.077 E.00103
; WIPE_START
G1 X157.417 Y112.02 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.808 Y108.158 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.409242
G1 F6551.627
G1 X157.664 Y107.919 E.00808
; LINE_WIDTH: 0.447085
G1 F5938.17
G1 X157.653 Y107.901 E.00067
; LINE_WIDTH: 0.468387
G1 F5640.86
G1 X157.641 Y107.884 E.0007
G2 X157.392 Y107.86 I-.494 J3.855 E.0084
; LINE_WIDTH: 0.435549
G1 F6112.648
G2 X156.859 Y107.861 I-.26 J5.589 E.01656
; LINE_WIDTH: 0.46903
G1 F5632.357
G1 X156.608 Y107.884 E.00846
G1 X156.593 Y107.908 E.00098
; LINE_WIDTH: 0.4365
G1 F6097.869
G1 X156.517 Y108.032 E.00452
; LINE_WIDTH: 0.409978
G1 F6538.482
G1 X156.442 Y108.157 E.00422
G1 X153.409 Y107.352 F30000
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X115.591 Y107.352 E.55248
G1 X115.231 Y108.392 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42501
G1 F6281.242
G1 X114.628 Y107.789 E.02575
G1 X114.088 Y107.789 E.01631
G1 X115.062 Y108.763 E.04157
G1 X115.062 Y109.303 E.01631
G1 X113.548 Y107.789 E.06463
G1 X113.007 Y107.789 E.01631
G1 X115.062 Y109.843 E.0877
G1 X115.062 Y110.384 E.01631
G1 X112.467 Y107.789 E.11076
G1 X111.926 Y107.789 E.01631
G1 X115.062 Y110.924 E.13383
G1 X115.062 Y111.464 E.01631
G1 X111.386 Y107.789 E.15689
G1 X110.846 Y107.789 E.01631
G1 X115.062 Y112.005 E.17996
G1 X115.062 Y112.545 E.01631
G1 X110.305 Y107.789 E.20302
G1 X109.765 Y107.789 E.01631
G1 X115.062 Y113.085 E.22609
G1 X115.062 Y113.626 E.01631
G1 X109.225 Y107.789 E.24915
G1 X108.684 Y107.789 E.01631
G1 X115.062 Y114.166 E.27222
G1 X115.062 Y114.707 E.01631
G1 X108.144 Y107.789 E.29528
G1 X107.604 Y107.789 E.01631
G1 X115.062 Y115.247 E.31835
G1 X115.062 Y115.787 E.01631
G1 X107.063 Y107.789 E.34141
G1 X106.523 Y107.789 E.01631
G1 X115.062 Y116.328 E.36448
G1 X115.062 Y116.868 E.01631
G1 X105.983 Y107.789 E.38754
G1 X105.442 Y107.789 E.01631
G1 X105.777 Y108.123 E.01429
G2 X105.264 Y108.151 I-.152 J1.958 E.01554
G1 X104.902 Y107.789 E.01547
G1 X104.361 Y107.789 E.01631
G1 X104.841 Y108.269 E.02048
G2 X104.491 Y108.458 I1.262 J2.747 E.01204
G1 X103.821 Y107.789 E.02859
G1 X103.281 Y107.789 E.01631
G1 X104.19 Y108.698 E.03879
G2 X103.941 Y108.99 I1.808 J1.788 E.01158
G1 X102.74 Y107.789 E.05126
G1 X102.2 Y107.789 E.01631
G1 X103.745 Y109.333 E.06593
G2 X103.611 Y109.74 I2.044 J.893 E.01295
G1 X101.66 Y107.789 E.08331
G1 X101.119 Y107.789 E.01631
G1 X103.563 Y110.233 E.10432
G2 X103.696 Y110.906 I2.185 J-.081 E.02079
G1 X100.579 Y107.789 E.13305
G1 X100.039 Y107.789 E.01631
G1 X110.418 Y118.168 E.44304
G1 X110.958 Y118.168 E.01631
G1 X104.898 Y112.108 E.2587
G2 X105.57 Y112.239 I.742 J-2.011 E.02075
G1 X111.499 Y118.168 E.25308
G1 X112.039 Y118.168 E.01631
G1 X106.063 Y112.192 E.25509
G2 X106.47 Y112.059 I-.486 J-2.176 E.01295
G1 X112.58 Y118.168 E.26077
G1 X113.12 Y118.168 E.01631
G1 X106.814 Y111.862 E.26917
G2 X107.106 Y111.614 I-1.494 J-2.053 E.01158
G1 X113.66 Y118.168 E.27977
G1 X114.201 Y118.168 E.01631
G1 X107.345 Y111.313 E.29263
G2 X107.535 Y110.962 I-2.555 J-1.612 E.01204
G1 X114.741 Y118.168 E.30758
G1 X114.858 Y118.168 E.00354
G1 X114.858 Y117.807 E.01089
G1 X114.92 Y117.807 E.00188
G1 X107.654 Y110.541 E.31018
G2 X107.68 Y110.026 I-2.087 J-.363 E.01559
G1 X115.231 Y117.578 E.32234
G1 X115.191 Y118.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X153.809 Y118.23 E.41425
G1 X110.047 Y118.338 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42501
G1 F6281.242
G1 X99.498 Y107.789 E.45029
G1 X98.958 Y107.789 E.01631
G1 X109.337 Y118.168 E.44304
G1 X108.797 Y118.168 E.01631
G1 X98.418 Y107.789 E.44304
G1 X97.877 Y107.789 E.01631
G1 X108.257 Y118.168 E.44304
G1 X107.716 Y118.168 E.01631
G1 X97.337 Y107.789 E.44304
G1 X96.796 Y107.789 E.01631
G1 X107.176 Y118.168 E.44304
G1 X106.636 Y118.168 E.01631
G1 X96.256 Y107.789 E.44304
G1 X95.935 Y107.789 E.00968
G1 X95.935 Y108.008 E.00662
G1 X106.095 Y118.168 E.43368
G1 X105.555 Y118.168 E.01631
G1 X95.935 Y108.549 E.41061
G1 X95.935 Y109.089 E.01631
G1 X105.015 Y118.168 E.38755
G1 X104.474 Y118.168 E.01631
G1 X95.935 Y109.629 E.36448
G1 X95.935 Y110.17 E.01631
G1 X103.934 Y118.168 E.34142
G1 X103.394 Y118.168 E.01631
G1 X95.935 Y110.71 E.31835
G1 X95.935 Y111.25 E.01631
G1 X102.853 Y118.168 E.29529
G1 X102.313 Y118.168 E.01631
G1 X95.935 Y111.791 E.27222
G1 X95.935 Y112.331 E.01631
G1 X101.772 Y118.168 E.24916
G1 X101.232 Y118.168 E.01631
G1 X95.935 Y112.871 E.22609
G1 X95.935 Y113.412 E.01631
G1 X100.692 Y118.168 E.20303
G1 X100.151 Y118.168 E.01631
G1 X95.935 Y113.952 E.17996
G1 X95.935 Y114.492 E.01631
G1 X99.611 Y118.168 E.1569
G1 X99.071 Y118.168 E.01631
G1 X95.935 Y115.033 E.13383
G1 X95.935 Y115.573 E.01631
G1 X98.53 Y118.168 E.11077
G1 X97.99 Y118.168 E.01631
G1 X95.935 Y116.114 E.0877
G1 X95.935 Y116.654 E.01631
G1 X97.45 Y118.168 E.06464
G1 X96.909 Y118.168 E.01631
G1 X95.935 Y117.194 E.04158
G1 X95.935 Y117.735 E.01631
G1 X96.539 Y118.338 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6281.242
G1 X95.935 Y117.735 E-.32423
G1 X95.935 Y117.194 E-.20534
G1 X96.364 Y117.623 E-.23043
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/41
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z6.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X104.983 Y111.785
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.964 Y111.774 E.0007
G3 X105.414 Y108.461 I.664 J-1.597 E.14587
G3 X105.852 Y108.462 I.215 J1.603 E.01412
G3 X105.178 Y111.847 I-.223 J1.715 E.18219
G1 X105.04 Y111.803 E.00464
G1 X105.115 Y111.412 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.464 Y108.851 I.514 J-1.234 E.10449
G3 X105.8 Y108.852 I.164 J1.23 E.01003
G3 X105.17 Y111.434 I-.172 J1.326 E.13389
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15511
G1 X104.679 Y111.124 E-.06671
G1 X104.563 Y110.993 E-.06671
G1 X104.389 Y110.69 E-.13267
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.179 E-.06659
G1 X104.298 Y110.004 E-.0666
G1 X104.348 Y109.818 E-.07309
; WIPE_END
G1 E-.04 F1800
G1 X111.977 Y110.046 Z6.4 F30000
G1 X156.09 Y111.364 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.074 Y111.348 E.00071
G3 X156.914 Y108.261 I1.054 J-1.371 E.13134
G3 X157.352 Y108.262 I.215 J1.603 E.01412
G3 X156.261 Y111.474 I-.223 J1.715 E.19674
G1 X156.14 Y111.397 E.00462
G1 X156.317 Y111.033 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X156.964 Y108.651 I.818 J-1.057 E.09372
G1 X157.125 Y108.64 E.00481
G3 X156.365 Y111.069 I.01 J1.336 E.1498
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15538
G1 X155.967 Y110.648 E-.06612
G1 X155.889 Y110.49 E-.06685
G1 X155.798 Y110.153 E-.13273
G1 X155.798 Y109.804 E-.13235
G1 X155.833 Y109.632 E-.06679
G1 X155.889 Y109.467 E-.06629
G1 X155.985 Y109.299 E-.07348
; WIPE_END
G1 E-.04 F1800
G1 X156.487 Y112.371 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.677 Y112.306 E.00646
G3 X156.898 Y112.262 I.444 J1.671 E.00726
G1 X157.109 Y112.248 E.0068
G3 X156.43 Y112.392 I.012 J1.729 E.32689
G1 X156.71 Y112.716 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.95 Y112.652 E.00742
G1 X157.111 Y112.641 E.00481
G3 X156.613 Y112.741 I.01 J1.337 E.23493
G1 X156.651 Y112.731 E.00118
; WIPE_START
M204 S10000
G1 X156.95 Y112.652 E-.11742
G1 X157.111 Y112.641 E-.06132
G1 X157.299 Y112.652 E-.0714
G1 X157.637 Y112.742 E-.13296
G1 X157.939 Y112.917 E-.13267
G1 X158.071 Y113.033 E-.06672
G1 X158.187 Y113.164 E-.0667
G1 X158.333 Y113.417 E-.11081
; WIPE_END
G1 E-.04 F1800
G1 X150.742 Y114.22 Z6.4 F30000
G1 X115.395 Y117.959 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z6.4 F30000
G1 X160.79 Y118.893 Z6.4
G1 Z6
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F10740
G1 X115.191 Y118.23 E.41425
G1 X114.261 Y118.338 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42244
G1 F6323.777
G1 X115.062 Y117.537 E.03397
G1 X115.062 Y117 E.01609
G1 X113.894 Y118.168 E.04953
G1 X113.357 Y118.168 E.01609
G1 X115.062 Y116.463 E.07229
G1 X115.062 Y115.927 E.01609
G1 X112.82 Y118.168 E.09504
G1 X112.283 Y118.168 E.01609
G1 X115.062 Y115.39 E.1178
G1 X115.062 Y114.853 E.01609
G1 X111.747 Y118.168 E.14055
G1 X111.21 Y118.168 E.01609
G1 X115.062 Y114.316 E.16331
G1 X115.062 Y113.78 E.01609
G1 X110.673 Y118.168 E.18606
G1 X110.136 Y118.168 E.01609
G1 X115.062 Y113.243 E.20882
G1 X115.062 Y112.706 E.01609
G1 X109.6 Y118.168 E.23158
G1 X109.063 Y118.168 E.01609
G1 X115.062 Y112.17 E.25433
G1 X115.062 Y111.633 E.01609
G1 X108.526 Y118.168 E.27709
G1 X107.99 Y118.168 E.01609
G1 X115.062 Y111.096 E.29984
G1 X115.062 Y110.559 E.01609
G1 X107.453 Y118.168 E.3226
G1 X106.916 Y118.168 E.01609
G1 X115.062 Y110.023 E.34535
G1 X115.062 Y109.486 E.01609
G1 X106.379 Y118.168 E.36811
G1 X105.843 Y118.168 E.01609
G1 X115.062 Y108.949 E.39086
G1 X115.062 Y108.412 E.01609
M73 P87 R3
G1 X105.306 Y118.168 E.41362
G1 X104.769 Y118.168 E.01609
G1 X115.062 Y107.876 E.43638
G1 X115.062 Y107.789 E.00261
G1 X114.612 Y107.789 E.01348
G1 X104.233 Y118.168 E.44006
G1 X103.696 Y118.168 E.01609
G1 X114.075 Y107.789 E.44006
G1 X113.539 Y107.789 E.01609
G1 X103.159 Y118.168 E.44006
G1 X102.622 Y118.168 E.01609
G1 X113.002 Y107.789 E.44006
G1 X112.465 Y107.789 E.01609
G1 X102.086 Y118.168 E.44006
G1 X101.549 Y118.168 E.01609
G1 X111.928 Y107.789 E.44006
G1 X111.392 Y107.789 E.01609
G1 X101.012 Y118.168 E.44006
G1 X100.475 Y118.168 E.01609
G1 X110.855 Y107.789 E.44006
G1 X110.318 Y107.789 E.01609
G1 X107.673 Y110.434 E.11214
M73 P87 R2
G2 X107.67 Y109.9 I-2.938 J-.251 E.01602
G1 X109.782 Y107.789 E.08951
G1 X109.245 Y107.789 E.01609
G1 X107.561 Y109.472 E.07138
G2 X107.388 Y109.109 I-2.232 J.841 E.01208
G1 X108.708 Y107.789 E.05597
G1 X108.171 Y107.789 E.01609
G1 X107.158 Y108.802 E.04296
G2 X106.883 Y108.541 I-1.182 J.97 E.01141
G1 X107.635 Y107.789 E.03188
G1 X107.098 Y107.789 E.01609
G1 X106.549 Y108.337 E.02326
G2 X106.164 Y108.186 I-.752 J1.348 E.01245
G1 X106.561 Y107.789 E.01684
G1 X106.025 Y107.789 E.01609
G1 X105.695 Y108.118 E.01396
G2 X105.093 Y108.183 I-.139 J1.524 E.01828
G1 X105.488 Y107.789 E.01673
G1 X104.951 Y107.789 E.01609
G1 X95.935 Y116.805 E.38225
G1 X95.935 Y117.341 E.01609
G1 X103.63 Y109.646 E.32625
G2 X103.564 Y110.249 I2.233 J.549 E.01823
G1 X95.935 Y117.878 E.32346
G1 X95.935 Y118.168 E.0087
G1 X96.182 Y118.168 E.00739
G1 X103.632 Y110.718 E.31589
G2 X103.784 Y111.103 I1.498 J-.367 E.01245
G1 X96.718 Y118.168 E.29955
G1 X97.255 Y118.168 E.01609
G1 X103.987 Y111.436 E.28542
G2 X104.249 Y111.712 I1.231 J-.907 E.01141
G1 X97.792 Y118.168 E.27375
G1 X98.329 Y118.168 E.01609
G1 X104.555 Y111.941 E.264
G2 X104.919 Y112.115 I1.207 J-2.063 E.01208
G1 X98.865 Y118.168 E.25665
G1 X99.402 Y118.168 E.01609
G1 X105.346 Y112.224 E.25203
G2 X105.88 Y112.227 I.283 J-2.933 E.01602
G1 X99.769 Y118.338 E.25909
G1 X95.766 Y116.438 F30000
G1 F6323.777
G1 X104.414 Y107.789 E.36668
G1 X103.878 Y107.789 E.01609
G1 X95.935 Y115.731 E.33674
G1 X95.935 Y115.194 E.01609
G1 X103.341 Y107.789 E.31398
G1 X102.804 Y107.789 E.01609
G1 X95.935 Y114.658 E.29122
G1 X95.935 Y114.121 E.01609
G1 X102.267 Y107.789 E.26847
G1 X101.731 Y107.789 E.01609
G1 X95.935 Y113.584 E.24571
G1 X95.935 Y113.047 E.01609
G1 X101.194 Y107.789 E.22296
G1 X100.657 Y107.789 E.01609
G1 X95.935 Y112.511 E.2002
G1 X95.935 Y111.974 E.01609
G1 X100.121 Y107.789 E.17745
G1 X99.584 Y107.789 E.01609
G1 X95.935 Y111.437 E.15469
G1 X95.935 Y110.901 E.01609
G1 X99.047 Y107.789 E.13194
G1 X98.51 Y107.789 E.01609
G1 X95.935 Y110.364 E.10918
G1 X95.935 Y109.827 E.01609
G1 X97.974 Y107.789 E.08642
G1 X97.437 Y107.789 E.01609
G1 X95.935 Y109.29 E.06367
G1 X95.935 Y108.754 E.01609
G1 X96.9 Y107.789 E.04091
G1 X96.363 Y107.789 E.01609
G1 X95.766 Y108.387 E.02535
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F10740
G1 X153.409 Y107.352 E.55248
G1 X156.442 Y108.157 F30000
; LINE_WIDTH: 0.406532
G1 F6600.455
G1 X156.516 Y108.034 E.00413
; LINE_WIDTH: 0.43196
G1 F6169.043
G1 X156.591 Y107.911 E.00442
; LINE_WIDTH: 0.469105
G1 F5631.36
G1 X156.609 Y107.884 E.0011
G1 X156.851 Y107.861 E.00818
; LINE_WIDTH: 0.435687
G1 F6110.496
G3 X157.392 Y107.86 I.281 J5.685 E.01682
; LINE_WIDTH: 0.468369
G1 F5641.104
G3 X157.641 Y107.884 I-.245 J3.875 E.00841
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.446879
G1 F5941.197
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.40896
G1 F6556.669
G1 X157.808 Y108.158 E.00807
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.116621
G1 F10740
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149368
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.181444
G1 X157.358 Y111.978 E.00033
G1 X157.386 Y112.003 E.00041
; LINE_WIDTH: 0.146973
G1 X157.417 Y112.02 E.00029
; LINE_WIDTH: 0.116598
G1 X157.584 Y112.077 E.00103
G1 X157.358 Y111.978 F30000
; LINE_WIDTH: 0.187819
G1 F10740
G1 X156.892 Y111.979 E.00532
G1 X156.863 Y111.953 E.00045
; LINE_WIDTH: 0.146111
G1 X156.833 Y111.937 E.00027
; LINE_WIDTH: 0.116562
G1 X156.666 Y111.88 E.00103
G1 X154.724 Y112.453 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36544
G1 F7441.399
G1 X155.106 Y111.978 E.01553
G1 X154.724 Y111.504 E.01552
G1 X154.724 Y112.393 E.02267
G1 X153.997 Y117.748 F30000
; LINE_WIDTH: 0.41999
G1 F6364.869
G1 X154.16 Y117.82 E.0053
G1 X154.201 Y118.109 E.0087
G1 X160.006 Y118.109 E.17292
G1 X160.006 Y107.848 E.30565
G1 X158.336 Y107.848 E.04975
G1 X158.45 Y108.143 E.00942
G1 X158.364 Y108.278 E.00476
G1 X158.642 Y108.496 E.01054
G1 X158.95 Y108.896 E.01503
G1 X159.168 Y109.405 E.0165
G1 X159.247 Y109.954 E.0165
G1 X159.181 Y110.504 E.01652
G1 X158.974 Y111.018 E.0165
G1 X158.642 Y111.461 E.01648
G1 X158.207 Y111.803 E.01648
G1 X158.018 Y111.895 E.00625
G1 X158.044 Y112.015 E.00366
G1 X158.018 Y112.062 E.00161
G1 X158.207 Y112.154 E.00625
G1 X158.608 Y112.461 E.01503
G1 X158.95 Y112.896 E.01648
G1 X159.168 Y113.405 E.0165
G1 X159.248 Y113.949 E.01637
G1 X159.181 Y114.504 E.01665
G1 X158.974 Y115.018 E.01651
G1 X158.642 Y115.461 E.01648
G1 X158.207 Y115.803 E.01648
G1 X157.698 Y116.021 E.0165
G1 X157.15 Y116.101 E.0165
G1 X156.599 Y116.034 E.01652
G1 X156.085 Y115.828 E.0165
G1 X155.642 Y115.496 E.01649
G1 X155.3 Y115.061 E.01648
G1 X155.082 Y114.552 E.01649
G1 X155.004 Y114.003 E.01651
G1 X155.069 Y113.453 E.01649
G1 X155.276 Y112.939 E.01651
G1 X155.59 Y112.519 E.01561
G1 X156.043 Y112.154 E.01733
G1 X156.232 Y112.062 E.00626
G3 X156.245 Y111.9 I.11 J-.073 E.00524
G1 X156.043 Y111.803 E.00667
G1 X155.642 Y111.496 E.01503
G1 X155.3 Y111.061 E.01648
G1 X155.082 Y110.552 E.0165
G1 X155.004 Y110.003 E.01651
G1 X155.069 Y109.453 E.01649
G1 X155.276 Y108.939 E.01651
G1 X155.608 Y108.496 E.01649
G1 X155.887 Y108.277 E.01058
G1 X155.801 Y108.141 E.00478
G1 X155.904 Y107.848 E.00927
G1 X153.997 Y107.848 E.05679
G1 X153.997 Y117.688 E.29312
G1 X154.374 Y117.547 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X154.456 Y117.587 E.00271
G1 X154.507 Y117.732 E.00459
G1 X159.629 Y117.732 E.15257
G1 X159.629 Y115.224 E.07471
; LINE_WIDTH: 0.432933
G1 F6153.649
G1 X159.616 Y114.971 E.0078
; LINE_WIDTH: 0.458818
G1 F5770.653
G1 X159.603 Y114.719 E.00831
; LINE_WIDTH: 0.48512
G1 F5427.408
G1 X159.59 Y114.584 E.00473
; LINE_WIDTH: 0.478858
G1 F5505.376
G1 X159.456 Y114.873 E.01098
; LINE_WIDTH: 0.421122
G1 F6345.828
G1 X159.322 Y115.163 E.00953
G1 X158.941 Y115.691 E.01945
G1 X158.437 Y116.102 E.01945
G1 X157.843 Y116.37 E.01947
G1 X157.2 Y116.475 E.01946
G1 X156.549 Y116.408 E.01953
G1 X155.941 Y116.176 E.01946
G1 X155.413 Y115.795 E.01945
G1 X155.001 Y115.29 E.01945
; LINE_WIDTH: 0.412665
G1 F6490.96
G1 X154.741 Y114.694 E.01902
; LINE_WIDTH: 0.379486
G1 F7130.855
G1 X154.66 Y114.048 E.0173
G1 X154.709 Y113.406 E.01711
; LINE_WIDTH: 0.416242
G1 F6428.775
G1 X154.927 Y112.794 E.01916
G1 X155.291 Y112.29 E.01833
G1 X155.652 Y111.978 E.01406
G1 X155.291 Y111.667 E.01406
G1 X154.928 Y111.163 E.01833
G1 X154.741 Y110.693 E.0149
; LINE_WIDTH: 0.379481
G1 F7130.969
G1 X154.66 Y110.048 E.0173
G1 X154.709 Y109.406 E.01711
; LINE_WIDTH: 0.413774
G1 F6471.562
G1 X154.766 Y109.196 E.00639
; LINE_WIDTH: 0.4559
G1 F5811.419
G1 X154.824 Y108.986 E.00711
; LINE_WIDTH: 0.498027
G1 F5273.489
G1 X154.882 Y108.775 E.00784
; LINE_WIDTH: 0.550445
G1 F4728.838
G1 X154.949 Y108.626 E.00655
G1 X155.206 Y108.291 E.01695
G1 X154.44 Y108.291 E.0307
; LINE_WIDTH: 0.530117
G1 F4926.142
G1 X154.418 Y108.59 E.01155
; LINE_WIDTH: 0.48543
G1 F5423.606
G1 X154.396 Y108.89 E.01049
; LINE_WIDTH: 0.440744
G1 F6032.829
G1 X154.373 Y109.189 E.00943
; LINE_WIDTH: 0.403775
G1 F6650.871
G1 X154.359 Y109.539 E.00998
; LINE_WIDTH: 0.375706
G1 F7211.84
G2 X154.361 Y110.573 I7.858 J.504 E.02722
; LINE_WIDTH: 0.415
G1 F6450.229
G3 X154.367 Y113.189 I-84.734 J1.525 E.07688
; LINE_WIDTH: 0.379692
G1 F7126.495
G2 X154.361 Y114.573 I12.137 J.751 E.03685
; LINE_WIDTH: 0.416715
G1 F6420.641
G3 X154.374 Y117.487 I-74.639 J1.806 E.08604
G1 X154.756 Y117.35 F30000
; LINE_WIDTH: 0.425485
G1 F6273.457
G2 X156.136 Y117.346 I.589 J-35.131 E.04169
; LINE_WIDTH: 0.4581
G1 F5780.625
G1 X156.299 Y117.326 E.00539
; LINE_WIDTH: 0.502312
G1 F5224.306
G1 X156.462 Y117.305 E.00596
G2 X157.788 Y117.305 I.663 J-12.373 E.04816
; LINE_WIDTH: 0.4946
G1 F5313.496
G1 X158.204 Y117.33 E.01486
; LINE_WIDTH: 0.425517
G1 F6272.919
G2 X159.252 Y117.355 I.732 J-8.745 E.0317
G1 X159.252 Y115.906 E.04381
G1 X158.667 Y116.401 E.02317
G1 X157.993 Y116.732 E.02268
; LINE_WIDTH: 0.468523
G1 F5639.065
G1 X157.875 Y116.782 E.00431
; LINE_WIDTH: 0.502698
G1 F5219.914
G1 X157.757 Y116.831 E.00465
G1 X157.254 Y116.881 E.01836
G1 X156.493 Y116.831 E.02769
; LINE_WIDTH: 0.494585
G1 F5313.673
G1 X156.145 Y116.678 E.01359
; LINE_WIDTH: 0.422692
G1 F6319.586
G1 X155.796 Y116.524 E.01142
G1 X155.183 Y116.094 E.02247
G1 X154.751 Y115.584 E.02004
G2 X154.756 Y117.29 I91.422 J.623 E.05119
G1 X155.109 Y116.998 F30000
; LINE_WIDTH: 0.38038
G1 F7111.955
G1 X156.005 Y116.998 E.02391
G1 X155.378 Y116.694 E.01857
G1 X155.109 Y116.487 E.00907
G1 X155.109 Y116.938 E.01202
G1 X158.817 Y116.825 F30000
; LINE_WIDTH: 0.60476
G1 F4271.679
G2 X158.822 Y116.938 I-.031 J.058 E.01231
G1 X159.59 Y114.584 F30000
; LINE_WIDTH: 0.48071
G1 F5482.081
G1 X159.607 Y114.316 E.00927
; LINE_WIDTH: 0.456141
G1 F5808.039
G1 X159.625 Y114.049 E.00875
G1 X159.594 Y113.457 E.01935
G1 X158.598 Y111.978 F30000
; LINE_WIDTH: 0.429111
G1 F6214.549
G1 X158.941 Y112.266 E.01366
G1 X159.249 Y112.667 E.0154
G1 X159.537 Y113.252 E.01991
; LINE_WIDTH: 0.46163
G1 F5731.89
G1 X159.591 Y113.397 E.00512
G1 X159.629 Y112.733 E.022
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X159.629 Y111.224 E.04496
; LINE_WIDTH: 0.432933
G1 F6153.649
G1 X159.616 Y110.971 E.00779
; LINE_WIDTH: 0.458818
G1 F5770.653
G1 X159.603 Y110.719 E.00831
; LINE_WIDTH: 0.48512
G1 F5427.408
G1 X159.59 Y110.584 E.00473
; LINE_WIDTH: 0.478858
G1 F5505.376
G1 X159.456 Y110.873 E.01098
; LINE_WIDTH: 0.424598
G1 F6288.037
G1 X159.322 Y111.163 E.00961
G1 X158.941 Y111.691 E.01963
G1 X158.644 Y111.94 E.0117
G1 X159.253 Y111.932 F30000
; LINE_WIDTH: 0.47122
G1 F5603.549
G2 X159.246 Y112.025 I-.027 J.045 E.00719
G1 X159.59 Y110.584 F30000
; LINE_WIDTH: 0.48079
G1 F5481.079
G1 X159.607 Y110.319 E.00919
; LINE_WIDTH: 0.456341
G1 F5805.222
G1 X159.625 Y110.054 E.00868
G1 X159.595 Y109.458 E.01948
G1 X159.591 Y109.398 F30000
; LINE_WIDTH: 0.474088
G1 F5566.279
G2 X159.604 Y108.249 I-35.739 J-.975 E.03913
G1 X158.962 Y108.251 E.02188
G1 X159.268 Y108.652 E.01719
G1 X159.574 Y109.341 E.02567
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5566.279
G1 X159.268 Y108.652 E-.28641
G1 X158.962 Y108.251 E-.19178
G1 X159.604 Y108.249 E-.24412
G1 X159.603 Y108.348 E-.03769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/41
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z6.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X104.941 Y111.767
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X104.763 Y111.671 E.0065
G3 X105.405 Y108.462 I.869 J-1.495 E.13807
G1 X105.625 Y108.447 E.00708
G3 X104.998 Y111.784 I.007 J1.729 E.19578
G1 X105.116 Y111.409 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X105.457 Y108.851 I.516 J-1.233 E.10408
G1 X105.625 Y108.84 E.00501
G3 X105.172 Y111.431 I.007 J1.336 E.13925
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15508
G1 X104.563 Y110.993 E-.13318
G1 X104.467 Y110.848 E-.06612
G1 X104.389 Y110.69 E-.06679
G1 X104.298 Y110.353 E-.13252
G1 X104.287 Y110.178 E-.06659
G1 X104.333 Y109.832 E-.13285
G1 X104.339 Y109.815 E-.00686
; WIPE_END
G1 E-.04 F1800
G1 X111.968 Y110.039 Z6.6 F30000
G1 X156.055 Y111.338 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X155.908 Y111.196 E.00658
G3 X156.907 Y108.262 I1.225 J-1.22 E.12358
G1 X157.125 Y108.247 E.00702
G3 X156.107 Y111.367 I.008 J1.729 E.21027
G1 X156.315 Y111.035 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G3 X156.958 Y108.651 I.817 J-1.058 E.0937
G1 X157.125 Y108.64 E.00499
G3 X156.364 Y111.07 I.007 J1.336 E.14965
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15543
G1 X155.967 Y110.648 E-.06613
G1 X155.889 Y110.49 E-.06679
G1 X155.798 Y110.153 E-.13279
G1 X155.798 Y109.804 E-.13234
G1 X155.833 Y109.632 E-.06681
G1 X155.889 Y109.467 E-.06627
G1 X155.985 Y109.299 E-.07344
; WIPE_END
G1 E-.04 F1800
G1 X156.486 Y112.371 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X156.677 Y112.307 E.00646
G3 X156.898 Y112.262 I.447 J1.67 E.00726
G1 X157.116 Y112.248 E.00702
G3 X156.431 Y112.393 I.008 J1.729 E.32669
G1 X156.706 Y112.717 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.95 Y112.652 E.00753
G1 X157.117 Y112.641 E.00499
G3 X156.613 Y112.742 I.007 J1.337 E.23476
G1 X156.648 Y112.733 E.00107
; WIPE_START
M204 S10000
G1 X156.95 Y112.652 E-.11881
G1 X157.117 Y112.641 E-.06362
G1 X157.299 Y112.652 E-.06929
G1 X157.637 Y112.742 E-.13278
G1 X157.939 Y112.917 E-.13267
G1 X158.071 Y113.033 E-.06672
G1 X158.187 Y113.164 E-.06669
G1 X158.331 Y113.414 E-.10943
; WIPE_END
G1 E-.04 F1800
G1 X150.741 Y114.217 Z6.6 F30000
G1 X115.395 Y117.959 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X153.605 Y117.959 E1.2287
G1 X153.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.21843
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y107.456 E.3552
G1 X115.395 Y107.456 E.63647
G1 X115.395 Y117.899 E.33581
G1 X115.787 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.447 Y116.13 Z6.6 F30000
G1 X160.79 Y118.893 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
; WIPE_START
M204 S10000
G1 X158.79 Y118.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.809 Y118.23 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17872
G1 F15000
G1 X115.191 Y118.23 E.41425
G1 X115.231 Y117.578 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42501
G1 F6281.242
G1 X107.68 Y110.026 E.32234
G3 X107.654 Y110.541 I-2.113 J.151 E.01559
G1 X114.92 Y117.807 E.31018
G1 X114.858 Y117.807 E.00188
G1 X114.858 Y118.168 E.01089
G1 X114.741 Y118.168 E.00354
G1 X107.535 Y110.962 E.30758
G3 X107.345 Y111.313 I-2.738 J-1.257 E.01204
G1 X114.201 Y118.168 E.29263
G1 X113.66 Y118.168 E.01631
G1 X107.106 Y111.614 E.27977
G3 X106.814 Y111.862 I-1.788 J-1.807 E.01158
G1 X113.12 Y118.168 E.26917
G1 X112.58 Y118.168 E.01631
G1 X106.47 Y112.059 E.26077
G3 X106.063 Y112.192 I-.893 J-2.043 E.01295
G1 X112.039 Y118.168 E.25509
G1 X111.499 Y118.168 E.01631
G1 X105.57 Y112.239 E.25308
G3 X104.898 Y112.108 I.07 J-2.142 E.02075
G1 X110.958 Y118.168 E.2587
G1 X110.418 Y118.168 E.01631
G1 X100.039 Y107.789 E.44304
G1 X100.579 Y107.789 E.01631
M73 P88 R2
G1 X103.696 Y110.906 E.13305
G3 X103.563 Y110.233 I2.052 J-.754 E.02079
G1 X101.119 Y107.789 E.10432
G1 X101.66 Y107.789 E.01631
G1 X103.611 Y109.74 E.08331
G3 X103.745 Y109.333 I2.173 J.485 E.01295
G1 X102.2 Y107.789 E.06593
G1 X102.74 Y107.789 E.01631
G1 X103.941 Y108.99 E.05126
G3 X104.19 Y108.698 I2.058 J1.498 E.01158
G1 X103.281 Y107.789 E.03879
G1 X103.821 Y107.789 E.01631
G1 X104.491 Y108.458 E.02859
G3 X104.841 Y108.269 I1.61 J2.553 E.01204
G1 X104.361 Y107.789 E.02048
G1 X104.902 Y107.789 E.01631
G1 X105.264 Y108.151 E.01544
G3 X105.777 Y108.123 I.362 J1.977 E.01556
G1 X105.442 Y107.789 E.01429
G1 X105.983 Y107.789 E.01631
G1 X115.062 Y116.868 E.38754
G1 X115.062 Y116.328 E.01631
G1 X106.523 Y107.789 E.36448
G1 X107.063 Y107.789 E.01631
G1 X115.062 Y115.787 E.34141
G1 X115.062 Y115.247 E.01631
G1 X107.604 Y107.789 E.31835
G1 X108.144 Y107.789 E.01631
G1 X115.062 Y114.707 E.29528
G1 X115.062 Y114.166 E.01631
G1 X108.684 Y107.789 E.27222
G1 X109.225 Y107.789 E.01631
G1 X115.062 Y113.626 E.24915
G1 X115.062 Y113.085 E.01631
G1 X109.765 Y107.789 E.22609
G1 X110.305 Y107.789 E.01631
G1 X115.062 Y112.545 E.20302
G1 X115.062 Y112.005 E.01631
G1 X110.846 Y107.789 E.17996
G1 X111.386 Y107.789 E.01631
G1 X115.062 Y111.464 E.15689
G1 X115.062 Y110.924 E.01631
G1 X111.926 Y107.789 E.13383
G1 X112.467 Y107.789 E.01631
G1 X115.062 Y110.384 E.11076
G1 X115.062 Y109.843 E.01631
G1 X113.007 Y107.789 E.0877
G1 X113.548 Y107.789 E.01631
G1 X115.062 Y109.303 E.06463
G1 X115.062 Y108.763 E.01631
G1 X114.088 Y107.789 E.04157
G1 X114.628 Y107.789 E.01631
G1 X115.231 Y108.392 E.02575
G1 X115.591 Y107.352 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X153.409 Y107.352 E.55248
G1 X156.442 Y108.158 F30000
; LINE_WIDTH: 0.41503
G1 F6449.707
G1 X156.589 Y107.914 E.00835
; LINE_WIDTH: 0.469097
G1 F5631.461
G1 X156.609 Y107.884 E.00123
G1 X156.842 Y107.861 E.00791
; LINE_WIDTH: 0.435841
G1 F6108.103
G3 X157.392 Y107.86 I.289 J5.789 E.01708
; LINE_WIDTH: 0.46836
G1 F5641.218
G3 X157.641 Y107.884 I-.244 J3.869 E.0084
G1 X157.653 Y107.901 E.00071
; LINE_WIDTH: 0.44673
G1 F5943.399
G1 X157.664 Y107.919 E.00067
; LINE_WIDTH: 0.408775
G1 F6559.982
G1 X157.808 Y108.158 E.00806
; WIPE_START
G1 X157.664 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.584 Y111.88 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.116557
G1 F15000
G1 X157.417 Y111.937 E.00103
; LINE_WIDTH: 0.149144
G1 X157.38 Y111.958 E.00036
; LINE_WIDTH: 0.180799
G1 X157.357 Y111.978 E.00033
G1 X157.387 Y112.004 E.00043
; LINE_WIDTH: 0.146029
G1 X157.417 Y112.02 E.00027
; LINE_WIDTH: 0.116607
G1 X157.584 Y112.077 E.00103
G1 X157.357 Y111.978 F30000
; LINE_WIDTH: 0.187436
G1 F15000
G1 X156.893 Y111.979 E.00531
G1 X156.86 Y112.006 E.00048
; LINE_WIDTH: 0.144837
G1 X156.833 Y112.02 E.00025
; LINE_WIDTH: 0.116586
G1 X156.666 Y112.077 E.00103
G1 X154.724 Y112.453 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36545
G1 F7441.168
G1 X155.106 Y111.978 E.01553
G1 X154.724 Y111.504 E.01553
G1 X154.724 Y112.393 E.02267
G1 X153.997 Y117.748 F30000
; LINE_WIDTH: 0.41999
G1 F6364.871
G1 X154.16 Y117.82 E.0053
G1 X154.201 Y118.109 E.0087
G1 X160.006 Y118.109 E.17292
G1 X160.006 Y107.848 E.30565
G1 X158.327 Y107.848 E.05
G1 X158.45 Y108.143 E.00952
G1 X158.364 Y108.277 E.00476
G1 X158.642 Y108.496 E.01054
G1 X158.95 Y108.896 E.01503
G1 X159.168 Y109.405 E.0165
G1 X159.247 Y109.954 E.0165
G1 X159.181 Y110.504 E.01652
G1 X158.974 Y111.018 E.0165
G1 X158.642 Y111.461 E.01649
G1 X158.207 Y111.803 E.01648
G1 X158.018 Y111.895 E.00625
G1 X158.044 Y112.015 E.00366
G1 X158.018 Y112.062 E.00161
G1 X158.207 Y112.154 E.00626
G1 X158.608 Y112.461 E.01503
G1 X158.95 Y112.896 E.01648
G1 X159.168 Y113.405 E.0165
G1 X159.247 Y113.954 E.0165
G1 X159.181 Y114.504 E.01652
G1 X158.974 Y115.018 E.0165
G1 X158.642 Y115.461 E.01649
G1 X158.207 Y115.803 E.01648
G1 X157.698 Y116.021 E.0165
G1 X157.15 Y116.101 E.0165
G1 X156.599 Y116.034 E.01652
G1 X156.085 Y115.828 E.01649
G1 X155.642 Y115.496 E.01648
G1 X155.3 Y115.061 E.01648
G1 X155.082 Y114.552 E.0165
G1 X155.004 Y114.003 E.01651
G1 X155.069 Y113.453 E.01648
G1 X155.276 Y112.939 E.01651
G1 X155.59 Y112.519 E.0156
G1 X156.043 Y112.154 E.01734
G1 X156.245 Y112.057 E.00667
G1 X156.206 Y111.942 E.00362
G1 X156.232 Y111.895 E.00162
G1 X156.043 Y111.803 E.00625
G1 X155.642 Y111.496 E.01503
G1 X155.3 Y111.061 E.01648
G1 X155.082 Y110.552 E.0165
G1 X155.004 Y110.003 E.01651
G1 X155.069 Y109.453 E.01649
G1 X155.276 Y108.939 E.01651
G1 X155.608 Y108.496 E.01648
G1 X155.885 Y108.278 E.01052
G1 X155.798 Y108.141 E.00485
G1 X155.913 Y107.848 E.00939
G1 X153.997 Y107.848 E.05706
G1 X153.997 Y117.688 E.29312
G1 X154.374 Y117.547 F30000
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X154.456 Y117.587 E.00271
G1 X154.507 Y117.732 E.00459
G1 X159.629 Y117.732 E.15257
G1 X159.629 Y115.224 E.07472
; LINE_WIDTH: 0.432935
G1 F6153.61
G1 X159.616 Y114.971 E.00779
; LINE_WIDTH: 0.458825
G1 F5770.548
G1 X159.603 Y114.719 E.00831
; LINE_WIDTH: 0.485125
G1 F5427.347
G1 X159.59 Y114.584 E.00473
; LINE_WIDTH: 0.478858
G1 F5505.376
G1 X159.456 Y114.873 E.01098
; LINE_WIDTH: 0.421121
G1 F6345.834
G1 X159.323 Y115.163 E.00952
G1 X158.941 Y115.691 E.01946
G1 X158.437 Y116.102 E.01945
G1 X157.843 Y116.37 E.01947
G1 X157.2 Y116.475 E.01947
G1 X156.549 Y116.408 E.01953
G1 X155.941 Y116.176 E.01946
G1 X155.413 Y115.795 E.01945
G1 X155.001 Y115.29 E.01945
; LINE_WIDTH: 0.412665
G1 F6490.96
G1 X154.741 Y114.693 E.01903
; LINE_WIDTH: 0.379478
G1 F7131.019
G1 X154.66 Y114.048 E.0173
G1 X154.709 Y113.406 E.0171
; LINE_WIDTH: 0.416241
G1 F6428.796
G1 X154.928 Y112.794 E.01917
G1 X155.291 Y112.29 E.01833
G1 X155.652 Y111.978 E.01406
G1 X155.291 Y111.667 E.01406
G1 X154.927 Y111.163 E.01833
G1 X154.741 Y110.693 E.0149
; LINE_WIDTH: 0.379485
G1 F7130.87
G1 X154.66 Y110.048 E.0173
G1 X154.709 Y109.406 E.01711
; LINE_WIDTH: 0.413795
G1 F6471.183
G1 X154.767 Y109.196 E.00639
; LINE_WIDTH: 0.455925
G1 F5811.068
G1 X154.824 Y108.985 E.00711
; LINE_WIDTH: 0.498055
G1 F5273.161
G1 X154.882 Y108.775 E.00784
; LINE_WIDTH: 0.550446
G1 F4728.825
G1 X154.949 Y108.626 E.00655
G1 X155.206 Y108.291 E.01694
G1 X154.44 Y108.291 E.0307
; LINE_WIDTH: 0.530124
G1 F4926.075
G1 X154.418 Y108.59 E.01155
; LINE_WIDTH: 0.48545
G1 F5423.362
G1 X154.396 Y108.89 E.01049
; LINE_WIDTH: 0.440777
G1 F6032.322
G1 X154.373 Y109.189 E.00943
; LINE_WIDTH: 0.403808
G1 F6650.272
G1 X154.359 Y109.539 E.00998
; LINE_WIDTH: 0.375712
G1 F7211.713
G2 X154.361 Y110.573 I7.859 J.504 E.02722
; LINE_WIDTH: 0.414998
G1 F6450.261
G3 X154.367 Y113.189 I-84.741 J1.525 E.07689
; LINE_WIDTH: 0.379687
G1 F7126.6
G2 X154.361 Y114.573 I12.138 J.751 E.03684
; LINE_WIDTH: 0.416716
G1 F6420.629
G3 X154.374 Y117.487 I-74.779 J1.807 E.08604
G1 X154.756 Y117.35 F30000
; LINE_WIDTH: 0.4255
G1 F6273.2
G2 X156.136 Y117.346 I.588 J-35.088 E.04169
; LINE_WIDTH: 0.458148
G1 F5779.964
G1 X156.299 Y117.326 E.00539
; LINE_WIDTH: 0.502326
G1 F5224.142
G1 X156.462 Y117.305 E.00596
G2 X157.788 Y117.305 I.663 J-12.386 E.04817
; LINE_WIDTH: 0.494608
G1 F5313.408
G1 X158.204 Y117.33 E.01485
; LINE_WIDTH: 0.425519
G1 F6272.892
G2 X159.252 Y117.355 I.732 J-8.742 E.0317
G1 X159.252 Y115.906 E.04381
G1 X158.667 Y116.401 E.02318
G1 X157.993 Y116.733 E.02268
; LINE_WIDTH: 0.46854
G1 F5638.833
G1 X157.875 Y116.782 E.00431
; LINE_WIDTH: 0.502707
G1 F5219.807
G1 X157.757 Y116.831 E.00465
G1 X157.254 Y116.881 E.01837
G1 X156.493 Y116.831 E.02769
; LINE_WIDTH: 0.494615
G1 F5313.32
G1 X156.145 Y116.678 E.01358
; LINE_WIDTH: 0.422692
G1 F6319.581
G1 X155.796 Y116.524 E.01142
G1 X155.183 Y116.094 E.02247
G1 X154.751 Y115.584 E.02005
G2 X154.756 Y117.29 I91.339 J.624 E.05119
G1 X155.109 Y116.998 F30000
; LINE_WIDTH: 0.38037
G1 F7112.164
G1 X156.005 Y116.998 E.02391
G1 X155.378 Y116.694 E.01857
G1 X155.109 Y116.487 E.00907
G1 X155.109 Y116.938 E.01202
G1 X158.817 Y116.825 F30000
; LINE_WIDTH: 0.60474
G1 F4271.831
G2 X158.822 Y116.938 I-.031 J.058 E.01231
G1 X159.59 Y114.584 F30000
; LINE_WIDTH: 0.48079
G1 F5481.079
G1 X159.607 Y114.319 E.00919
; LINE_WIDTH: 0.456333
G1 F5805.34
G1 X159.625 Y114.054 E.00868
G1 X159.595 Y113.458 E.01947
G1 X158.598 Y111.979 F30000
; LINE_WIDTH: 0.429061
G1 F6215.355
G1 X158.941 Y112.266 E.01366
G1 X159.249 Y112.666 E.01539
G1 X159.537 Y113.252 E.01991
; LINE_WIDTH: 0.461562
G1 F5732.829
G1 X159.591 Y113.398 E.00515
G1 X159.629 Y112.733 E.02202
; LINE_WIDTH: 0.41999
G1 F6364.866
G1 X159.629 Y111.224 E.04496
; LINE_WIDTH: 0.432933
G1 F6153.649
G1 X159.616 Y110.971 E.00779
; LINE_WIDTH: 0.458818
G1 F5770.653
G1 X159.603 Y110.719 E.00831
; LINE_WIDTH: 0.48512
G1 F5427.408
G1 X159.59 Y110.584 E.00473
; LINE_WIDTH: 0.478858
G1 F5505.376
G1 X159.456 Y110.873 E.01098
; LINE_WIDTH: 0.424597
G1 F6288.051
G1 X159.323 Y111.163 E.00961
G1 X158.941 Y111.691 E.01963
G1 X158.644 Y111.94 E.0117
G1 X159.253 Y111.932 F30000
; LINE_WIDTH: 0.47122
G1 F5603.549
G2 X159.246 Y112.025 I-.027 J.045 E.00719
G1 X159.59 Y110.584 F30000
; LINE_WIDTH: 0.480785
G1 F5481.141
G1 X159.607 Y110.319 E.00919
; LINE_WIDTH: 0.45633
G1 F5805.382
G1 X159.625 Y110.054 E.00868
G1 X159.595 Y109.458 E.01948
G1 X159.591 Y109.398 F30000
; LINE_WIDTH: 0.474089
G1 F5566.263
G2 X159.604 Y108.249 I-35.74 J-.975 E.03913
G1 X158.962 Y108.251 E.02188
G1 X159.268 Y108.652 E.01719
G1 X159.574 Y109.341 E.02567
; WIPE_START
G1 X159.268 Y108.652 E-.28645
G1 X158.962 Y108.251 E-.19175
G1 X159.604 Y108.249 E-.2441
G1 X159.603 Y108.348 E-.03771
; WIPE_END
G1 E-.04 F1800
G1 X152.121 Y109.857 Z6.6 F30000
G1 X110.047 Y118.338 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.42501
G1 F6281.242
G1 X99.498 Y107.789 E.45029
G1 X98.958 Y107.789 E.01631
G1 X109.337 Y118.168 E.44304
G1 X108.797 Y118.168 E.01631
G1 X98.418 Y107.789 E.44304
G1 X97.877 Y107.789 E.01631
G1 X108.257 Y118.168 E.44304
G1 X107.716 Y118.168 E.01631
G1 X97.337 Y107.789 E.44304
G1 X96.796 Y107.789 E.01631
G1 X107.176 Y118.168 E.44304
G1 X106.636 Y118.168 E.01631
G1 X96.256 Y107.789 E.44304
G1 X95.935 Y107.789 E.00968
G1 X95.935 Y108.008 E.00662
G1 X106.095 Y118.168 E.43368
G1 X105.555 Y118.168 E.01631
G1 X95.935 Y108.549 E.41061
G1 X95.935 Y109.089 E.01631
G1 X105.015 Y118.168 E.38755
G1 X104.474 Y118.168 E.01631
G1 X95.935 Y109.629 E.36448
G1 X95.935 Y110.17 E.01631
G1 X103.934 Y118.168 E.34142
G1 X103.394 Y118.168 E.01631
G1 X95.935 Y110.71 E.31835
G1 X95.935 Y111.25 E.01631
G1 X102.853 Y118.168 E.29529
G1 X102.313 Y118.168 E.01631
G1 X95.935 Y111.791 E.27222
G1 X95.935 Y112.331 E.01631
G1 X101.772 Y118.168 E.24916
G1 X101.232 Y118.168 E.01631
G1 X95.935 Y112.871 E.22609
G1 X95.935 Y113.412 E.01631
G1 X100.692 Y118.168 E.20303
G1 X100.151 Y118.168 E.01631
G1 X95.935 Y113.952 E.17996
G1 X95.935 Y114.492 E.01631
G1 X99.611 Y118.168 E.1569
G1 X99.071 Y118.168 E.01631
G1 X95.935 Y115.033 E.13383
G1 X95.935 Y115.573 E.01631
G1 X98.53 Y118.168 E.11077
G1 X97.99 Y118.168 E.01631
G1 X95.935 Y116.114 E.0877
G1 X95.935 Y116.654 E.01631
G1 X97.45 Y118.168 E.06464
G1 X96.909 Y118.168 E.01631
G1 X95.935 Y117.194 E.04158
G1 X95.935 Y117.735 E.01631
G1 X96.539 Y118.338 E.02575
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6281.242
G1 X95.935 Y117.735 E-.32423
G1 X95.935 Y117.194 E-.20534
G1 X96.364 Y117.623 E-.23043
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/41
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S216.75
G17
G3 Z6.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X115.787 Y117.566
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X115.787 Y107.64 E.29566
G1 X153.213 Y107.64 E1.11479
G1 X153.213 Y117.566 E.29566
G1 X115.847 Y117.566 E1.11301
; WIPE_START
M204 S10000
G1 X115.835 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.718 Y112.808 Z6.8 F30000
G1 X105.115 Y111.411 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G3 X105.45 Y108.852 I.513 J-1.234 E.10408
G1 X105.625 Y108.84 E.00522
G3 X105.171 Y111.433 I.003 J1.337 E.13906
; WIPE_START
M204 S10000
G1 X104.811 Y111.24 E-.15509
G1 X104.563 Y110.993 E-.13316
G1 X104.467 Y110.848 E-.06617
G1 X104.389 Y110.69 E-.06676
G1 X104.298 Y110.353 E-.13253
G1 X104.287 Y110.178 E-.06661
G1 X104.333 Y109.832 E-.13281
G1 X104.339 Y109.815 E-.00686
; WIPE_END
G1 E-.04 F1800
G1 X110.681 Y114.061 Z6.8 F30000
G1 X117.315 Y118.501 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
G1 X117.315 Y117.959 E.01746
G1 X151.685 Y117.959 E1.10522
G1 X151.685 Y118.501 E.01746
G1 X117.375 Y118.501 E1.10329
; WIPE_START
G1 X117.315 Y117.959 E-.20755
G1 X118.769 Y117.959 E-.55246
; WIPE_END
G1 E-.04 F1800
G1 X126.4 Y118.058 Z6.8 F30000
G1 X160.398 Y118.501 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F5895.652
G1 X160.081 Y118.501 E.0102
G1 X160.081 Y107.456 E.3552
G1 X160.398 Y107.456 E.0102
G1 X160.398 Y118.441 E.35327
; WIPE_START
G1 X160.081 Y118.501 E-.12266
G1 X160.081 Y116.824 E-.63734
; WIPE_END
G1 E-.04 F1800
G1 X156.703 Y112.718 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X156.95 Y112.652 E.00762
G1 X157.125 Y112.64 E.00522
G3 X156.614 Y112.743 I.003 J1.337 E.23456
G1 X156.645 Y112.734 E.00097
; WIPE_START
M204 S10000
G1 X156.95 Y112.652 E-.12008
G1 X157.125 Y112.64 E-.06661
G1 X157.3 Y112.652 E-.0666
G1 X157.637 Y112.742 E-.13251
G1 X157.939 Y112.917 E-.13269
G1 X158.071 Y113.033 E-.06669
G1 X158.187 Y113.164 E-.06673
G1 X158.329 Y113.411 E-.10809
; WIPE_END
G1 E-.04 F1800
G1 X156.314 Y111.037 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G3 X156.95 Y108.652 I.814 J-1.06 E.09368
G1 X157.125 Y108.64 E.00522
G3 X156.362 Y111.072 I.003 J1.337 E.14946
; WIPE_START
M204 S10000
G1 X156.063 Y110.793 E-.15551
G1 X155.967 Y110.648 E-.06613
G1 X155.889 Y110.49 E-.06681
G1 X155.798 Y110.153 E-.13278
G1 X155.798 Y109.804 E-.13236
G1 X155.833 Y109.632 E-.06679
G1 X155.889 Y109.467 E-.06628
G1 X155.985 Y109.3 E-.07335
; WIPE_END
G1 E-.04 F1800
G1 X159.403 Y116.124 Z6.8 F30000
G1 X160.79 Y118.893 Z6.8
M73 P89 R2
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S5000
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y107.063 E.35238
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.833 E.35059
M204 S10000
G1 X159.885 Y118.468 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.50215
G1 F5226.14
G1 X151.881 Y118.468 E.29033
G1 X151.482 Y118.23 F30000
; LINE_WIDTH: 0.17872
G1 F15000
G1 X117.518 Y118.23 E.36433
G1 X117.119 Y118.468 F30000
; LINE_WIDTH: 0.50215
G1 F5226.14
G1 X95.406 Y118.468 E.78765
G1 X115.791 Y118.212 F30000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S2000
G1 X116.229 Y117.774 E.01845
G1 X115.696 Y117.774
G1 X115.258 Y118.212 E.01845
G1 X114.724 Y118.212
G1 X115.58 Y117.357 E.03602
G1 X115.58 Y116.823
G1 X114.191 Y118.212 E.05848
G1 X113.658 Y118.212
G1 X115.58 Y116.29 E.08095
G1 X115.58 Y115.757
G1 X113.125 Y118.212 E.10341
G1 X112.591 Y118.212
G1 X115.58 Y115.224 E.12587
G1 X115.58 Y114.69
G1 X112.058 Y118.212 E.14834
G1 X111.525 Y118.212
G1 X115.58 Y114.157 E.1708
G1 X115.58 Y113.624
G1 X110.992 Y118.212 E.19326
G1 X110.458 Y118.212
G1 X115.58 Y113.091 E.21573
G1 X115.58 Y112.557
G1 X109.925 Y118.212 E.23819
G1 X109.392 Y118.212
G1 X115.58 Y112.024 E.26065
G1 X115.58 Y111.491
G1 X108.859 Y118.212 E.28312
G1 X108.325 Y118.212
G1 X115.58 Y110.958 E.30558
G1 X115.58 Y110.424
G1 X107.792 Y118.212 E.32804
G1 X107.259 Y118.212
G1 X115.58 Y109.891 E.35051
G1 X115.58 Y109.358
G1 X106.726 Y118.212 E.37297
G1 X106.192 Y118.212
G1 X115.58 Y108.825 E.39543
G1 X115.58 Y108.291
G1 X105.659 Y118.212 E.4179
G1 X105.126 Y118.212
G1 X115.58 Y107.758 E.44036
G1 X115.533 Y107.271
G1 X104.593 Y118.212 E.46088
G1 X104.059 Y118.212
G1 X115 Y107.271 E.46088
G1 X114.467 Y107.271
G1 X103.526 Y118.212 E.46088
G1 X102.993 Y118.212
G1 X113.934 Y107.271 E.46088
G1 X113.4 Y107.271
G1 X102.46 Y118.212 E.46088
G1 X101.926 Y118.212
G1 X112.867 Y107.271 E.46088
G1 X112.334 Y107.271
G1 X101.393 Y118.212 E.46088
G1 X100.86 Y118.212
G1 X111.801 Y107.271 E.46088
G1 X111.267 Y107.271
G1 X100.327 Y118.212 E.46088
G1 X99.793 Y118.212
G1 X110.734 Y107.271 E.46088
G1 X110.201 Y107.271
G1 X107.162 Y110.31 E.12801
G1 X107.125 Y109.813
G1 X109.668 Y107.271 E.10711
G1 X109.134 Y107.271
G1 X106.975 Y109.43 E.09095
G1 X106.75 Y109.122
G1 X108.601 Y107.271 E.07798
G1 X108.068 Y107.271
G1 X106.458 Y108.88 E.0678
G1 X106.096 Y108.709
G1 X107.535 Y107.271 E.0606
G1 X107.001 Y107.271
G1 X105.639 Y108.633 E.05738
G1 X104.945 Y108.794
G1 X106.468 Y107.271 E.06417
; WIPE_START
M204 S10000
G1 X105.054 Y108.685 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.756 Y111.716 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X99.26 Y118.212 E.27365
G1 X98.727 Y118.212
G1 X105.26 Y111.679 E.27521
G1 X104.876 Y111.529
G1 X98.193 Y118.212 E.28152
G1 X97.66 Y118.212
G1 X104.569 Y111.303 E.29102
G1 X104.327 Y111.012
G1 X97.127 Y118.212 E.30329
G1 X96.594 Y118.212
G1 X104.156 Y110.65 E.31856
G1 X104.08 Y110.193
G1 X96.06 Y118.212 E.3378
G1 X95.527 Y118.212
G1 X104.241 Y109.498 E.36705
; WIPE_START
M204 S10000
G1 X102.827 Y110.912 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.935 Y107.271 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X95.417 Y117.788 E.44304
G1 X95.417 Y117.255
G1 X105.402 Y107.271 E.42058
G1 X104.868 Y107.271
G1 X95.417 Y116.722 E.39812
G1 X95.417 Y116.189
G1 X104.335 Y107.271 E.37565
G1 X103.802 Y107.271
G1 X95.417 Y115.655 E.35319
G1 X95.417 Y115.122
G1 X103.269 Y107.271 E.33073
G1 X102.735 Y107.271
G1 X95.417 Y114.589 E.30826
G1 X95.417 Y114.056
G1 X102.202 Y107.271 E.2858
G1 X101.669 Y107.271
G1 X95.417 Y113.522 E.26334
G1 X95.417 Y112.989
G1 X101.136 Y107.271 E.24087
G1 X100.602 Y107.271
G1 X95.417 Y112.456 E.21841
G1 X95.417 Y111.923
G1 X100.069 Y107.271 E.19595
G1 X99.536 Y107.271
G1 X95.417 Y111.389 E.17349
G1 X95.417 Y110.856
G1 X99.003 Y107.271 E.15102
G1 X98.469 Y107.271
G1 X95.417 Y110.323 E.12856
G1 X95.417 Y109.789
G1 X97.936 Y107.271 E.1061
G1 X97.403 Y107.271
G1 X95.417 Y109.256 E.08363
G1 X95.417 Y108.723
G1 X96.869 Y107.271 E.06117
G1 X96.336 Y107.271
G1 X95.417 Y108.19 E.03871
G1 X95.417 Y107.656
G1 X95.803 Y107.271 E.01624
; WIPE_START
M204 S10000
G1 X95.417 Y107.656 E-.20721
G1 X95.417 Y108.19 E-.20264
G1 X96.069 Y107.538 E-.35015
; WIPE_END
G1 E-.04 F1800
G1 X103.084 Y110.544 Z6.8 F30000
G1 X105.961 Y111.777 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122498
G1 F15000
G1 X105.744 Y111.703 E.00145
G1 X106.053 Y111.661 F30000
; LINE_WIDTH: 0.0917559
G1 F15000
G3 X105.83 Y111.79 I-2.029 J-3.234 E.00099
; WIPE_START
G1 X106.053 Y111.661 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.106 Y109.923 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.106368
G1 F15000
G2 X104.007 Y110.12 I2.923 J1.598 E.00111
; WIPE_START
G1 X104.106 Y109.923 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.954 Y108.803 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.201326
G1 F15000
G1 X104.812 Y108.785 E.0018
G1 X104.651 Y108.916 E.00259
; LINE_WIDTH: 0.171112
G1 X104.357 Y109.212 E.00422
; LINE_WIDTH: 0.202003
G1 X104.231 Y109.365 E.00249
G1 X104.25 Y109.507 E.0018
; WIPE_START
G1 X104.231 Y109.365 E-.3192
G1 X104.357 Y109.212 E-.4408
; WIPE_END
G1 E-.04 F1800
G1 X106.061 Y108.699 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0949825
G1 F15000
G2 X105.921 Y108.618 I-1.21 J1.91 E.00066
; WIPE_START
G1 X106.061 Y108.699 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.237 Y110.384 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0916889
G1 F15000
G3 X107.107 Y110.606 I-3.721 J-2.025 E.00099
G1 X107.224 Y110.515 F30000
; LINE_WIDTH: 0.12239
G1 F15000
G1 X107.149 Y110.297 E.00144
; WIPE_START
G1 X107.224 Y110.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.039 Y115.458 Z6.8 F30000
G1 X116.301 Y118.231 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.355779
G1 F7671.204
G2 X116.512 Y117.904 I-.463 J-.53 E.00973
; LINE_WIDTH: 0.321499
G1 F8615.164
G1 X116.44 Y117.855 E.00191
; LINE_WIDTH: 0.28142
G1 F10062.929
G1 X116.369 Y117.805 E.00164
; LINE_WIDTH: 0.24134
G1 F12095.573
G1 X116.297 Y117.755 E.00136
G1 X116.908 Y117.948 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50814
G1 F5158.85
G2 X116.906 Y118.048 I-.029 J.05 E.00882
; WIPE_START
G1 X116.85 Y118.048 E-.18546
G1 X116.82 Y117.998 E-.19152
G1 X116.85 Y117.948 E-.19153
G1 X116.908 Y117.948 E-.19149
; WIPE_END
G1 E-.04 F1800
G1 X117.06 Y110.317 Z6.8 F30000
G1 X117.119 Y107.352 Z6.8
M73 P90 R2
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F12977.183
G1 X151.881 Y107.352 E.50784
; WIPE_START
G1 X149.881 Y107.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.133 Y112.89 Z6.8 F30000
G1 X159.858 Y117.872 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S2000
G1 X159.518 Y118.212 E.01433
G1 X158.985 Y118.212
G1 X159.858 Y117.338 E.03679
G1 X159.858 Y116.805
G1 X158.452 Y118.212 E.05926
G1 X157.918 Y118.212
G1 X159.858 Y116.272 E.08172
G1 X159.858 Y115.739
G1 X157.385 Y118.212 E.10418
G1 X156.852 Y118.212
G1 X159.858 Y115.205 E.12665
G1 X159.858 Y114.672
G1 X156.319 Y118.212 E.14911
G1 X155.785 Y118.212
G1 X159.858 Y114.139 E.17157
G1 X159.858 Y113.606
G1 X155.252 Y118.212 E.19404
G1 X154.719 Y118.212
G1 X157.443 Y115.488 E.11474
G1 X156.892 Y115.505
G1 X154.186 Y118.212 E.11402
G1 X153.652 Y118.212
G1 X156.483 Y115.382 E.11922
G1 X156.153 Y115.178
G1 X153.119 Y118.212 E.12781
G1 X153.024 Y117.774
G1 X152.586 Y118.212 E.01845
G1 X153.42 Y117.377
G1 X155.89 Y114.907 E.10404
G1 X155.696 Y114.568
G1 X153.42 Y116.844 E.09586
G1 X153.42 Y116.311
G1 X155.59 Y114.141 E.09139
G1 X155.638 Y113.559
G1 X153.42 Y115.777 E.09343
; WIPE_START
M204 S10000
G1 X154.835 Y114.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.635 Y114.296 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X159.858 Y113.072 E.05155
G1 X159.858 Y112.539
G1 X158.652 Y113.746 E.05083
G1 X158.528 Y113.336
G1 X159.858 Y112.006 E.05604
G1 X159.858 Y111.473
G1 X158.324 Y113.007 E.06462
G1 X158.054 Y112.744
G1 X159.858 Y110.939 E.07601
G1 X159.858 Y110.406
G1 X157.715 Y112.55 E.0903
G1 X157.288 Y112.443
G1 X159.858 Y109.873 E.10828
G1 X159.858 Y109.34
G1 X158.48 Y110.718 E.05806
G1 X158.67 Y109.994
G1 X159.858 Y108.806 E.05004
G1 X159.858 Y108.273
G1 X158.602 Y109.53 E.05294
G1 X158.435 Y109.163
G1 X159.858 Y107.74 E.05995
G1 X159.794 Y107.271
G1 X158.197 Y108.868 E.06726
G1 X157.893 Y108.638
G1 X159.261 Y107.271 E.05759
G1 X158.727 Y107.271
G1 X157.515 Y108.483 E.05108
G1 X157.026 Y108.439
G1 X158.194 Y107.271 E.0492
G1 X157.661 Y107.271
G1 X156.149 Y108.783 E.0637
; WIPE_START
M204 S10000
G1 X157.563 Y107.369 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.864 Y111.333 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X156.706 Y112.492 E.0488
G1 X157.142 Y111.523
G1 X153.42 Y115.244 E.15677
G1 X153.42 Y114.711
G1 X156.676 Y111.455 E.13715
G1 X156.309 Y111.289
G1 X153.42 Y114.178 E.1217
G1 X153.42 Y113.644
G1 X156.014 Y111.051 E.10926
G1 X155.785 Y110.747
G1 X153.42 Y113.111 E.09959
G1 X153.42 Y112.578
G1 X155.63 Y110.368 E.09308
G1 X155.586 Y109.879
G1 X153.42 Y112.045 E.09122
G1 X153.42 Y111.511
G1 X155.929 Y109.002 E.10569
; WIPE_START
M204 S10000
G1 X154.515 Y110.416 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.42 Y110.978 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F6364.704
M204 S2000
G1 X157.128 Y107.271 E.15616
G1 X156.594 Y107.271
G1 X153.42 Y110.445 E.1337
G1 X153.42 Y109.912
G1 X156.061 Y107.271 E.11124
G1 X155.528 Y107.271
G1 X153.42 Y109.378 E.08877
G1 X153.42 Y108.845
G1 X154.995 Y107.271 E.06631
G1 X154.461 Y107.271
G1 X153.42 Y108.312 E.04385
G1 X153.42 Y107.779
G1 X153.928 Y107.271 E.02138
; WIPE_START
M204 S10000
G1 X153.42 Y107.779 E-.27281
G1 X153.42 Y108.312 E-.20264
G1 X153.95 Y107.782 E-.28455
; WIPE_END
G1 E-.04 F1800
G1 X152.761 Y115.322 Z6.8 F30000
G1 X152.378 Y117.755 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.098894
G1 F15000
G1 X152.438 Y118.093 E.00152
G2 X152.541 Y118.231 I.807 J-.499 E.00076
; WIPE_START
G1 X152.438 Y118.093 E-.25384
G1 X152.378 Y117.755 E-.50616
; WIPE_END
G1 E-.04 F1800
G1 X155.845 Y113.115 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.0968474
G1 F15000
G1 X155.775 Y113.201 E.00047
; LINE_WIDTH: 0.122336
G1 X155.716 Y113.283 E.00064
; LINE_WIDTH: 0.16606
G2 X155.572 Y113.493 I3.033 J2.241 E.00247
; WIPE_START
G1 X155.716 Y113.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.809 Y115.361 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.111328
G1 F15000
G3 X157.516 Y115.561 I-3.096 J-4.219 E.00192
; WIPE_START
G1 X157.809 Y115.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.708 Y114.369 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.111311
G1 F15000
G3 X158.507 Y114.663 I-4.425 J-2.806 E.00192
; WIPE_START
G1 X158.708 Y114.369 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.61 Y112.449 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.17934
G1 F15000
G1 X156.512 Y112.51 E.00124
; LINE_WIDTH: 0.155145
G1 X156.43 Y112.569 E.0009
; LINE_WIDTH: 0.121669
G1 X156.344 Y112.631 E.00066
; LINE_WIDTH: 0.0965097
G1 X156.262 Y112.698 E.00045
; WIPE_START
G1 X156.344 Y112.631 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.542 Y110.78 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.202635
G1 F15000
G1 X158.258 Y111.105 E.00545
G1 X157.927 Y111.396 E.00556
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X158.258 Y111.105 E-.38386
G1 X158.542 Y110.78 E-.37614
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/41
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S226.95
G17
G3 Z6.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2930
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2930
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2930
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z7 F30000
G1 X95.406 Y107.352 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2930
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2930
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2930
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/41
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z7 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
M73 P91 R2
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z7.2 F30000
G1 X95.406 Y107.352 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/41
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z7.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
M73 P91 R1
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
M73 P92 R1
G1 E-.04 F1800
G1 X96.161 Y110.777 Z7.4 F30000
G1 X95.406 Y107.352 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/41
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z7.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z7.6 F30000
G1 X95.406 Y107.352 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
M73 P93 R1
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/41
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z7.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z7.8 F30000
G1 X95.406 Y107.352 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/41
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z7.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
M73 P94 R1
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z8 F30000
G1 X95.406 Y107.352 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/41
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
M73 P95 R1
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z8.2 F30000
G1 X95.406 Y107.352 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
M73 P95 R0
G1 E-.04 F1800
; layer num/total_layer_count: 40/41
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z8.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.605 Y117.959
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2926
G1 X159.605 Y107.456 E.33774
G1 X160.398 Y107.456 E.0255
G1 X160.398 Y118.501 E.3552
G1 X95.602 Y118.501 E2.0836
G1 X95.602 Y117.959 E.01746
G1 X159.545 Y117.959 E2.05618
G1 X159.213 Y117.566 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2926
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
M73 P96 R0
G1 X159.153 Y117.566 E1.90464
M204 S10000
G1 X159.937 Y118.166 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.178771
G1 F2926
G1 X159.809 Y118.23 E.00154
G1 X95.806 Y118.23 E.68683
; WIPE_START
G1 F15000
G1 X97.806 Y118.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.161 Y110.777 Z8.4 F30000
G1 X95.406 Y107.352 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.22786
G1 F2926
G1 X159.409 Y107.352 E.93501
G1 X160.002 Y107.659 F30000
; LINE_WIDTH: 0.42872
G1 F2926
G1 X160.002 Y118.298 E.32422
G1 X159.937 Y118.166 F30000
; LINE_WIDTH: 0.24662
G1 F2926
G1 X160.066 Y118.101 E.00231
; LINE_WIDTH: 0.291887
G1 X160.194 Y118.037 E.00283
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9639.846
G1 X160.066 Y118.101 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/41
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
G17
G3 Z8.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 122
G1 X159.213 Y117.566
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3204
M204 S5000
G1 X159.213 Y107.64 E.29566
G1 X95.21 Y107.64 E1.90643
G1 X95.21 Y107.063 E.01719
G1 X160.79 Y107.063 E1.9534
G1 X160.79 Y118.893 E.35238
G1 X95.21 Y118.893 E1.9534
G1 X95.21 Y117.566 E.03953
G1 X159.153 Y117.566 E1.90464
; WIPE_START
G1 F6364.704
M204 S10000
G1 X159.165 Y115.567 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.392 Y107.937 Z8.6 F30000
G1 X159.409 Y107.352 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.22786
G1 F3204
G1 X95.406 Y107.352 E.93501
; WIPE_START
G1 F12977.183
M73 P97 R0
G1 X97.406 Y107.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.038 Y107.342 Z8.6 F30000
G1 X160.197 Y107.271 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3204
M204 S2000
G1 X160.583 Y107.657 E.01625
G1 X160.583 Y108.19
G1 X159.664 Y107.271 E.03871
G1 X159.533 Y107.673
G1 X160.583 Y108.723 E.04422
G1 X160.583 Y109.256
G1 X159.42 Y108.094 E.04896
G1 X159.42 Y108.627
G1 X160.583 Y109.79 E.04896
G1 X160.583 Y110.323
G1 X159.42 Y109.161 E.04896
G1 X159.42 Y109.694
G1 X160.583 Y110.856 E.04896
G1 X160.583 Y111.389
G1 X159.42 Y110.227 E.04896
G1 X159.42 Y110.76
G1 X160.583 Y111.923 E.04896
G1 X160.583 Y112.456
G1 X159.42 Y111.294 E.04896
G1 X159.42 Y111.827
G1 X160.583 Y112.989 E.04896
G1 X160.583 Y113.522
G1 X159.42 Y112.36 E.04896
G1 X159.42 Y112.893
G1 X160.583 Y114.056 E.04896
G1 X160.583 Y114.589
G1 X159.42 Y113.427 E.04896
G1 X159.42 Y113.96
G1 X160.583 Y115.122 E.04896
G1 X160.583 Y115.655
G1 X159.42 Y114.493 E.04896
G1 X159.42 Y115.026
G1 X160.583 Y116.189 E.04896
G1 X160.583 Y116.722
G1 X159.42 Y115.56 E.04896
G1 X159.42 Y116.093
G1 X160.583 Y117.255 E.04896
G1 X160.583 Y117.788
G1 X159.42 Y116.626 E.04896
G1 X159.42 Y117.159
G1 X160.583 Y118.322 E.04896
G1 X160.414 Y118.686
G1 X159.42 Y117.693 E.04184
G1 X158.968 Y117.774
G1 X159.88 Y118.686 E.03843
G1 X159.347 Y118.686
G1 X158.435 Y117.774 E.03843
M73 P98 R0
G1 X157.902 Y117.774
G1 X158.814 Y118.686 E.03843
G1 X158.281 Y118.686
G1 X157.368 Y117.774 E.03843
G1 X156.835 Y117.774
G1 X157.747 Y118.686 E.03843
G1 X157.214 Y118.686
G1 X156.302 Y117.774 E.03843
G1 X155.769 Y117.774
G1 X156.681 Y118.686 E.03843
G1 X156.148 Y118.686
G1 X155.235 Y117.774 E.03843
G1 X154.702 Y117.774
G1 X155.614 Y118.686 E.03843
G1 X155.081 Y118.686
G1 X154.169 Y117.774 E.03843
G1 X153.636 Y117.774
G1 X154.548 Y118.686 E.03843
G1 X154.015 Y118.686
G1 X153.102 Y117.774 E.03843
G1 X152.569 Y117.774
G1 X153.481 Y118.686 E.03843
G1 X152.948 Y118.686
G1 X152.036 Y117.774 E.03843
G1 X151.503 Y117.774
G1 X152.415 Y118.686 E.03843
G1 X151.882 Y118.686
G1 X150.969 Y117.774 E.03843
G1 X150.436 Y117.774
G1 X151.348 Y118.686 E.03843
G1 X150.815 Y118.686
G1 X149.903 Y117.774 E.03843
G1 X149.37 Y117.774
G1 X150.282 Y118.686 E.03843
G1 X149.749 Y118.686
G1 X148.836 Y117.774 E.03843
G1 X148.303 Y117.774
G1 X149.215 Y118.686 E.03843
G1 X148.682 Y118.686
G1 X147.77 Y117.774 E.03843
G1 X147.237 Y117.774
G1 X148.149 Y118.686 E.03843
G1 X147.616 Y118.686
G1 X146.703 Y117.774 E.03843
G1 X146.17 Y117.774
G1 X147.082 Y118.686 E.03843
G1 X146.549 Y118.686
G1 X145.637 Y117.774 E.03843
G1 X145.104 Y117.774
G1 X146.016 Y118.686 E.03843
G1 X145.483 Y118.686
G1 X144.57 Y117.774 E.03843
G1 X144.037 Y117.774
G1 X144.949 Y118.686 E.03843
G1 X144.416 Y118.686
G1 X143.504 Y117.774 E.03843
G1 X142.97 Y117.774
G1 X143.883 Y118.686 E.03843
G1 X143.349 Y118.686
G1 X142.437 Y117.774 E.03843
G1 X141.904 Y117.774
G1 X142.816 Y118.686 E.03843
G1 X142.283 Y118.686
G1 X141.371 Y117.774 E.03843
G1 X140.837 Y117.774
G1 X141.75 Y118.686 E.03843
G1 X141.216 Y118.686
G1 X140.304 Y117.774 E.03843
G1 X139.771 Y117.774
G1 X140.683 Y118.686 E.03843
G1 X140.15 Y118.686
G1 X139.238 Y117.774 E.03843
G1 X138.704 Y117.774
G1 X139.617 Y118.686 E.03843
G1 X139.083 Y118.686
G1 X138.171 Y117.774 E.03843
G1 X137.638 Y117.774
G1 X138.55 Y118.686 E.03843
G1 X138.017 Y118.686
G1 X137.105 Y117.774 E.03843
G1 X136.571 Y117.774
G1 X137.484 Y118.686 E.03843
G1 X136.95 Y118.686
G1 X136.038 Y117.774 E.03843
G1 X135.505 Y117.774
G1 X136.417 Y118.686 E.03843
G1 X135.884 Y118.686
G1 X134.972 Y117.774 E.03843
G1 X134.438 Y117.774
G1 X135.351 Y118.686 E.03843
G1 X134.817 Y118.686
G1 X133.905 Y117.774 E.03843
G1 X133.372 Y117.774
G1 X134.284 Y118.686 E.03843
G1 X133.751 Y118.686
G1 X132.839 Y117.774 E.03843
G1 X132.305 Y117.774
G1 X133.218 Y118.686 E.03843
G1 X132.684 Y118.686
G1 X131.772 Y117.774 E.03843
G1 X131.239 Y117.774
G1 X132.151 Y118.686 E.03843
G1 X131.618 Y118.686
G1 X130.706 Y117.774 E.03843
G1 X130.172 Y117.774
G1 X131.085 Y118.686 E.03843
G1 X130.551 Y118.686
G1 X129.639 Y117.774 E.03843
G1 X129.106 Y117.774
G1 X130.018 Y118.686 E.03843
G1 X129.485 Y118.686
G1 X128.573 Y117.774 E.03843
G1 X128.039 Y117.774
G1 X128.952 Y118.686 E.03843
G1 X128.418 Y118.686
G1 X127.506 Y117.774 E.03843
G1 X126.973 Y117.774
G1 X127.885 Y118.686 E.03843
G1 X127.352 Y118.686
G1 X126.44 Y117.774 E.03843
G1 X125.906 Y117.774
G1 X126.819 Y118.686 E.03843
G1 X126.285 Y118.686
G1 X125.373 Y117.774 E.03843
G1 X124.84 Y117.774
G1 X125.752 Y118.686 E.03843
G1 X125.219 Y118.686
G1 X124.306 Y117.774 E.03843
G1 X123.773 Y117.774
G1 X124.685 Y118.686 E.03843
G1 X124.152 Y118.686
G1 X123.24 Y117.774 E.03843
G1 X122.707 Y117.774
G1 X123.619 Y118.686 E.03843
G1 X123.086 Y118.686
G1 X122.173 Y117.774 E.03843
G1 X121.64 Y117.774
G1 X122.552 Y118.686 E.03843
G1 X122.019 Y118.686
G1 X121.107 Y117.774 E.03843
G1 X120.574 Y117.774
G1 X121.486 Y118.686 E.03843
G1 X120.953 Y118.686
G1 X120.04 Y117.774 E.03843
G1 X119.507 Y117.774
G1 X120.419 Y118.686 E.03843
G1 X119.886 Y118.686
G1 X118.974 Y117.774 E.03843
G1 X118.441 Y117.774
G1 X119.353 Y118.686 E.03843
G1 X118.82 Y118.686
G1 X117.907 Y117.774 E.03843
G1 X117.374 Y117.774
G1 X118.286 Y118.686 E.03843
G1 X117.753 Y118.686
G1 X116.841 Y117.774 E.03843
G1 X116.308 Y117.774
G1 X117.22 Y118.686 E.03843
G1 X116.687 Y118.686
G1 X115.774 Y117.774 E.03843
G1 X115.241 Y117.774
G1 X116.153 Y118.686 E.03843
G1 X115.62 Y118.686
G1 X114.708 Y117.774 E.03843
G1 X114.175 Y117.774
G1 X115.087 Y118.686 E.03843
G1 X114.554 Y118.686
G1 X113.641 Y117.774 E.03843
G1 X113.108 Y117.774
G1 X114.02 Y118.686 E.03843
G1 X113.487 Y118.686
G1 X112.575 Y117.774 E.03843
G1 X112.042 Y117.774
G1 X112.954 Y118.686 E.03843
G1 X112.421 Y118.686
G1 X111.508 Y117.774 E.03843
G1 X110.975 Y117.774
G1 X111.887 Y118.686 E.03843
G1 X111.354 Y118.686
G1 X110.442 Y117.774 E.03843
G1 X109.909 Y117.774
G1 X110.821 Y118.686 E.03843
G1 X110.288 Y118.686
G1 X109.375 Y117.774 E.03843
G1 X108.842 Y117.774
G1 X109.754 Y118.686 E.03843
G1 X109.221 Y118.686
G1 X108.309 Y117.774 E.03843
G1 X107.776 Y117.774
G1 X108.688 Y118.686 E.03843
G1 X108.154 Y118.686
G1 X107.242 Y117.774 E.03843
G1 X106.709 Y117.774
G1 X107.621 Y118.686 E.03843
G1 X107.088 Y118.686
G1 X106.176 Y117.774 E.03843
G1 X105.642 Y117.774
G1 X106.555 Y118.686 E.03843
G1 X106.021 Y118.686
G1 X105.109 Y117.774 E.03843
G1 X104.576 Y117.774
G1 X105.488 Y118.686 E.03843
G1 X104.955 Y118.686
G1 X104.043 Y117.774 E.03843
G1 X103.509 Y117.774
G1 X104.422 Y118.686 E.03843
G1 X103.888 Y118.686
G1 X102.976 Y117.774 E.03843
G1 X102.443 Y117.774
G1 X103.355 Y118.686 E.03843
G1 X102.822 Y118.686
G1 X101.91 Y117.774 E.03843
G1 X101.376 Y117.774
G1 X102.289 Y118.686 E.03843
G1 X101.755 Y118.686
G1 X100.843 Y117.774 E.03843
G1 X100.31 Y117.774
G1 X101.222 Y118.686 E.03843
G1 X100.689 Y118.686
G1 X99.777 Y117.774 E.03843
G1 X99.243 Y117.774
G1 X100.156 Y118.686 E.03843
G1 X99.622 Y118.686
G1 X98.71 Y117.774 E.03843
G1 X98.177 Y117.774
G1 X99.089 Y118.686 E.03843
G1 X98.556 Y118.686
G1 X97.644 Y117.774 E.03843
G1 X97.11 Y117.774
G1 X98.023 Y118.686 E.03843
G1 X97.489 Y118.686
G1 X96.577 Y117.774 E.03843
G1 X96.044 Y117.774
G1 X96.956 Y118.686 E.03843
G1 X96.423 Y118.686
G1 X95.511 Y117.774 E.03843
G1 X95.417 Y118.214
G1 X95.89 Y118.686 E.01989
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6364.704
M204 S10000
G1 X95.417 Y118.214 E-.25377
G1 X95.511 Y117.774 E-.17093
G1 X96.135 Y118.398 E-.33531
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z8.7 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z108.2 F600
    G1 Z106.2

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

