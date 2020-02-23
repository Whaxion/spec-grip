require "./spec_helper"

describe "SpecGripApp" do

  it "handles get" do
    HelloWorld.new.run
    get "/"
    response.body.should eq "Hello world"
  end

  it "handles post" do
    Post.new.run
    json_body = {"name": "Serdar", "age": 27, "skills": ["crystal, grip"]}
    post("/user", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: json_body.to_json)
    response.body.should eq(json_body.to_json)
  end
end
