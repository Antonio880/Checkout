class Admin::DashboardController < Admin::BaseController
    def index
      @total_sales = Sale.count
      @total_revenue = Sale.sum(:amount_cents) / 100.0
      @courses_count = Course.count
      @courses = Course.all
    end
end