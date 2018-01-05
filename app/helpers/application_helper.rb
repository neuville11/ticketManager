module ApplicationHelper

  def datetime_format(date)
    I18n.l date, format: :long unless date.blank?
  end

  def request_action
    params[:action]
  end
end
