def did_not_attempt(quiz)
  total_participants = quiz.size
  attempted = quiz.inject {|sum, element| sum+element}
  did_not_attempt = total_participants - attempted
  puts "The number of participants who did not attempt Quiz 1 is #{did_not_attempt} out of #{total_participants} total participants."
end


quiz = [0,0,0,1,0,0,1,1,0,1]
did_not_attempt(quiz)
