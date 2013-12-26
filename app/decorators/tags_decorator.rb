class TagsDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def name_count(user=nil)
    "#{name}(#{GbRepo.tagged_with(name,:on=>:menus,:owned_by=>user).count()})"
  end
end
