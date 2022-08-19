# /*******************************************************************************
#
# Copyright (C) 2020 Xilinx, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may
# not use this file except in compliance with the License. A copy of the
# License is located at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

create_project -force kernel_pack $path_to_tmp_project
add_files -norecurse [glob $path_to_hdl/*.v $path_to_hdl/*.sv]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project -root_dir $path_to_packaged -vendor xilinx.com -library RTLKernel -taxonomy /KernelIP -import_files -set_current false
ipx::unload_core $path_to_packaged/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $path_to_packaged $path_to_packaged/component.xml

set core [ipx::current_core]

set_property core_revision 2 $core
foreach up [ipx::get_user_parameters] {
  ipx::remove_user_parameter [get_property NAME $up] $core
}
ipx::associate_bus_interfaces -busif m_axi_gmem_0 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_1 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_2 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_3 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_4 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_5 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_6 -clock ap_clk $core
ipx::associate_bus_interfaces -busif m_axi_gmem_7 -clock ap_clk $core
ipx::associate_bus_interfaces -busif s_axi_control -clock ap_clk $core
ipx::infer_bus_interface ap_clk_2 xilinx.com:signal:clock_rtl:1.0 $core
ipx::infer_bus_interface ap_rst_n_2 xilinx.com:signal:reset_rtl:1.0 $core

ipx::associate_bus_interfaces -busif p0 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p1 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p2 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p3 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p4 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p5 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p6 -clock ap_clk_2 $core
ipx::associate_bus_interfaces -busif p7 -clock ap_clk_2 $core

# Specify the freq_hz parameter
set clkbif      [::ipx::get_bus_interfaces -of $core "ap_clk"]
set clkbifparam [::ipx::add_bus_parameter -quiet "FREQ_HZ" $clkbif]
# Set desired frequency
set_property value 250000000 $clkbifparam
# set value_resolve_type 'user' if the frequency can vary.
set_property value_resolve_type user $clkbifparam
# set value_resolve_type 'immediate' if the frequency cannot change.
# set_property value_resolve_type immediate $clkbifparam

# Specify the freq_hz parameter
set clkbif      [::ipx::get_bus_interfaces -of $core "ap_clk_2"]
set clkbifparam [::ipx::add_bus_parameter -quiet "FREQ_HZ" $clkbif]
# Set desired frequency
set_property value 500000000 $clkbifparam
# set value_resolve_type 'user' if the frequency can vary.
set_property value_resolve_type user $clkbifparam
# set value_resolve_type 'immediate' if the frequency cannot change.
# set_property value_resolve_type immediate $clkbifparam

set mem_map    [::ipx::add_memory_map -quiet "s_axi_control" $core]
set addr_block [::ipx::add_address_block -quiet "reg0" $mem_map]

set reg      [::ipx::add_register "CTRL" $addr_block]
  set_property description    "Control signals"    $reg
  set_property address_offset 0x000 $reg
  set_property size           32    $reg
set field [ipx::add_field AP_START $reg]
  set_property ACCESS {read-write} $field
  set_property BIT_OFFSET {0} $field
  set_property BIT_WIDTH {1} $field
  set_property DESCRIPTION {Control signal Register for 'ap_start'.} $field
  set_property MODIFIED_WRITE_VALUE {modify} $field
set field [ipx::add_field AP_DONE $reg]
  set_property ACCESS {read-only} $field
  set_property BIT_OFFSET {1} $field
  set_property BIT_WIDTH {1} $field
  set_property DESCRIPTION {Control signal Register for 'ap_done'.} $field
  set_property READ_ACTION {modify} $field
set field [ipx::add_field AP_IDLE $reg]
  set_property ACCESS {read-only} $field
  set_property BIT_OFFSET {2} $field
  set_property BIT_WIDTH {1} $field
  set_property DESCRIPTION {Control signal Register for 'ap_idle'.} $field
  set_property READ_ACTION {modify} $field
set field [ipx::add_field AP_READY $reg]
  set_property ACCESS {read-only} $field
  set_property BIT_OFFSET {3} $field
  set_property BIT_WIDTH {1} $field
  set_property DESCRIPTION {Control signal Register for 'ap_ready'.} $field
  set_property READ_ACTION {modify} $field
set field [ipx::add_field RESERVED_1 $reg]
  set_property ACCESS {read-only} $field
  set_property BIT_OFFSET {4} $field
  set_property BIT_WIDTH {3} $field
  set_property DESCRIPTION {Reserved.  0s on read.} $field
  set_property READ_ACTION {modify} $field
set field [ipx::add_field AUTO_RESTART $reg]
  set_property ACCESS {read-write} $field
  set_property BIT_OFFSET {7} $field
  set_property BIT_WIDTH {1} $field
  set_property DESCRIPTION {Control signal Register for 'auto_restart'.} $field
  set_property MODIFIED_WRITE_VALUE {modify} $field
set field [ipx::add_field RESERVED_2 $reg]
  set_property ACCESS {read-only} $field
  set_property BIT_OFFSET {8} $field
  set_property BIT_WIDTH {24} $field
  set_property DESCRIPTION {Reserved.  0s on read.} $field
  set_property READ_ACTION {modify} $field

set reg      [::ipx::add_register "GIER" $addr_block]
  set_property description    "Global Interrupt Enable Register"    $reg
  set_property address_offset 0x004 $reg
  set_property size           32    $reg

set reg      [::ipx::add_register "IP_IER" $addr_block]
  set_property description    "IP Interrupt Enable Register"    $reg
  set_property address_offset 0x008 $reg
  set_property size           32    $reg

set reg      [::ipx::add_register "IP_ISR" $addr_block]
  set_property description    "IP Interrupt Status Register"    $reg
  set_property address_offset 0x00C $reg
  set_property size           32    $reg

set reg      [::ipx::add_register -quiet "read_ptr" $addr_block]
  set_property address_offset 0x010 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_0 $regparam

set reg      [::ipx::add_register -quiet "read_len" $addr_block]
  set_property address_offset 0x01C $reg
  set_property size           [expr {4*8}]   $reg

set reg      [::ipx::add_register -quiet "ptr_first" $addr_block]
  set_property address_offset 0x024 $reg
  set_property size           [expr {4*8}]   $reg

set reg      [::ipx::add_register -quiet "ptr_0" $addr_block]
  set_property address_offset 0x02C $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_0 $regparam




set reg      [::ipx::add_register -quiet "ptr_1" $addr_block]
  set_property address_offset 0x038 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_1 $regparam

set reg      [::ipx::add_register -quiet "ptr_2" $addr_block]
  set_property address_offset 0x044 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_2 $regparam

set reg      [::ipx::add_register -quiet "ptr_3" $addr_block]
  set_property address_offset 0x050 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_3 $regparam

set reg      [::ipx::add_register -quiet "ptr_4" $addr_block]
  set_property address_offset 0x05c $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_4 $regparam

set reg      [::ipx::add_register -quiet "ptr_5" $addr_block]
  set_property address_offset 0x068 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_5 $regparam

set reg      [::ipx::add_register -quiet "ptr_6" $addr_block]
  set_property address_offset 0x074 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_6 $regparam

set reg      [::ipx::add_register -quiet "ptr_7" $addr_block]
  set_property address_offset 0x080 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem_7 $regparam


set reg      [::ipx::add_register -quiet "p0" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p0 $regparam

set reg      [::ipx::add_register -quiet "p1" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p1 $regparam

set reg      [::ipx::add_register -quiet "p2" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p2 $regparam

set reg      [::ipx::add_register -quiet "p3" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p3 $regparam

set reg      [::ipx::add_register -quiet "p4" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p4 $regparam

set reg      [::ipx::add_register -quiet "p5" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p5 $regparam

set reg      [::ipx::add_register -quiet "p6" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p6 $regparam

set reg      [::ipx::add_register -quiet "p7" $addr_block]
  set_property address_offset 0x0 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value p7 $regparam

set_property slave_memory_map_ref "s_axi_control" [::ipx::get_bus_interfaces -of $core "s_axi_control"]

set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} $core
set_property sdx_kernel true $core
set_property sdx_kernel_type rtl $core
set_property supported_families { } $core
set_property auto_family_support_level level_2 $core
ipx::create_xgui_files $core
ipx::update_checksums $core
ipx::check_integrity -kernel $core
ipx::save_core $core
close_project -delete
