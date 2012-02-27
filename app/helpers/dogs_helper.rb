module DogsHelper

  def basic_stats(dog)
    "<ul class=\"basic_stats\">
      <li>#{dog.breed}</li>
      <li>#{dog.sex}</li>
      <li>#{dog.age}</li>
      <li>#{dog.weight}</li>
      <li>#{dog.color}</li>
    </ul>"
  end
  
  def popover_text(dog)
    raw "#{dog.breed} #{dog.sex} #{dog.age}"
  end
  
end
