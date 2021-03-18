# Thumbnails with Dragonfly for Bridgetown

_Starting with Bridgetown v0.15, you can run_ `bridgetown plugins new` _to easily set up a customized verison of this starter repo._

Bridgetown Dragonfly Thumbnailer is a Bridgetown plugin that lets you easily create thumbnails using Dragonfly's fantastic thumb processor.

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridetown-dragonfly_thumbnailer -g bridgetown_plugins
```

## Usage

This plugin adds the liquid filter `thumbnail` that lets you create scaled versions of pictures.

    {{ images/intro.jpg | thumbnail:'200x150' }}

In development, this will create base64-image data right in your HTML.
When you deploy (with BRIDGETOWN_ENV=production), it'll write the scaled images to disk.
In the above example, it'd save it in `output/images/200x150/intro.jpg`

_Note, providing no geometry parameter to the filter will default to `100x100`._

Checkout the [Dragonfly documentation](https://markevans.github.io/dragonfly/imagemagick) to learn more about its resizing and cropping syntax.

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/username/my-awesome-plugin/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

----

## Releasing (you can delete this section in your own plugin repo)

To release a new version of the plugin, simply bump up the version number in both `version.rb` and
`package.json`, and then run `script/release`. This will require you to have a registered account
with both the [RubyGems.org](https://rubygems.org) and [NPM](https://www.npmjs.com) registries.
You can optionally remove the `package.json` and `frontend` folder if you don't need to package frontend
assets for Webpack.

If you run into any problems or need further guidance, please check out our [Bridgetown community resources](https://www.bridgetownrb.com/docs/community)
where friendly folks are standing by to help you build and release your plugin or theme.

**NOTE:** make sure you add the `bridgetown-plugin` [topic](https://github.com/topics/bridgetown-plugin) to your
plugin's GitHub repo so the plugin or theme will show up on [Bridgetown's official Plugin Directory](https://www.bridgetownrb.com/plugins)! (There may be a day or so delay before you see it appear.)
