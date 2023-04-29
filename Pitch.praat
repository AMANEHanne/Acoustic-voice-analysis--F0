form Process files...
  sentence Path
endform

# Optional: make sure the path has a trailing slash
path$ = if right$(Path) = "/" then Path else Path + "/" fi

# Create output table with column names
Create Table with column names: "output", 0, "File", "mean_pitch", "min_pitch", "max_pitch"

# Get list of files in directory
files = Get File List: path$ + "*.wav"

# Loop through each file and analyze pitch
for i from 1 to length(files)
  file$ = files[i]
  # Get mean pitch, min pitch, and max pitch
  sound = Read from file: path$ + file$
  pitch = To Pitch: 0, 75, 600
  mean_pitch = Get mean: 0, 0, "Hertz"
  min_pitch = Get minimum: 0, 0, "Hertz"
  max_pitch = Get maximum: 0, 0, "Hertz"
  
  # Append data to output table
  Append row to table: file$, mean_pitch, min_pitch, max_pitch
endfor

# Save output table as CSV
Save as comma-separated values file: path$ + "output.csv"
