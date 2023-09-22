require 'rails_helper'

describe 'DELETE/bookmarks' do
    let!(:bookmark) {Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby')}

    it 'should delete the record from bookmark' do
        delete "/bookmarks/#{bookmark.id}"
        expect(response.status).to eq(204)
        deleted_bookmark = Bookmark.find_by(id: bookmark.id)
        expect(deleted_bookmark).to be_nil
        expect(Bookmark.count).to eq(0)
    end
end