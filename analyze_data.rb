# This is a program made to output the Z-Scores of a set of data representing the average temperatures each month at Laguardia Airport since the early 1800s
puts "This is a program that obtains the z-scores of the data set representing the average temperature each month at Laguardia Airport."

# Read in data
f = File.new("avTemp.dat","r")
data = f.readlines
f.close

# Format the data so it can be used
av_temps = data.collect do |av_temp|
	av_temp = av_temp.split(",")
	av_temp[1].to_f
end

# Find the mean of the numbers
sum = 0
amountofData = av_temps.length
av_temps.each do |av_temp|
	sum = av_temp.to_f + sum
end
mean = sum / amountofData

# Find the standard deviation
variances = av_temps.collect do |av_temp|
	adn = av_temp.to_f - mean
	adn2 = (adn * adn)
end
sum2 = 0
variances.each do |dummy|
	sum2 = dummy.to_f + sum2
end
mean_sd = sum2 / amountofData
standard_deviation = Math.sqrt(mean_sd)

# Find the z-scores
zScores = av_temps.collect do |avtemp|
	(avtemp - mean) / standard_deviation
end

# Write converted data
g = File.new("zScores.dat","w")
g.puts(zScores)
g.close
puts "The mean of the data is apporximatley " + mean.round(4).to_s + "."
puts "The standard deviation is approximatley " + standard_deviation.round(4).to_s + "."
puts "The z-scores have been put into the 'zScores.dat' file."

# Please don't copy my program. It would be greatly appreciated that I don't get in trouble for helping people plagerize. 
