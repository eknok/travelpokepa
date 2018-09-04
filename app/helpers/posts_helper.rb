module PostsHelper
  def select_spr(value)
    value = value.to_i
   if value >= 1 && value <= 9
     @rand_spr = "00" + value.to_s
   elsif value >= 10 && value <= 99
     @rand_spr = "0" + value.to_s
   else
     @rand_spr = value.to_s
   end
  end

  def array_party(party)
    party.gsub(" ", "").split(",")
  end
end
