# Write a method leap_year?. It should accept a year value from the user, check whether it's a leap year, and then return true or false. With the help of this leap_year?() method calculate and display the number of minutes in a leap year (2000 and 2004) and the number of minutes in a non-leap year (1900 and 2005). Note: Every year whose number is divisible by four without a remainder is a leap year, excepting the full centuries, which, to be leap years, must be divisible by 400 without a remainder. If not so divisible they are common years. 1900, therefore, is not a leap year.
def leap_year?(year)
  case  
   when year % 400 == 0 then true  
   when year % 100 == 0 then false  
   else year % 4   == 0  
  end  
end

def days_per_year(year)
  leap_year?(year) ? 366 : 365
end

def minutes_per_year(year)
  days_per_year(year) * 60 * 24
end

puts minutes_per_year(2000)
puts minutes_per_year(2004)
puts minutes_per_year(1900)
puts minutes_per_year(2005)