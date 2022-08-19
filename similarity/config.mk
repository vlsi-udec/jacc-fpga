VIVADO := $(XILINX_VIVADO)/bin/vivado
# $(TEMP_DIR)/krnl_hll_rtl.xo: src/krnl_hll_rtl.xml scripts/package_krnl_hll_rtl.tcl scripts/gen_xo.tcl src/krnl_hll_rtl/hdl/*.sv src/krnl_hll_rtl/hdl/*.v
# 	mkdir -p $(TEMP_DIR)
# 	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/krnl_hll_rtl.xo krnl_hll_rtl $(TARGET) $(DEVICE) $(XSA)
# $(TEMP_DIR)/krnl_card_rtl.xo: src/krnl_card_rtl.xml scripts/package_krnl_card_rtl.tcl scripts/gen_xo.tcl src/krnl_card_rtl/hdl/*.sv src/krnl_card_rtl/hdl/*.v
# 	mkdir -p $(TEMP_DIR)
# 	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/krnl_card_rtl.xo krnl_card_rtl $(TARGET) $(DEVICE) $(XSA)
$(TEMP_DIR)/krnl_dist_rtl.xo: src/krnl_dist_rtl.xml scripts/package_krnl_dist_rtl.tcl scripts/gen_xo.tcl src/krnl_dist_rtl/hdl/*.sv src/krnl_dist_rtl/hdl/*.v
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/krnl_dist_rtl.xo krnl_dist_rtl $(TARGET) $(DEVICE) $(XSA)

