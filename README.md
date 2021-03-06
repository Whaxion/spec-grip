# spec-grip

Grip helpers to Crystal's `spec` for easy testing.

Forked from spec-kemal and adapted to [Grip](https://github.com/grip-framework/grip)

## Installation

Add it to your `shard.yml`.

```yaml
name: your-grip-app
version: 0.1.0

dependencies:
  spec-grip:
    github: grip-framework/spec-grip

  grip:
    github: grip-framework/grip
```

## Usage

Just require it before your files in your `spec/spec_helper.cr`

```ruby
require "spec-grip"
require "../src/your-grip-app"
```

Your Grip application

```ruby
# src/your-grip-app.cr

require "grip"

class ExampleController < Grip::Controller::Http
  def get(context)
    "Hello, World!"
  end
end

class Application < Grip::Application
  def initialize
    get "/", ExampleController
  end
end

app = Application.new
app.run
```

Now you can easily test your `Grip` application in your `spec`s.

```
crystal spec -Dtest
```

```ruby
# spec/your-grip-app-spec.cr

describe "Your::Grip::App" do
  # You can use get,post,put,patch,delete to call the corresponding route.
  it "renders /" do
    get "/" do |response|
      response.body.should eq "Hello, World!"
    end
  end

end
```

## Contributing

1. Fork it ( https://github.com/grip-framework/spec-grip/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Whaxion](https://github.com/Whaxion) Whaxion - maintainer of the fork
- [grkek](https://github.com/grkek) Grkek - creator and maintainer of the Grip framework
- [sdogruyol](https://github.com/sdogruyol) Sdogruyol - creator
