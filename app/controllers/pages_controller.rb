class PagesController < ApplicationController
  before_action :authorize, only: [:secret]

  def buildbox
  end

  def secret
  end
end
