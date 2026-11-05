class EmployeesController < ApplicationController
	before_action :set_employee, only: [:show, :edit, :update, :destroy]

	def index 
		if params[:search].present? 
			@employees = Employee.search(params[:search]) 
		else 
			@employees = Employee.all
		end
	end

	def show
	end 

	def
	 new
	  @employee = Employee.new 
	  @managers = Employee.all
	end


	def create 
		@employee = Employee.new(employee_params)
		@managers = Employee.all

		 if @employee.save
		  redirect_to employees_path
		  else 
		  	render :new 
		 end
	end


	def edit
		@managers = Employee.where.not(id: @employee.id)
	end

	def update
		@managers = Employee.where.not(id: @employee.id)
		
		if @employee.update(employee_params)
		  redirect_to employees_path
		  else 
		  	render :edit
		end
	end

	def destroy 
		@employee.destroy
		redirect_to employees_path 
	end

	private

	def set_employee
		@employee = Employee.find(params[:id])
	end

	def employee_params 
		params.require(:employee).permit(:name, :email, :department, :salary, :manager_id)
	end

end
