require 'spec_helper'

describe PhotoFetcher do
  subject { PhotoFetcher.new }
  it 'should fetch photos' do
    subject.fetch_photos
    expect(subject.photos).not_to be_empty
  end
end
