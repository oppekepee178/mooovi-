class ReviewsController < RankingController

  def new
   @reviews = Reviews.new
  end

end
