class Account::TasksController < Account::BaseController

  def index
    @tasks = Task.accessible_by(current_ability).paginate(page: params[:page], per_page: 10)
  end

  private

    def task_params
      params.require(:task).permit(:name, :description, :state)
    end
end
