# frozen_string_literal: true

module Instagram
  module Post
    class Config
      attr_accessor :client_id, :app_secret, :redirect_uri, :scope

      def self.config
        conf    = Config.new
        conf.scope = 'email,public_profile,pages_show_list,instagram_basic,instagram_content_publish,pages_show_list'
        yield conf
        {client_id: conf.client_id, app_secret: conf.app_secret, redirect_uri: conf.redirect_uri, scope: conf.scope}
      end
    end
  end
end
