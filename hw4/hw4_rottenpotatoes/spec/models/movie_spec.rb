require 'spec_helper'

describe Movie do
  describe 'searching similar directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:similar_directors).with('Star Wars')
      Movie.similar_directors('Star Wars')
    end
  end
end