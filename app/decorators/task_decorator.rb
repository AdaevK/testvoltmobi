class TaskDecorator < Draper::Decorator
  delegate_all

  def file_link
    if object.file.exists?
      h.link_to 'Скачать', object.file.url(:original), target: '_blank'
    else
      'Не прикреплен'
    end
  end

  def event_buttons
    h.capture do
      if object.may_start?
        h.concat h.link_to 'Начать', h.changed_state_account_task_path(task, event: :start), method: :patch, class: 'btn btn-success'
        h.concat " "
      end
      if object.may_finish?
        h.concat h.link_to 'Завершить', h.changed_state_account_task_path(task, event: :finish), method: :patch, class: 'btn btn-warning'
        h.concat " "
      end
      if object.may_rollback?
        h.concat h.link_to 'Начать снова', h.changed_state_account_task_path(task, event: :rollback), method: :patch, class: 'btn btn-danger'
        h.concat " "
      end
    end
  end

  def human_state
    I18n.t "tasks.states.#{object.state}"
  end
end
