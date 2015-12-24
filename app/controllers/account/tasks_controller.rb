class Account::TasksController < Account::BaseController

  def index
    @tasks = Task.accessible_by(current_ability).paginate(page: params[:page], per_page: 10)
  end

  def changed_state
    if params[:event] and @task.respond_to?(params[:event]) and @task.send(:"#{params[:event]}!")
      flash[:notice] = 'Статус успешно изменен.'
    elsif @task.errors.any?
      flash[:alert] = @task.errors.full_messages.join('. ') + '. Перейдите в редактирование задачи и исправьте ошибки.'
    else
      flash[:alert] = 'Неверный статус.'
    end

    redirect_to [:account, @task]
  end

  private

    def task_params
      params.require(:task).permit(:name, :description, :file)
    end
end
