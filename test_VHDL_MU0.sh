#!/bin/bash

ghdl -a MU0_tb.vhdl
ghdl -e mu0_tb
ghdl -r mu0_tb