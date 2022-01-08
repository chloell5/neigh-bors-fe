class TextsController < ApplicationController

  def create
    t = TwilioTextMessenger.new(params[:message], params[:recipient_number])
    t.call
    redirect_to '/'
  end
end
