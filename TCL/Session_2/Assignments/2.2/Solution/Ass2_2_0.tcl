

set fh [open rtl.txt r+]
set file_data [read $fh]

set designs ""

regsub -all "\n" $file_data " " designs

puts "$designs"