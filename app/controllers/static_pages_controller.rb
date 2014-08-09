class StaticPagesController < ApplicationController

def home
  if signed_in?
  	@item = current_user.items.build
  end
end

  def giving
  end
end
