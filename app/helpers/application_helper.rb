module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end

  def admin_only(&block)
    block.call if current_user.try(:admin?)
  end

  def authorized?(permission, thing, &block)
    block.call if can?(permission, thing) || current_user.admin?
  end
end
