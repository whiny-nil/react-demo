class CommentsController < ApplicationController
  before_filter :initialize_comments

  def index
    respond_to do |format|
      format.json do
        render :json => comments.to_json
      end
    end
  end

  def create
    add_comment params
    respond_to do |format|
      format.json do
        render :json => comments.to_json
      end
    end
  end

  private

  def initialize_comments
    @@comments ||= [
      { author: "whiny_nil", text: "Wow! This is teh bomb" },
      { author: "eimaj", text: "You said it!" },
      { author: "imartron", text: "Could this be any more awesome?" },
      { author: "omgsean", text: "Probably" }
    ]
  end

  def comments
    @@comments
  end

  def add_comment(comment)
    @@comments.push comment
  end
end
