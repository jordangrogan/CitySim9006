require_relative "city"
require_relative "argschecker"

argschecker = ArgsChecker::new
argschecker.check_args(ARGV)

prng = Random::new(ARGV[0].to_i) # If it's a string, .to_i will default to 0

city = City::new
city.run_simulation(prng)
