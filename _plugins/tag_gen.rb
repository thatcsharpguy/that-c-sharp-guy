module Jekyll

  class TagPage < Page    
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_page.html')
      self.data['tag'] = tag
      self.data['title'] = tag
    end
  end
  
  class TagIndex < Page
    def initialize(site, base, dir, tags)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tags'] = tags
      
      
    end
  end

  class TagGenerator < Generator
    safe true
    
    def generate(site)
      if site.layouts.key? 'tag_page'
        dir = 'tag'
        
        write_tag_index(site, dir, site.tags.keys)
        
        site.tags.keys.each do |tag|
          write_tag_page(site, File.join(dir, tag), tag)
        end
      end
    end
  
    def write_tag_index(site, dir, tags)
      index = TagIndex.new(site, site.source, dir, tags)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  
    def write_tag_page(site, dir, tag)
      index = TagPage.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end

end
