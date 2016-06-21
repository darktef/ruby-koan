# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE

  results = 0
  results += 1 if a == b
  results += 1 if a == c 	
  results += 1 if b == c
 
  case results
  when 0
  	:scalene
  when 1
  	:isosceles
  else
  	:equilateral
  end

end

# After I read their solutions...I really need to re-examine the problem possibility
# and different method Ruby has
# most impressive is the array.uniq.length
# http://stackoverflow.com/questions/4742692/a-more-elegant-solution-to-ruby-koans-triangle-rb


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
