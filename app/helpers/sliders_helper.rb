module SlidersHelper
  def slider_for(sliders)
    Slider.new(self, sliders).html
  end

  class Slider
    def initialize(view, sliders)
      @view, @sliders = view, sliders
      @uid = SecureRandom.hex(6)
    end

    def html
      # content = safe_join([indicators, slides, controls])
      content = safe_join([indicators, slides, controls])
      content_tag(:div, content, id: uid, class: 'carousel slide')
    end

    private

    attr_accessor :view, :sliders, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = @sliders.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: {
          target: uid,
          slide_to: index
        }
      }

      content_tag(:li, '', options)
    end

    def slides
      items = sliders.map.with_index { |slider, index| slide_tag(slider, index.zero?) }
      # items2 = sliders.map.with_index { |slider, index| slide2_tag(slider, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')

      # content_tag(:div, safe_join(items+items2), class: 'carousel-inner')


      # content_tag(:h3, safe_join(items), class: 'carousel-inner')



    end

    def slide_tag(slider, is_active)
      options = {
        class: (is_active ? 'item active' : 'item'),
      }

      content_tag(:div, image_tag(slider.image.url(:large)), options)
      # content_tag(:h3, slider.title, class: 'carousel-caption')
    end

    # def slide2_tag(slider, is_active)
    #   # options = {
    #   #   class: (is_active ? 'item active' : 'item'),
    #   # }
    #   #
    #   # content_tag(:div, image_tag(slider.image.url(:large)), options)
    #   content_tag(:h3, slider.title, class: 'carousel-caption')
    # end

    def controls
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, '', class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end

  end
end
