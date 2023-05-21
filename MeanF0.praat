form Process files...
  sentence Path C:\Users\Hanane AMRANE\Documents\lowerpitcheF\
endform

# Optional: make sure the path has a trailing slash
path$ = if right$(path$) = "/" then path$ else path$ + "/" fi

output = Create Table with column names: "output", 0,
  ... "file mean_pitch"

files = Create Strings as file list: "files", path$ + "*wav"
total_files = Get number of strings
for i to total_files
  selectObject: files
  filename$ = Get string: i
  sound = Read from file: path$ + filename$

  # Run whatever kind of analysis you want here
  # For example, get the mean pitch for each file

  pitch = To Pitch: 0, 75, 600
  mean = Get mean: 0, 0, "Hertz"
