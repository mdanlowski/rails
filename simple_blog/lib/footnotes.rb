if not Gem.win_platform?
	require "rails-footnotes"

	Footnotes.setup do |config|
	  config.before {|controller, filter| filter.notes = controller.class.name =~ /Message/ && \
	    controller.action_name == 'index' ? [:assigns] : []}
	  config.before {|controller, filter| filter.notes |= [:params] if controller.class.name =~ /Profile/ && \
	    controller.action_name == 'edit' }
	end	
end
