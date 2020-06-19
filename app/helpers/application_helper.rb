module ApplicationHelper
  def error_for(model, *attributes)
    return if model.nil?

    mensagem = []
    attributes.each do |attr|
      model.errors[attr].each { |error| mensagem << error if mensagem.exclude?(error) }
    end

    content_tag :span, class: 'error_explanation' do
      mensagem.join(', ')
    end
  end
end
