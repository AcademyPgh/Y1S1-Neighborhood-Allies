class SeedGenController < ApplicationController
  def index
    @org = Organization.all
    @fundcats = FundCatA.all
  end
end
