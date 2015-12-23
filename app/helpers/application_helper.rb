module ApplicationHelper

  def class_for_state state
    case state
    when 'new' then 'alert-info'
    when 'started' then 'alert-success'
    else
      'alert-danger'
    end
  end
end
