module RandomResourceHelper
  def random_poem
    RandomResource::POEM.sample
  end
end
