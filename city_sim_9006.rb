require_relative "city"

raise "Enter a seed and only a seed" unless ARGV.count == 1
prng = Random.new(ARGV[0].to_i) # If it's a string, .to_i will default to 0

city = City::new
city.run(prng)
