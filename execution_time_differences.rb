class Array
	def my_min
		my_min = first
		each.with_index do |el, i|
			(i+1...length).each do |el2|
				if self[el2] < my_min
					my_min = self[el2]
				end
			end
		end
	my_min
	end

	def my_min2
		my_min = first
		each do |el|
			if el < my_min
				my_min = el
			end
		end
		my_min
	end

	def largest_sub_sum
		subarrays = []
		(0...length).each do |i|
			(0...length).each do |j|
				subarrays << self[i..j]
			end
		end
		subarrays.reject{ |x| x.empty? }.map{|x| x.reduce(:+)}.max
	end

	def max_cum_sum_idx
		cum_sum = 0
		max_cum_sum = first
		best_idx = 0
    each.with_index do |el, i|
			cum_sum += el
			if cum_sum > max_cum_sum
				max_cum_sum = cum_sum 
				best_idx = i
			end
		end
		best_idx
	end

	def better_largest_sub_sum
		starting_idx = length - (self.reverse).max_cum_sum_idx - 1
		ending_idx = max_cum_sum_idx
		self[starting_idx..ending_idx].reduce(:+)
	end

end

p [-2, 1, -3, 4, -1, 2, 1, -5, 4].better_largest_sub_sum
p [-1, 5, 3,-7, 10, 10, 2].better_largest_sub_sum

#list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#p list.my_min  # =>  -5
#p list.my_min2  # =>  -5
#time complexity is O(n^2)
