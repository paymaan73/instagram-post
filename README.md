# Instagram::Post

Hello, this can be the first demo of my jam. I must say that here and now you can only post photos on your Instagram page.I will put more features in the next updates

## Terms of Use

Must be a BUSINESS Instagram account

Instagram account must be connected to Facebook page


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instagram-post'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install instagram-post

## Usage

Generate config inside initialize path:

    insconf = Instagram::Post::Config.config do |conf|
        conf.client_id       = 'xxxxxxxxxxxxxxxx'
        conf.app_secret      = 'xxxxxxxxxxxxxxxx'
        conf.redirect_uri    = 'https://wwww.xxx.com'
    end
    
Create link for facebook authentic

    @link  = Instagram::Post::Auth.link(insconf)


Send photo to page instagram 

    Instagram::Post::Send.post(imageurl, caption, config, request)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paymaan73/instagram-post. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/paymaan73/instagram-post/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Instagram::Post project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/instagram-post/blob/master/CODE_OF_CONDUCT.md).
