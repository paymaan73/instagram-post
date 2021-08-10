# lib/account_details.rb
require 'instagram/post/token.rb'
require 'httparty'
require 'addressable'
module Instagram
  module Post
    LINKACCOUNTS = 'https://graph.facebook.com/v11.0/me/accounts?'
    class Ids
      def initialize(config, token)
        @config                  = config
        @token                   = token
      end

      def accounts
        ids = []
        accounts               = HTTParty.get("#{Instagram::Post::LINKACCOUNTS}access_token=#{@token}")
         get_id_ig_instagram   = JSON.parse(accounts.body)["data"]
         get_id_ig_instagram.each do |ig|
           ids.push ig["id"]
         end
         ids
      end


      def self.accounts(config, token)
        new(config, token).accounts
      end

    end
  end
end
