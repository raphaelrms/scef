# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :noticium, :class => 'Noticia' do
    titulo "MyString"
    subtitulo "MyString"
    tags "MyString"
    corpo ""
  end
end
