class Admin::CoursesController < Admin::BaseController
    before_action :set_course, only: %i[edit show update destroy]
  
    def show; @course = Course.find(params[:id]); end

    def index; @courses = Course.all; end
    
    def new; @course = Course.new; end
    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to admin_courses_path, notice: 'Curso criado.'
      else
        render :new
      end
    end
    
    def edit; end
    def update
      if @course.update(course_params)
        redirect_to admin_courses_path, notice: 'Curso atualizado.'
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      flash[:notice] = 'Curso deletado.'
      
      @total_sales = Sale.count
      @total_revenue = Sale.sum(:amount_cents) / 100.0
      @courses_count = Course.count
      @courses = Course.all
    
      render 'admin/courses/index'
    end
  
    private
    def set_course; @course = Course.find(params[:id]); end
    def course_params
      params.require(:course).permit(:title, :description, :price_cents)
    end
end