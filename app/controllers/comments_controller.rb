class CommentsController < ApplicationController
  def index
    comments = [
      { author: "whiny_nil", text: "Wow! This is teh bomb" },
      { author: "eimaj", text: "You said it!" }
    ]

    respond_to do |format|
      format.json do
        render :json => comments.to_json
      end
    end
  end
end