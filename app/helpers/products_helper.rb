module ProductsHelper
  def cal_total(ar,type)
    total = 0
    return total if ar.blank?
    ar.each do |i|
      total += i[type].to_i
    end
    total
  end
end
