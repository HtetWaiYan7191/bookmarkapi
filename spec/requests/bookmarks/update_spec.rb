require 'rails_helper'

describe 'PUT/bookmarks' do
    let!(:bookmark) {Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi')}

    it 'valid book attributes ' do
        put "/bookmarks/#{bookmark.id}", params:{
            bookmark:{
                url: 'https://fluffy.es',
                title: 'Fluffy'
            }
        }
        expect(response.status).to eq(200)

        json = JSON.parse(response.body).deep_symbolize_keys
        
        expect(json[:url]).to eq('https://fluffy.es')
        expect(json[:title]).to eq('Fluffy')

        expect(bookmark.reload.title).to eq('Fluffy')
        expect(bookmark.reload.url).to eq('https://fluffy.es')
    end
end