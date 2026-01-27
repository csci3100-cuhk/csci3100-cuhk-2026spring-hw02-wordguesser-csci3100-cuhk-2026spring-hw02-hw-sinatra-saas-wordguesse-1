require 'webmock/cucumber'

Before do
  stub_request(:get, "https://random-word-api.vercel.app/api").to_return(status: 200, headers: {},
                                                                             body: ["testword"].to_json)
end
