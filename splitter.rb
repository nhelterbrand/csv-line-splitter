require 'csv'

#need to be able to
#take multiple column headers to split into lines seperate lines
def csv_splitter (originalFilePath, modifiedFilePath="line_split_file_modified.csv")

  if File.exist?(originalFilePath)
    outputCSV = CSV.open(modifiedFilePath, "wb")

    #set desired column headers
    outputCSV << ["Name", "Price", "Description"]

    #iterate through each row and expand the rows to fill the desired column header scenario
    CSV.foreach(originalFilePath, :headers=>true) do |row|
      outputCSV << [row["Name"], row["Price A"], row["Description A"]]
      outputCSV << [row["Name"], row["Price B"], row["Description B"]]
      outputCSV << [row["Name"], row["Price C"], row["Description C"]]
    end
  else
    puts "File doesnt exist: #{originalFilePath}"
  end
end

csv_splitter("original_test_csv.csv")
