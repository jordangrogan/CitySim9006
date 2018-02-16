class ArgsChecker

  def check_args(arr)
    raise "Enter a seed and only a seed" unless arr.size == 1
    if arr[0].is_a?(Integer)
      seed = arr[0]
    else
      seed = 0
    end
    seed
  end

end
