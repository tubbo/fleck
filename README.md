# Fleck

An inflection-based command line search tool. Utilizes [ActiveSupport::Inflectors][inflectors].

## Installation

If you're on Mac OS, install with [Homebrew][brew]:

```bash
$ brew install tubbo/homebrew/fleck
```

You can also install with [RubyGems][gem] on any platform that supports Ruby:

```bash
$ gem install fleck
```

## Usage

Search all files recursively in the current directory that match both
`"ContentFile"` and `"ContentFile".tableize`, which is `"content_file"`:

```bash
$ fleck search 'ContentFile' --inflectors=underscore
```

Since *search* is the default command, you can just type the following
to search project-wide:

```bash
$ fleck 'ContentFile'
```

Replace `ContentFile` and `content_file` with `Video` and `video`,
respectively:

```bash
$ fleck replace 'ContentFile' 'Video' --inflectors=underscore
```

You can also use Fleck to find words within a file:

```bash
$ fleck find 'ContentFile' app/models/content_file.rb
```

It supports all of the other method options.

### Method Options

- **inflectors:** Control the inflectors that are additionally queried
- **exclude:** Provide glob patterns to omit from searching

## Configuration

Add a **~/.fleck.yml** file with default values for the method options:

```yaml
inflectors:
  - underscore
exclude:
  - vendor
  - pkg
  - tmp
```

Now, you can just type the basic commands to do your searches:

```bash
$ fleck ContentFile
$ fleck search ContentFile
$ fleck replace ContentFile Video
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
