class TaskDecorator < Draper::Decorator
  delegate_all

  def file_link
    if object.file.exists?
      h.link_to 'Скачать', object.file.url(:original), target: '_blank'
    else
      'Не прикреплен'
    end
  end
end
