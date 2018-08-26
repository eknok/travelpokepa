module ToppagesHelper

  # トップページのドット絵のランダムに使用
  def random_spr
   @rand = rand(1..721)
   if @rand >= 1 && @rand <= 9
     @rand_spr = "00" + @rand.to_s
   elsif @rand >= 10 && @rand <= 99
     @rand_spr = "0" + @rand.to_s
   else
     @rand_spr = @rand.to_s
   end
  end
end
