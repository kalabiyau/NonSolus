module ApplicationHelper

  def current_user
    @current_user.try(:decorate)
  end

  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-danger', notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} ") do
          concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
          concat message
        end
      )
    end
    nil
  end
end
