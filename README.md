# PowerDomainsBackEnd

Run Commands:
```
set NAME_PE = Tile_PDDaisyPECore 

if (-d $NAME_PE) then
  rm -rf $NAME_PE 
endif

mkdir $NAME_PE 
cd $NAME_PE 
setenv DESIGN $NAME_PE 
/cad/cadence/GENUS17.21.000.lnx86/bin/genus -legacy_ui -f ../../scripts/synthesize.power.tcl
innovus -replay ../../scripts/layout_pe_tile_new.tcl
cd ..
```
