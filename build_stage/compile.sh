#!/bin/bash
source $AWS_FPGA_REPO_DIR/vitis_setup.sh
make TARGET=hw DEVICE=$AWS_PLATFORM all
