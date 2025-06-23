# Define variables
BASE_LIB_DIR=$MODPATH/common/libs
MODDED_LIB=com.qti.chi.override.so
MODULE_LIB=$MODPATH/system/vendor/lib64/hw/$MODDED_LIB
SELECTION=1

# Extract compressed libraries
tar -xf "$MODPATH"/common/libs.tar.xz -C "$MODPATH"/common 2>/dev/null

# Use volume key selection to choose the vendor firmware version
ui_print " "
ui_print "! Please select the vendor firmware"
ui_print "  your ROM is presently using by"
ui_print "  pressing the desired volume button:"
ui_print " "
ui_print "  Volume Up   = Next Option"
ui_print "  Volume Down = Finalize Selection"
ui_print " "
ui_print "  1. OxygenOS 13"
ui_print "  2. OxygenOS 12"
ui_print "  3. OxygenOS 11"
ui_print "  4. OxygenOS 11 (Alternative)"
ui_print " "
ui_print "- Current Selection:"

while true; do
  ui_print "  S. No. $SELECTION"
  ui_print " "
  if chooseport 30; then
    SELECTION=$((SELECTION + 1))
  else
    break
  fi
  if [ $SELECTION -gt 4 ]; then
    SELECTION=1
  fi
done

# Copy the modded library to the module folder as per the vendor firmware selected
case $SELECTION in
  1)
    ui_print "- Selected Vendor Firmware:"
    ui_print "  OxygenOS 13"
    ui_print "- Copying appropriate modded library"
    cp_ch "$BASE_LIB_DIR"/oos13/$MODDED_LIB "$MODULE_LIB"
    ;;
  2)
    ui_print "- Selected Vendor Firmware:"
    ui_print "  OxygenOS 12"
    ui_print "- Copying appropriate modded library"
    cp_ch "$BASE_LIB_DIR"/oos12/$MODDED_LIB "$MODULE_LIB"
    ;;
  3)
    ui_print "- Selected Vendor Firmware:"
    ui_print "  OxygenOS 11"
    ui_print "- Copying appropriate modded library"
    cp_ch "$BASE_LIB_DIR"/oos11/$MODDED_LIB "$MODULE_LIB"
    ;;
  4)
    ui_print "- Selected Vendor Firmware:"
    ui_print "  OxygenOS 11 (Alternative)"
    ui_print "- Copying appropriate modded library"
    cp_ch "$BASE_LIB_DIR"/oos11-alt/$MODDED_LIB "$MODULE_LIB"
    ;;
esac

# Credits
ui_print " "
ui_print "**************************************"
ui_print "* This module is possible because of *"
ui_print "*       AnierinB, ArcideMusic,       *"
ui_print "*     Cartesian8445, haiderijaz,     *"
ui_print "* JeusChrit, Luk1377, and many others*"
ui_print "**************************************"
ui_print " "
