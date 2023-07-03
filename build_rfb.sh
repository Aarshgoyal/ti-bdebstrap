#!/bin/bash

export topdir=$(git rev-parse --show-toplevel)
while [ $# -gt 0 ]; do
  case $1 in
    --help | -h)
      usage $0
      ;;
    --machine) shift; machine=$1; shift; ;;
    --control_file) shift; control_file=$1; shift; ;;
    #--location) shift; location=$1; shift; ;;	
    *) echo "Unknown file $1 " ;;
  esac
done


if [ ! -d ti-linux-firmware ]; then
    
    echo ">> ti-linux-firmware: not found. cloning .."
    linux_fw_srcrev="09.00.00.001"
    git clone \
        https://git.ti.com/git/processor-firmware/ti-linux-firmware.git \
        -b ${linux_fw_srcrev} \
        --single-branch \
        --depth=1
    echo ">> ti-linux-firmware: cloned"
else
    echo ">> ti-linux-firmware: available"
fi

Initial=${topdir}/ti-linux-firmware/ti-ipc
location=lib/firmware
package_name=ti_linux_firmware_${machine}
source ${topdir}/build_deb.sh

# build_deb ${package_name} ${control_file} ${Initial} ${location} 
build_tree ${package_name} ${control_file} ${location}
do_install ${Initial} ${package_name} ${location}
if [ ${machine} = "j721s2-evm" ]; then
  ln -sfn /${location}/ti-ipc/j721s2/ipc_echo_test_c7x_1_release_strip.xe71 ${topdir}/${package_name}/${location}/j721s2-c71_0-fw
  ln -sfn /${location}/ti-ipc/j721s2/ipc_echo_test_c7x_2_release_strip.xe71 ${topdir}/${package_name}/${location}/j721s2-c71_1-fw
  ln -sfn /${location}/ti-ipc/j721s2/ipc_echo_test_mcu2_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j721s2-main-r5f0_0-fw
  ln -sfn /${location}/ti-ipc/j721s2/ipc_echo_test_mcu3_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j721s2-main-r5f1_0-fw
  ln -sfn /${location}/ti-ipc/j721s2/ipc_echo_test_mcu3_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j721s2-main-r5f1_1-fw
  ln -sfn /${location}/ti-ipc/j721s2/ipc_echo_test_mcu1_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j721s2-mcu-r5f0_1-fw

elif [ ${machine} = "j721e-evm"]; then 
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_c66xdsp_1_release_strip.xe66 ${topdir}/${package_name}/${location}/j7-c66_0-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_c66xdsp_2_release_strip.xe66 ${topdir}/${package_name}/${location}/j7-c66_1-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_c7x_1_release_strip.xe71 ${topdir}/${package_name}/${location}/j7-main-r5f0_0-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_mcu1_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j7-mcu-r5f0_1-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_mcu2_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j7-main-r5f0_0-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_mcu2_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j7-main-r5f0_1-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_mcu3_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j7-main-r5f1_0-fw
  ln -sfn /${location}/ti-ipc/j721e/ipc_echo_test_mcu3_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j7-main-r5f1_1-fw

elif [ ${machine} = "j784s4-evm"]; then 
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_c7x_1_release_strip.xe71 ${topdir}/${package_name}/${location}/j784s4-c71_0-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_c7x_2_release_strip.xe71 ${topdir}/${package_name}/${location}/j784s4-c71_1-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_c7x_3_release_strip.xe71 ${topdir}/${package_name}/${location}/j784s4-c71_2-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_c7x_4_release_strip.xe71 ${topdir}/${package_name}/${location}/j784s4-c71_3-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu1_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-mcu-r5f0_1-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu2_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-main-r5f0_0-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu2_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-main-r5f0_1-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu3_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-main-r5f1_0-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu3_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-main-r5f1_1-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu4_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-main-r5f2_0-fw
  ln -sfn /${location}/ti-ipc/j784s4/ipc_echo_test_mcu4_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j784s4-main-r5f2_1-fw

elif [ ${machine} = "j7200-evm"]; then
  ln -sfn /${location}/ti-ipc/j7200/ipc_echo_test_mcu1_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j7200-mcu-r5f0_1-fw
  ln -sfn /${location}/ti-ipc/j7200/ipc_echo_test_mcu2_0_release_strip.xer5f ${topdir}/${package_name}/${location}/j7200-main-r5f0_0-fw
  ln -sfn /${location}/ti-ipc/j7200/ipc_echo_test_mcu2_1_release_strip.xer5f ${topdir}/${package_name}/${location}/j7200-main-r5f0_1-fw

fi
  

deb_build  ${package_name}


