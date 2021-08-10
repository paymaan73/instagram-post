# frozen_string_literal: true

module Instagram::Post
  class Publish
    attr_accessor :token
    def initialize(config, token)
      @config  = config
      @token = token
    end

    def published_id
      instagram_business_id = []
      ids = Instagram::Post::Ids(@config, @token)
      ids.each do |id|
        account = HTTParty.get("https://graph.facebook.com/v11.0/#{id}?fields=instagram_business_account&access_token=#{@token}")
        if JSON.parse(account.body)["instagram_business_account"]["id"]
          instagram_business_id.push(JSON.parse(account.body)["instagram_business_account"]["id"])
        end
      end
      instagram_business_id
    end
  end
end
