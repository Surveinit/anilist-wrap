class HomeController < ApplicationController
  def index
    data = AnilistService.fetch_top_anime_and_manga
    @top_anime = data["anime"]["media"]
    @top_manga = data["manga"]["media"]
  rescue StandardError => e
    @error = "An error occured: #{e.message}"
  end
end
