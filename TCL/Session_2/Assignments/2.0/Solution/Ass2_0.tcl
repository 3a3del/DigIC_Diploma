
puts "**** Reporting Files types & change files paths  ****"


set cities [list cairo \
                 alexandria \
				 damietta \
                 dakahlia \
                 faiyum \
                 sohag \
                 aswan]

puts $cities
				 
set Cities_New ""				 



foreach loop $cities {
     set fr_ch [string toupper [string index $loop 0]]
	 set rest_chs [string tolower [string range $loop 1 [expr [string length $loop] - 1 ] ] ]	 
	 append Cities_New $fr_ch $rest_chs { }
}

puts $Cities_New



