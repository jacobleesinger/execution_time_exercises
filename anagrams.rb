class String

	# O(n!)
  def first_anagram?(other_string)
    arr = self.split("").permutation.to_a.map { |el| el.join }
    arr.include?(other_string)
  end

  # O(n^2)
  def second_anagram?(other_string)
		return false if length != other_string.length
    self_str = self.split("")
    other_str = other_string.split("")
		self_str.dup.each do |char|
      if other_str.include?(char)
        self_str.delete_at(self_str.index(char))
        other_str.delete_at(other_string.index(char))
      end
    end
    return true if self_str.empty? && other_str.empty?
    false
  end

	# O(n*log(n))
  def third_anagram?(other_string)
    first_string = self.split("").sort
    second_string = other_string.split("").sort
    return true if first_string == second_string
    false
  end

	# O(n)
	def fourth_anagram?(other_string)
		h = Hash.new{|h,k| h[k] = 0}
		each_char do |el|
			h[el]+=1
		end
		other_string.each_char do |el|
			h[el]-=1
		end
		return true if h.values.all?{|x| x==0}
		false
	end
end

#p "sallly".third_anagram?("sally")
#p "sally".third_anagram?("sallly")
#p "elvis".third_anagram?("lives")
#p ("ba").second_anagram?("ab")
#p "elvis".fourth_anagram?("lives")
#p "sally".fourth_anagram?("gizmo")
p ("ba"*ARGV.first.to_i).fourth_anagram?("ab"*ARGV.first.to_i)
