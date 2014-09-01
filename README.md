# Fleck

An inflection-based command line search tool. Utilizes [ActiveSupport::Inflectors][inflectors].

## Installation

If you're on Mac OS, install with [Homebrew][brew]:

```bash
$ brew tap tubbo/brewery
$ brew install fleck
```

You can also install with [RubyGems][gem] on any platform that supports Ruby:

```bash
$ gem install fleck
```

## Usage


Search all files recursively in the current directory that match both
`"ContentFile"` and `"ContentFile".tableize`, which is `"content_file"`:

```bash
$ fleck 'ContentFile' --inflectors=underscore
```

Replace `ContentFile` and `content_file` with `Video` and `video`,
respectively:

```bash
$ fleck 'ContentFile' --inflectors=underscore --replace-with=Video
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fleck/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[inflectors]: http://api.rubyonrails.org
[brew]: http://homebrew.sh
[gem]: http://rubygems.org
