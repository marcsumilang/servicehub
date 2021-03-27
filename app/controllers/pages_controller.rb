class PagesController < ApplicationController
  def index
    @testenv = ENV['TEST_ENV']
  end

  def privacy
  end

  def terms
  end

  def deletion
  end
end
