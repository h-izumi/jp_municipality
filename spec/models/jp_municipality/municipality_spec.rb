require 'rails_helper'

RSpec.describe JpMunicipality::Municipality do
  describe '#city?' do
    subject { municipality.city? }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to be_truthy }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to be_falsy }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to be_falsy }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to be_falsy }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to be_truthy }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to be_falsy }
    end
  end

  describe '#ward?' do
    subject { municipality.ward? }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to be_falsy }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to be_truthy }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to be_falsy }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to be_falsy }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to be_falsy }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to be_truthy }
    end
  end

  describe '#special_ward?' do
    subject { municipality.special_ward? }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to be_falsy }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to be_truthy }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to be_falsy }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to be_falsy }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to be_falsy }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to be_falsy }
    end
  end

  describe '#town?' do
    subject { municipality.town? }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to be_falsy }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to be_falsy }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to be_truthy }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to be_falsy }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to be_falsy }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to be_falsy }
    end
  end

  describe '#village?' do
    subject { municipality.village? }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to be_falsy }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to be_falsy }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to be_falsy }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to be_truthy }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to be_falsy }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to be_falsy }
    end
  end

  describe '#code_without_prefecture_code' do
    subject { municipality.code_without_prefecture_code }

    let(:municipality) { FactoryBot.build(:fukuokashi) }

    it { is_expected.to eq '130' }
  end

  describe '#code_without_cd' do
    subject { municipality.code_without_cd }

    let(:municipality) { FactoryBot.build(:chiyodaku) }

    it { is_expected.to eq '13101' }
  end

  describe '#full_name' do
    subject { municipality.full_name }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to eq '鹿児島市' }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to eq '千代田区' }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to eq '大島郡喜界町' }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to eq '大島郡宇検村' }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to eq '福岡市' }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to eq '福岡市博多区' }
    end
  end

  describe '#full_name_e' do
    subject { municipality.full_name_e }

    context '市' do
      let(:municipality) { FactoryBot.build(:kagoshimashi) }

      it { is_expected.to eq 'KAGOSHIMA SHI' }
    end

    context '特別区' do
      let(:municipality) { FactoryBot.build(:chiyodaku) }

      it { is_expected.to eq 'CHIYODA KU' }
    end

    context '町' do
      let(:municipality) { FactoryBot.build(:kikaicho) }

      it { is_expected.to eq 'OSHIMA GUN KIKAI CHO' }
    end

    context '村' do
      let(:municipality) { FactoryBot.build(:ukenson) }

      it { is_expected.to eq 'OSHIMA GUN UKEN SON' }
    end

    context '政令指定都市' do
      let(:municipality) { FactoryBot.build(:fukuokashi) }

      it { is_expected.to eq 'FUKUOKA SHI' }
    end

    context '行政区' do
      let(:municipality) { FactoryBot.build(:fukuokashi_hakataku) }

      it { is_expected.to eq 'FUKUOKA SHI HAKATA KU' }
    end
  end
end
