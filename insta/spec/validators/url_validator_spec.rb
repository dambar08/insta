require "rails_helper"
require_relative "../../app/validators/url_validator"

RSpec.describe URLValidator do
  let(:record_class) do
    Class.new do
      include ActiveModel::Model

      attr_accessor :website

      validates_with URLValidator, attributes: [:website]
    end
  end

  it "accepts HTTP and HTTPS URLs with a host" do
    ["http://example.test", "https://example.test/path"].each do |website|
      expect(record_class.new(website: website)).to be_valid
    end
  end

  it "rejects unsupported schemes" do
    expect(record_class.new(website: "ftp://example.test")).not_to be_valid
  end

  it "rejects URLs without a host" do
    expect(record_class.new(website: "https:///path")).not_to be_valid
  end

  it "rejects malformed URLs" do
    expect(record_class.new(website: "http://exa mple.test")).not_to be_valid
  end
end