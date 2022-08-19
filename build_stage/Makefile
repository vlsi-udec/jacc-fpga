# Current project
EXECUTABLE = ./host_bin
HW_NAME = vadd
HOST_SRCS += src/main.cpp \
             src/kernel-hll.cpp \
             src/kernel-card.cpp \
             src/kernel-dist.cpp \
             src/fastq-read.cpp \
             src/test/hll.cpp \
             src/test/murmurhash.cpp \

CXX := $(XILINX_VIVADO)/tps/lnx64/gcc-6.2.0/bin/g++

############################## Setting up Project Variables ##############################
# Points to top directory of Git repository
COMMON_REPO = ../f1/xilinx/
PWD = $(shell readlink -f .)
XF_PROJ_ROOT = $(shell readlink -f $(COMMON_REPO))

TARGET := hw
HOST_ARCH := x86
SYSROOT :=

HOST_SRCS += $(XF_PROJ_ROOT)/common/includes/xcl2/xcl2.cpp

include ./utils.mk

XSA :=
ifneq ($(DEVICE), )
XSA := $(call device2xsa, $(DEVICE))
endif
TEMP_DIR := ./_x.$(TARGET)
BUILD_DIR := ./build_dir.$(TARGET)

# SoC variables
RUN_APP_SCRIPT = ./run_app.sh
PACKAGE_OUT = ./package.$(TARGET)

LAUNCH_EMULATOR = $(PACKAGE_OUT)/launch_$(TARGET).sh
RESULT_STRING = TEST PASSED

VPP := v++
VPP_PFLAGS :=
CMD_ARGS = $(BUILD_DIR)/vadd.xclbin
SDCARD := sd_card

include $(XF_PROJ_ROOT)/common/includes/opencl/opencl.mk
include config.mk

CXXFLAGS += $(opencl_CXXFLAGS) -Wall -O3 -g -std=c++14
LDFLAGS += $(opencl_LDFLAGS)

ifeq ($(findstring nodma, $(DEVICE)), nodma)
$(error [ERROR]: This example is not supported for $(DEVICE).)
endif

############################## Setting up Host Variables ##############################
#Include Required Host Source Files
CXXFLAGS += -I$(XF_PROJ_ROOT)/common/includes/xcl2
# Host compiler global settings
CXXFLAGS += -fmessage-length=0
LDFLAGS += -lrt -lstdc++ -lz -lm

ifneq ($(HOST_ARCH), x86)
	LDFLAGS += --sysroot=$(SYSROOT)
endif

############################## Setting up Kernel Variables ##############################
# Kernel compiler global settings
VPP_FLAGS += -t $(TARGET) --platform $(DEVICE) --save-temps -g

# Kernel linker flags
VPP_LDFLAGS += --config ./adder.cfg

############################## Declaring Binary Containers ##############################
BINARY_CONTAINERS += $(BUILD_DIR)/$(HW_NAME).xclbin
BINARY_CONTAINER_HW_OBJS += $(TEMP_DIR)/krnl_hll_rtl.xo
BINARY_CONTAINER_HW_OBJS += $(TEMP_DIR)/krnl_card_rtl.xo
# BINARY_CONTAINER_HW_OBJS += $(TEMP_DIR)/krnl_dist_rtl.xo

############################## Setting Targets ##############################
CP = cp -rf

.PHONY: all clean cleanall docs
all: check-devices $(EXECUTABLE) $(BINARY_CONTAINERS)

.PHONY: host
host: $(EXECUTABLE)

.PHONY: build
build: check-vitis $(BINARY_CONTAINERS)

# Building kernel
$(BUILD_DIR)/$(HW_NAME).xclbin: $(BINARY_CONTAINER_HW_OBJS)
	mkdir -p $(BUILD_DIR)
ifeq ($(HOST_ARCH), x86)
	$(VPP) $(VPP_FLAGS) -l $(VPP_LDFLAGS) --temp_dir $(TEMP_DIR)  -o'$(BUILD_DIR)/vadd.link.xclbin' $(+)
	$(VPP) -p $(BUILD_DIR)/vadd.link.xclbin -t $(TARGET) --platform $(DEVICE) --package.out_dir $(PACKAGE_OUT) -o $(BUILD_DIR)/vadd.xclbin
else
	$(VPP) $(VPP_FLAGS) -l $(VPP_LDFLAGS) --temp_dir $(TEMP_DIR) -o'$(BUILD_DIR)/vadd.xclbin' $(+)
endif

############################## Setting Rules for Host (Building Host Executable) ##############################
$(EXECUTABLE): $(HOST_SRCS) | check-xrt
		$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS)

############################## Cleaning Rules ##############################
# Cleaning stuff
clean:
	-$(RMDIR) $(EXECUTABLE) $(XCLBIN)/{*sw_emu*,*hw_emu*}
	-$(RMDIR) profile_* TempConfig system_estimate.xtxt *.rpt *.csv
	-$(RMDIR) src/*.ll *v++* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb

cleanall: clean
	-$(RMDIR) build_dir* sd_card*
	-$(RMDIR) package.*
	-$(RMDIR) _x* *xclbin.run_summary qemu-memory-_* emulation _vimage pl* start_simulation.sh *.xclbin
	-$(RMDIR) ./tmp_kernel_pack* ./packaged_kernel*
