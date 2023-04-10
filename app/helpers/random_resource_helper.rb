module RandomResourceHelper
  def random_poem
    RandomResource::POEM[I18n.locale].sample
  end
end
