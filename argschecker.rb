class ArgsChecker
  def check_args arr
    raise "Enter a seed and only a seed" unless ARGV.count == 1
     # etc.
  end
end
