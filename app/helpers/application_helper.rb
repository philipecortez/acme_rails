module ApplicationHelper
  def set_class_for_attr_public(task_list)
    if task_list.public?
      'fa fa-check-square-o fa-2x'
    else
      'fa fa-square-o fa-2x'
    end
  end

  def set_class_for_attr_completed(task)
    if task.completed?
      'line-through'
    else
      ''
    end
  end
end
