
puts "**** List Operations Lab ****"


set lst0 [list Jan Mar April May]
set lst1 {June July August}

puts "$lst0" ;
puts "$lst1" ;
puts "Length of lst0 : [llength $lst0]"
puts "Third Location of lst1 : [lindex $lst1 ]"

if { [expr [lsearch  $lst1 Oct] == "-1"] } {
puts "Oct not existed in the list"
} else {
puts "Oct is existed in the list"
}

set lst0 [linsert $lst0 1 Feb]
puts $lst0
lappend lst1 Sep Oct Nov Dec
puts $lst1 

set lst2 [concat $lst0 $lst1]

puts "[ lrange $lst2 0 [expr [llength $lst2] - 1] ]"

set joined_str [join $lst2 ", "]

puts $joined_str

for {set index 0} { [expr $index < [llength $lst0]] } {incr index} {
puts "[string toupper [lindex $lst0 $index]]"

}

foreach loop_var $lst1 {
puts "[string tolower $loop_var]"
}














