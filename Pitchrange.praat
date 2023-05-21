form Enter Full Path + \
sentence path C:\Users\Hanane AMRANE\Documents\lowerpitcheF\
endform

filedelete 'path$''name$'pitch_range.csv
header_row$ = "Filename" + tab$ + "Mean F0" + tab$ + "mean SD"  + tab$ + "min pitch" + tab$ + "max pitch" + newline$
header_row$ > 'path$'pitch_range.csv

Create Strings as file list...  list 'path$'*.wav
number_files = Get number of strings
for j from 1 to number_files
   select Strings list
   current_token$ = Get string... 'j'
   Read from file... 'path$''current_token$'
   To Pitch (ac)... 0.01 75 15 no 0.03 0.45 0.01 0.35 0.14 600 
   minpitch = Get minimum... 0 0 Hertz Parabolic
   maxpitch = Get maximum... 0 0 Hertz Parabolic
   range = maxpitch - minpitch
   fileappend "'path$'pitch_range.csv" 'current_token$' 'tab$' 'range:4' 'newline$'
   Remove
endfor
