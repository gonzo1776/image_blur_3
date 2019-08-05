class Image

    def initialize(list_of_numbers)
      @list_of_numbers = list_of_numbers # make list available everywhere
      for row in list_of_numbers do
        puts(row.join(" ")) # print list
      end
   
    end
   
    def find_one(distance)
      array_clone = Marshal.load(Marshal.dump(@list_of_numbers))
      k = 0
   
      while k < distance do
        i = 0
  
        for row in @list_of_numbers do
          j = 0 # reset j to 0
  
          for number in row do
            if number == 1
   
              if i != 0
                array_clone[i - 1][j] = 1 # row above
              end
              if i != @list_of_numbers.length - 1
                array_clone[i + 1][j] = 1 # row below
              end
              if j != 0
                array_clone[i][j - 1] = 1 # column in front
              end
              if j != row.length - 1
                array_clone[i][j + 1] = 1 # column after
              end
   
            end
            j += 1
  
          end
          i += 1
        end
   
        @list_of_numbers = Marshal.load(Marshal.dump(array_clone))
        k += 1
      end
  
    print @list_of_numbers
    end
   
  end
   
   image = Image.new([
    [0,0,0,0],
    [0,0,0,0],
    [0,0,0,0],
    [0,1,0,0],
    [0,0,0,0],
    [0,0,0,0]
   ])
   image.find_one(2)
   