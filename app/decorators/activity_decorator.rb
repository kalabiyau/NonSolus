class ActivityDecorator < Draper::Decorator
  delegate_all

  def capacity_numbers
    of = object.capacity.zero? ? '&infin;' : object.capacity
    "#{object.users.count}/#{of}".html_safe
  end

end
