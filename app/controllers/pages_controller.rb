class PagesController < ApplicationController
  def rentals
    @rentals = Rental.where("returned = ? AND user_id = ?", false, current_user.id)
  end
end
