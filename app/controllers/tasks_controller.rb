class TasksController < ApplicationController

  skip_before_action :authorize, only: :index

    def index
        render json: Task.all, status: :ok
      end
    
      def show
        task = find_task
        render json: task, status: :ok
      end
    
      def create
        task = Task.create!(task_params)
        render json: task, status: :created
      end
    
      def update
        task = find_task
        task.update!(task_params)
        render json: task, status: :ok
      end
    
      def destroy
        task = find_task
        task.destroy
        head :no_content
      end
    
    
      private
    
      def find_task
        Task.find(params[:id])
      end
    
      def task_params
        params.permit(:description, :completed, :user_id)
      end
end
