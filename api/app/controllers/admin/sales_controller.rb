class Admin::SalesController < Admin::BaseController
    def index; @sales = Sale.order(created_at: :desc); end
    def show; @sale = Sale.find(params[:id]); end
end