# frozen_string_literal: true

# The MarkdownFormatter class, which prepares Markdown for display on the web.
class MarkdownFormatter

  def initialize
    config = YAML.load_file("#{Rails.root}/config/redcarpet_options.yml")

    html_renderer = Redcarpet::Render::HTML.new(config['html_render_options'])

    @renderer = Redcarpet::Markdown.new(
      html_renderer,
      config['markdown_render_options']
    )
  end

  def render(text)
    @renderer.render(text)
  end
end
