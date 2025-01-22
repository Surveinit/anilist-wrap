require "json"
require "httparty"

class AnilistService
  BASE_URL = "https://graphql.anilist.co"

  def self.fetch_top_anime_and_manga
    query = <<~GRAPHQL
            {
      anime: Page(perPage: 20) {
      media(type: ANIME, sort: POPULARITY_DESC) {
      title {
      romaji
      }
      coverImage {
      large
      }
      siteUrl
      }
      }
      manga: Page(perPage: 20) {
      media(type: MANGA, sort: POPULARITY_DESC) {
      title {
      romaji
      }
      coverImage {
      large
      }
      siteUrl
      }
      }
      }
    GRAPHQL

    response = HTTParty.post(BASE_URL, headers: { "Content-Type" => "application/json" }, body: { query: query }.to_json)
    response.parsed_response["data"]
  end
end
