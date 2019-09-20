def count_bounces(n)
  wh = 1.5
  bounce_height = (n * 0.66)
  count = 2
  
  p "hello"

  if n < 0 || n < wh
    return -1
  end

  while bounce_height > wh
    bounce_height = (bounce_height * 0.66)

    if bounce_height < wh
      count += 1
    else
      count += 2
    end
  end

  count
end

p count_bounces(4)
p count_bounces(3)
p count_bounces(1)
