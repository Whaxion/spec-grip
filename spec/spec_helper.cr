require "spec"
require "grip"
require "../src/spec-grip"

Spec.before_each do
  config = Grip.config
  config.env = "test"
  config.setup
end

Spec.after_each do
  Grip.config.clear
end

class HelloWorldHttpConsumer < Grip::HttpConsumer
  def get(req)
    "Hello world"
  end
end

class PostHttpConsumer < Grip::HttpConsumer
  def post(req)
    req.params.json.to_json
  end
end

class HelloWorld < Grip::Application
  scope do
    get "/", HelloWorldHttpConsumer
  end
end

class Post < Grip::Application
  scope do
    post "/user", PostHttpConsumer
  end
end
