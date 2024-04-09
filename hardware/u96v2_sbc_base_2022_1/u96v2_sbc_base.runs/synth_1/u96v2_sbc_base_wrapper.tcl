# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.runs/synth_1/u96v2_sbc_base_wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xczu3eg-sbva484-1-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.cache/wt [current_project]
set_property parent.project_path /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part_repo_paths {/home/docker/2022.1/clean/bdf} [current_project]
set_property board_part avnet.com:ultra96v2:part0:1.2 [current_project]
set_property ip_repo_paths /home/docker/2022.1/clean/hdl/ip [current_project]
update_ip_catalog
set_property ip_output_repo /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_vhdl -library xil_defaultlib /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/hdl/u96v2_sbc_base_wrapper.vhd
add_files /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.srcs/sources_1/bd/u96v2_sbc_base/u96v2_sbc_base.bd
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_zynq_ultra_ps_e_0_0/u96v2_sbc_base_zynq_ultra_ps_e_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_zynq_ultra_ps_e_0_0/u96v2_sbc_base_zynq_ultra_ps_e_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_xbar_0/u96v2_sbc_base_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_0_0/u96v2_sbc_base_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_0_0/u96v2_sbc_base_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_0_0/u96v2_sbc_base_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_bram_ctrl_0_0/u96v2_sbc_base_axi_bram_ctrl_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_blk_mem_gen_0_0/u96v2_sbc_base_blk_mem_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_uart16550_0_0/u96v2_sbc_base_axi_uart16550_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_uart16550_0_0/u96v2_sbc_base_axi_uart16550_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_uart16550_0_0/u96v2_sbc_base_axi_uart16550_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_uart16550_1_0/u96v2_sbc_base_axi_uart16550_1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_uart16550_1_0/u96v2_sbc_base_axi_uart16550_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_uart16550_1_0/u96v2_sbc_base_axi_uart16550_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_0_0/u96v2_sbc_base_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_0_0/u96v2_sbc_base_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_0_0/u96v2_sbc_base_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_1_0/u96v2_sbc_base_axi_gpio_1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_1_0/u96v2_sbc_base_axi_gpio_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_1_0/u96v2_sbc_base_axi_gpio_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_2_0/u96v2_sbc_base_axi_gpio_2_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_2_0/u96v2_sbc_base_axi_gpio_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_gpio_2_0/u96v2_sbc_base_axi_gpio_2_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_system_management_wiz_0_0/u96v2_sbc_base_system_management_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_system_management_wiz_0_0/u96v2_sbc_base_system_management_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_system_management_wiz_0_0/u96v2_sbc_base_system_management_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_intc_0_0/u96v2_sbc_base_axi_intc_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_intc_0_0/u96v2_sbc_base_axi_intc_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_axi_intc_0_0/u96v2_sbc_base_axi_intc_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_clk_wiz_0_0/u96v2_sbc_base_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_clk_wiz_0_0/u96v2_sbc_base_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_clk_wiz_0_0/u96v2_sbc_base_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_0_1/u96v2_sbc_base_proc_sys_reset_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_0_1/u96v2_sbc_base_proc_sys_reset_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_0_1/u96v2_sbc_base_proc_sys_reset_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_1_0/u96v2_sbc_base_proc_sys_reset_1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_1_0/u96v2_sbc_base_proc_sys_reset_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_1_0/u96v2_sbc_base_proc_sys_reset_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_2_0/u96v2_sbc_base_proc_sys_reset_2_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_2_0/u96v2_sbc_base_proc_sys_reset_2_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_2_0/u96v2_sbc_base_proc_sys_reset_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_3_0/u96v2_sbc_base_proc_sys_reset_3_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_3_0/u96v2_sbc_base_proc_sys_reset_3_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_3_0/u96v2_sbc_base_proc_sys_reset_3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_4_0/u96v2_sbc_base_proc_sys_reset_4_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_4_0/u96v2_sbc_base_proc_sys_reset_4_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_4_0/u96v2_sbc_base_proc_sys_reset_4_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_5_0/u96v2_sbc_base_proc_sys_reset_5_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_5_0/u96v2_sbc_base_proc_sys_reset_5_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_5_0/u96v2_sbc_base_proc_sys_reset_5_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_6_0/u96v2_sbc_base_proc_sys_reset_6_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_6_0/u96v2_sbc_base_proc_sys_reset_6_0.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_proc_sys_reset_6_0/u96v2_sbc_base_proc_sys_reset_6_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_0/u96v2_sbc_base_auto_ds_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_0/u96v2_sbc_base_auto_ds_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_0/u96v2_sbc_base_auto_ds_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_0/u96v2_sbc_base_auto_pc_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_1/u96v2_sbc_base_auto_ds_1_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_1/u96v2_sbc_base_auto_ds_1_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_1/u96v2_sbc_base_auto_ds_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_1/u96v2_sbc_base_auto_pc_1_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_2/u96v2_sbc_base_auto_ds_2_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_2/u96v2_sbc_base_auto_ds_2_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_2/u96v2_sbc_base_auto_ds_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_2/u96v2_sbc_base_auto_pc_2_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_3/u96v2_sbc_base_auto_ds_3_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_3/u96v2_sbc_base_auto_ds_3_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_3/u96v2_sbc_base_auto_ds_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_3/u96v2_sbc_base_auto_pc_3_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_4/u96v2_sbc_base_auto_ds_4_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_4/u96v2_sbc_base_auto_ds_4_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_4/u96v2_sbc_base_auto_ds_4_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_4/u96v2_sbc_base_auto_pc_4_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_5/u96v2_sbc_base_auto_ds_5_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_5/u96v2_sbc_base_auto_ds_5_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_5/u96v2_sbc_base_auto_ds_5_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_5/u96v2_sbc_base_auto_pc_5_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_6/u96v2_sbc_base_auto_ds_6_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_6/u96v2_sbc_base_auto_ds_6_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_6/u96v2_sbc_base_auto_ds_6_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_6/u96v2_sbc_base_auto_pc_6_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_7/u96v2_sbc_base_auto_ds_7_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_7/u96v2_sbc_base_auto_ds_7_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_7/u96v2_sbc_base_auto_ds_7_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_7/u96v2_sbc_base_auto_pc_7_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_8/u96v2_sbc_base_auto_ds_8_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_8/u96v2_sbc_base_auto_ds_8_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_ds_8/u96v2_sbc_base_auto_ds_8_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_auto_pc_8/u96v2_sbc_base_auto_pc_8_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.gen/sources_1/bd/u96v2_sbc_base/u96v2_sbc_base_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.srcs/constrs_1/imports/base/u96v2_sbc_base.xdc
set_property used_in_implementation false [get_files /home/docker/2022.1/clean/hdl/projects/u96v2_sbc_base_2022_1/u96v2_sbc_base.srcs/constrs_1/imports/base/u96v2_sbc_base.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top u96v2_sbc_base_wrapper -part xczu3eg-sbva484-1-i
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef u96v2_sbc_base_wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file u96v2_sbc_base_wrapper_utilization_synth.rpt -pb u96v2_sbc_base_wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
