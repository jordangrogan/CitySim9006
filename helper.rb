# The pluralize helper method takes in a singular string and
#   adds the appropriate ending to make it plural
def pluralize(singularStr, num)
  if num == 1
    return singularStr
  else
    if singularStr[-1] == "s" # singularStr[-1] returns last character of string
      return "#{singularStr}es"
    else
      return "#{singularStr}s"
    end
  end
end
