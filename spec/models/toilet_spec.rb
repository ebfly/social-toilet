require 'rails_helper'

describe Toilet do
  before do
    @toilet = FactoryBot.build(:toilet)
  end

  describe "投稿" do
    context "投稿がうまくいくとき" do
      it "全ての項目が存在すれば登録できる" do
        expect(@toilet).to be_valid
        expect(@toilet.image).to be_valid
      end

      it "nameが40文字で登録できる" do
        @toilet.name = "a" * 40
        expect(@toilet).to be_valid
      end

      it "textが1000文字で登録できる" do
        @toilet.text = "a" * 1000
        expect(@toilet).to be_valid
      end
    end
    context "投稿ができないとき" do
      it "nameがない場合は登録できないこと" do
        @toilet.name = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("タイトル名を入力してください")
      end

      it "textがない場合は登録できないこと" do
        @toilet.text = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("トイレの詳細説明を入力してください")
      end

      it "category_idがない場合は登録できないこと" do
        @toilet.category_id = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it "category_idが1の場合は登録できないこと" do
        @toilet.category_id = 1
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("カテゴリーを選択してください")
      end


      it "condition_idがない場合は登録できないこと" do
        @toilet.condition_id = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("トイレの状態を選択してください")
      end

      it "condition_idが1の場合は登録できないこと" do
        @toilet.condition_id = 1
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("トイレの状態を選択してください")
      end

      it "prefecture_idがない場合は登録できないこと" do
        @toilet.prefecture_id = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("都道府県を選択してください")
      end

      it "prefecture_idが1の場合は登録できないこと" do
        @toilet.prefecture_id = 1
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("都道府県を選択してください")
      end

      it "number_idがない場合は登録できないこと" do
        @toilet.number_id = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("個室の数を選択してください")
      end

      it "category_idが1の場合は登録できないこと" do
        @toilet.number_id = 1
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("個室の数を選択してください")
      end

      it "multi_idがない場合は登録できないこと" do
        @toilet.multi_id = ""
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("設備内容を選択してください")
      end

      it "multi_idが1の場合は登録できないこと" do
        @toilet.multi_id = 1
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("設備内容を選択してください")
      end

      it "nameが41文字だと登録できないこと" do
        @toilet.name = "a" * 41
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("タイトル名は40文字以内で入力してください")
      end

      it "textが1001文字だと登録できない" do
        @toilet.text = "a" * 1001
        @toilet.valid?
        expect(@toilet.errors.full_messages).to include("トイレの詳細説明は1000文字以内で入力してください")
      end
    end
  end
end