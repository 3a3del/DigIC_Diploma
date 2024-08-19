
puts "**** Writing Verilog Block Interface ****"


set  modname  Up_Dn_Counter 
set in_ports [list IN \
                   Load \
				   Up \
				   Down \
				   CLK ]
				   
set in_ports_width [list 4 \
                         1 \
				         1 \
				         1 \
				         1 ]				   

set out_ports [list High \
                    Counter \
				    Low ]
				   
set out_ports_width [list 1 \
				          4 \
				          1 ]


puts "module  $modname  ("


for {set loop 0} {$loop < [llength $in_ports]} {incr loop} {

  set port_format ""
  if {[lindex $in_ports_width $loop] == 1} {
    append port_format "input " "       " " [lindex $in_ports $loop],"
  } else {
    append port_format "input " " \[[expr [lindex $in_ports_width $loop] -1]:0\] " " [lindex $in_ports $loop],"
  }  
  
  puts $port_format
  set port_format ""  
}

for {set loop 0} {$loop < [llength $out_ports]} {incr loop} {

  set port_format ""

 if {$loop != [expr [llength $out_ports] -1]} {
 
  if {[lindex $out_ports_width $loop] == 1} {
    append port_format "output " "      " " [lindex $out_ports $loop],"
  } else {
    append port_format "output " "\[[expr [lindex $out_ports_width $loop] -1]:0\] " " [lindex $out_ports $loop],"
  }  
  
 } else {
 
  if {[lindex $out_ports_width $loop] == 1} {
    append port_format "output " "      " " [lindex $out_ports $loop]"
  } else {
    append port_format "output " "\[[expr [lindex $out_ports_width $loop] -1]:0\] " " [lindex $out_ports $loop]"
  }   
 
 }  
  puts $port_format
  set port_format ""  
}


puts ");"



