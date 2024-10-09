# Name Mangler

@name = "Johanna Jackson"

# Mangle the name by reversing it or borgifying it
def reverse(name)
  reverse_name = @name.split.reverse.join(' ')
  return reverse_name
end

def borgify(name)
  return name << " Borg"
end

puts "New name: #{reverse(@name)}"
puts "New borg name: #{borgify(@name)}"