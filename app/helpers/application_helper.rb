module ApplicationHelper

  def admintypes
    ['AdminUser']
  end

  def active?(path)
    "active" if current_page?(path)
  end

  def status_look status
    status_span_generator status
  end

  def employee?
    current_user.type == 'Employee'
  end

  def manager_or_admin?
    admintypes.include?(current_user.type)
  end

  private

  def status_span_generator  status
    case status
    when "submitted"
      content_tag(:span, status.titleize, class: "label label-primary")
    when "approved"
      content_tag(:span, status.titleize, class: "label label-success")
    when "rejected"
      content_tag(:span, status.titleize, class: "label label-danger")
    when "confirmed"
      content_tag(:span, status.titleize, class: "label label-success")
    when "pending"
      content_tag(:span, status.titleize, class: "label label-primary")
    end
  end
end
