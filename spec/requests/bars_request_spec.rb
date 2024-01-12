require "rails_helper"

RSpec.describe "/bars" do
  let(:body) { JSON.parse(response.body, symbolize_names: true) }

  it "handles searches with both options" do
    post '/bars/search', params: { foo: 'fff', user_id: 1 }, as: :json

    expect(body).to eq(search_params: { foo: 'fff', user_id: 1 })
  end

  it "handles searches without a user ID" do
    post '/bars/search', params: { foo: 'fff' }, as: :json

    expect(body).to eq(search_params: { foo: 'fff' })
  end

  it "handles searches without a null user ID" do
    post '/bars/search', params: { foo: 'fff', user_id: nil }, as: :json

    expect(body).to eq(search_params: { foo: 'fff', user_id: nil })
  end

  it "rejects searches with an empty string user ID" do
    expect { post '/bars/search', params: { foo: 'fff', user_id: '' }, as: :json }
      .to raise_exception RailsParam::InvalidParameterError, "'' is not a valid Integer"
  end

  it "rejects searches with a string user ID" do
    expect { post '/bars/search', params: { foo: 'fff', user_id: 'abc' }, as: :json }
      .to raise_exception RailsParam::InvalidParameterError, "'abc' is not a valid Integer"
  end

  it "handles searches with just a user ID" do
    post '/bars/search', params: { user_id: 1 }, as: :json

    expect(body).to eq(search_params: { user_id: 1 })
  end
end
