def average_numbers(collection)
  accumulator = 0.0
  if !collection.empty?
    collection.each do |n|
      accumulator += n
    end
    accumulator / collection.count
  end
end
