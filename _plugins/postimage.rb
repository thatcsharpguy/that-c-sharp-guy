module Jekyll
  class PostImageTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @values = text.split(" ", 2)
      @image_file = @values.first
      @alt_text = @values.last
    end

    def render(context)
      @page_url = context.environments.first["page"]["url"]
      "<img src='/postimages#{@page_url}#{@image_file}' alt='#{@alt_text}' />"
    end
  end
end

Liquid::Template.register_tag('post_image', Jekyll::PostImageTag)