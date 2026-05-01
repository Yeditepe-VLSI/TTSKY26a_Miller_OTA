rule=/usr/local/share/pdk/sky130A/libs.tech/klayout/drc

klayout -b -r "$rule/sky130A_mr.drc" \
  -rd input=../../gds/tt_um_analog_ota_version1.gds \
  -rd report=./drc_result.lyrdb