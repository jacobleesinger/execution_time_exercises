def bad_two_sum(arr, target)
  arr.combination(2).to_a.select{|x,y| x+y==target}.length>0
end

def bs(arr, target)
  return nil if target > arr.last || target < arr.first
  return nil if arr.length == 0

  mid = arr.length / 2
  case (target <=> arr[mid])
  when -1
    bs(arr[0...mid], target)
  when 0
    mid
  when 1
    sub_ans = bs(arr[mid..-1], target)
    return sub_ans.nil? ? nil : mid + bs(arr[mid..-1],target)
  end
end

def okay_two_sum(arr, target)
  arr.sort!
  pairs = []
  (0..target/2).each do |i|
    j = target - i
    pairs << [i, j]
  end
  pairs.each do |pair|
    return true if bs(arr, pair[0]) && bs(arr, pair[1])
  end
  false
end

arr = [0,1,5,7]
# p okay_two_sum(arr, 6)

def hash_map_sum(arr, target)
  h = Hash.new{|h,k| h[k] = 0}
  arr.each do |el|
    h[el] += 1
  end
  p h
  pairs = []
  (0..target/2).each do |i|
    j = target - i
    return true if h[j]+h[i] == 2
  end
  false
end

p hash_map_sum(arr, 23)
