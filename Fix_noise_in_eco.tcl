#Usage eco_noise <net_name>
##########################################################################
############################FIXNOISE##########################################
##########################################################################
proc eco_noise {NET} {
if { [llength [get_db nets $NET] ] == 1} {
	puts "valid net $NET"} else {
	puts "$NET is not valid or does not exits"
	continue
	}
set loads [llength [get_db [get_db nets $NET ] .loads]]
if {$loads == 1} {
	puts "Fixing net"
	set j 0
	foreach i [get_db [get_db nets $NET ] .wires.length ] { 
		set j [expr $i + $j]  }
	set half_net [expr $j/2 + 2 ]
	if { $half_net <= 20} {
	eco_add_repeater -net $NET -spread_distance $half_net -cells BUFFLLKGD2BWP169H3P48CPDLVT;continue
	}
        if { $half_net <= 50} {
	eco_add_repeater -net $NET -spread_distance $half_net -cells BUFFLLKGD4BWP169H3P48CPDLVT;continue
	}
	if { $half_net <= 100} {
	eco_add_repeater -net $NET -spread_distance $half_net -cells BUFFLLKGD6BWP169H3P48CPDLVT;continue
	}
	if { $half_net <= 150} {
	eco_add_repeater -net $NET -spread_distance $half_net -cells BUFFLLKGD8BWP169H3P48CPDLVT;continue
	}
	if { $half_net <= 200} {
	eco_add_repeater -net $NET -spread_distance $half_net -cells BUFFLLKGD12BWP169H3P48CPDLVT;continue
	}

} else {
    puts "Skipping $NET as it has multiple drivers, Suggest to fix it manually"
    continue
}}



