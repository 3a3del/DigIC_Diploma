
puts "**** String Manipulation Lab ****"


set str1 MahmoudAhmed@gmail.com
set str2 MostafaAli@hotmail.com

#1st Requirement
set strlen [string length $str1]
puts "The Length of str1 is $strlen"                 

#2nd Requirement
set at_index [string last @ $str1]
set lst_ch_index [expr $at_index - 1]
set mailName [string range $str1 0 $lst_ch_index]
puts "str2 Email Name is [string toupper $mailName]"


#3rd Requirement
set at_index [string last @ $str2]
set domain_srt [expr $at_index + 1]
set dot_index [string last . $str2]
set domain_end [expr $dot_index - 1]
set domainName [string range $str2 $domain_srt $domain_end]
puts "str2 domain Name is $domainName"

#4th Requirement
set NewMail [append mailName {@hotmail.com}]
puts "$NewMail"

#5th Requirement
if {[string match *@gmail* $str1]} {
puts "it is a gmail account"
} else {
puts "it is not a gmail account"
}


