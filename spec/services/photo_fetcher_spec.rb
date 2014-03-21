require 'spec_helper'

describe PhotoFetcher do
  VCR.use_cassette('initialize PhotoFetcher') do
    subject { PhotoFetcher.new }
  end

  it 'should know the user id for the username passed in' do
    VCR.use_cassette('find user') do
      subject.fetch_user_id('bonobos')
      expect(subject.user_id).to eq '8194723'
    end
  end

  it 'should fetch photos' do
    subject.user_id = '8194723'

    VCR.use_cassette('fetch photos') do
      subject.fetch_photos
    end

    expect(subject.photos).not_to be_empty
  end

  it 'should save photos fetched' do
    subject.user_id = '8194723'

    VCR.use_cassette('fetch photos') do
      subject.fetch_photos
    end
    photo_count = subject.photos.count
    subject.save_photos

    expect(Photo.count).to eq photo_count
    expect(subject.photos).to be_empty
  end
end
