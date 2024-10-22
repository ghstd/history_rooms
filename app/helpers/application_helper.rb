module ApplicationHelper

  def print_alert_span(source_name)
    if source_name.include?('CohereAiQuestions')
      tag.span "низкое качество"
    else
      nil
    end
  end

end
