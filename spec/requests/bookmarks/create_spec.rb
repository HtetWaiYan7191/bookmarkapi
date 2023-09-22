require 'rails_helper'

describe 'POST/bookmarks' do
    it 'valid bookmark attriutes' do
        post '/bookmarks', params:{ bookmark: {
            url: 'https://rubyyagi.com',
            title: 'RubyYagi blog'
        }}
        expect(response.status).to eq(201)
        json = JSON.parse(response.body).deep_symbolize_keys
        
        expect(json[:url]).to eq('https://rubyyagi.com')
        expect(json[:title]).to eq('RubyYagi blog')

        expect(Bookmark.count).to eq(1)
        expect(Bookmark.last.title).to eq('RubyYagi blog')
    end

    
    it 'invalid bookmark attributes' do
        post '/bookmarks', params: {
          bookmark: {
            url: '',
            title: 'RubyYagi blog'
          }
        }
    
        # response should have HTTP Status 201 Created
        expect(response.status).to eq(422)
    
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:url]).to eq(["can't be blank"])
    
        # no new bookmark record is created
        expect(Bookmark.count).to eq(0)
      end
end