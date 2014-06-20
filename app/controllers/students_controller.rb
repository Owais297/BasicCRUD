class StudentsController < ApplicationController
    
   before_action :set_user, only: [:update, :edit, :destroy, :show]
  def new
    @student=Student.new
  end

  def edit
  end

  def destroy
    @student.destroy
    respond_to do |format|
      flash[:notice] = "Successfully destroyed post."
      format.html { redirect_to student_url }
      format.json { head :no_content }
    end

  end


  def show
     @students = Student.find_by_id(params[:id])
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'User account successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  def index
    @students=Student.all
  end
  def create
    @student = Student.new(student_params)
    #@student = Student.new(params[:student])
    respond_to do |format|
      if @student.save

        format.html { redirect_to @student, notice: 'Student Login successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }

      end
    end
  end
  end
  def student_params
    params.require(:student).permit(:username, :password)
  end


  def set_user
       @student = Student.find(params[:id])
    end
