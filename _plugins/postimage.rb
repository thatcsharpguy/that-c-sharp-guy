module Jekyll
  class PostImageTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @values = text.split(" ", 2)
      @image_file = @values.first
      @alt_text = @values.last.strip
    end

    def render(context)
      @page_url = context.environments.first["page"]["url"]
      @r = @page_url.split("/", 3)
      @pg = @r.last
      "<figure><img src='/postimages/#{@pg}#{@image_file}' alt='#{@alt_text}' /></figure>"
    end
  end
end

Liquid::Template.register_tag('post_image', Jekyll::PostImageTag)