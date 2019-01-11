class PagesController < ApplicationController
  
  layout false		# turn off the layouts

  def index
    @array = [1,2,3,4,5]

  	render('index') # default, always in place - can be overriden -> last lines comments
  	@numero = [params[:unicorn], params[:id]]
  end

  def contact
  end

  def about
  end

  def hello 
    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page]
  # action doesnt need to be defined 
  # if there is nothing specified inside,
  # but it is good practice
  	
  end

  def user_panel
  	# redirect mocking an unsigned user
  	redirect_to(:controller => 'pages', :action => 'login')
  	
  end

  def login
  end

end

# The Render() syntax:
# render(:template => 'pages/hello')
# render('pages/hello') - since templates are what is rendered most of the times
# render('hello') - since the file resides in the controller-analogous dir
