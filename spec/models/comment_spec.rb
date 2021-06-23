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
   expect(@comment.errors.full_messages).to include("コメントを入力してください")
 end

 it 'c_textが60文字以上では入力できない' do
  @comment.c_text = '1111111111111111111kdfhdlfkｌｋｄｆ11111111111111111111111111111111111111111'
  @comment.valid?
  expect(@comment.errors.full_messages).to include("コメントは60文字以内で入力してください")
 end
end
end
end
