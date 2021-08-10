# frozen_string_literal: true

module Instagram::Post
  class Account
    def initialize(config, token)
      @config = config
      @token = token
    end

    def generate_id(image_url, caption)
      ids = []
      published_id = Instagram::Post::Publish.new(@config, @token).published_id
      published_id.each do |id|
        post_published_id = HTTParty.post("https://graph.facebook.com/#{id}/media?access_token=#{token}",
                                          :body => {
                                            image_url: image_url,
                                            caption: caption
                                          }
                                         )
        ids.push(JSON.parse(post_published_id.body)["id"])
      end
      ids
    end
  end
end
