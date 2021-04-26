class DashboardController < ApplicationController
  def index
    @sales_amount = Sale.group_by_month(:date, last: 12).order(date: :asc).sum(:amount)
    @sales_count = Sale.group_by_month(:date, last:12).order(date: :asc).count
    @sales_average = Sale.group_by_month(:date, last: 12).order(date: :asc).average(:amount)
    @sales_origin_12 = Sale.where('date >= ?', 1.year.ago.to_datetime).group(:origin).count
    @sales_origin_6 = Sale.where('date >= ?', 6.month.ago.to_datetime).group(:origin).count
    @sales_origin_3 = Sale.where('date >= ?', 3.month.ago.to_datetime).group(:origin).count
    @sales_origin_1 = Sale.where('date >= ?', 1.month.ago.to_datetime).group(:origin).count
    @sales_blend_name_12 = Sale.where('date >= ?', 1.year.ago.to_datetime).group(:blend_name).count
    @sales_blend_name_6 = Sale.where('date >= ?', 6.month.ago.to_datetime).group(:blend_name).count
    @sales_blend_name_3 = Sale.where('date >= ?', 3.month.ago.to_datetime).group(:blend_name).count
    @sales_blend_name_1 = Sale.where('date >= ?', 1.month.ago.to_datetime).group(:blend_name).count
  end
end
