module ApplicationHelper
  def bootstrap_flash_type(type)
    case type
    when 'notice'
      'success'
    when 'error'
      'danger'
    else
      'info'
    end
  end
end
