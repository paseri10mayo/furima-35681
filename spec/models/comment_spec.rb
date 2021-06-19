require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    before do
      @comment = FactoryBot.build(:comment)
    end

describe 'コメント機能' do
  context 'コメント機能がうまくいくとき' do
    it 'コメント機能に問題がない場合' do
      expect(@comment).to be_valid
    end
  end
end

context 'コメント機能がうまくいかないとき' do
  it 'c_textが空では出品できない' do
   @comment.c_text = nil
   @comment.valid?
   expect(@comment.errors.full_messages).to include("C text can't be blank")
 end

 it 'c_textが60文字以上では入力できない' do
  @comment.c_text = '1111111111111111111kdfhdlfkｌｋｄｆ11111111111111111111111111111111111111111'
  @comment.valid?
  expect(@comment.errors.full_messages).to include("C text is too long (maximum is 60 characters)")
 end
end
end
end
