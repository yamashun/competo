RSpec.describe Competo do
  it "has a version number" do
    expect(Competo::VERSION).not_to be nil
  end

  describe '#==' do
    subject do
      Competo::Version.new(org_ver) == other_ver
    end

    describe 'trueとなるパターン' do
      context '3 == 3' do
        let(:org_ver) { '3' }
        let(:other_ver) { '3' }
        it { is_expected.to be true }
      end

      context '3 == 3.0' do
        let(:org_ver) { '3' }
        let(:other_ver) { '3.0' }
        it { is_expected.to be true }
      end

      context '3.1 == 3.1' do
        let(:org_ver) { '3.1' }
        let(:other_ver) { '3.1' }
        it { is_expected.to be true }
      end

      context '3.1 == 3.1.0' do
        let(:org_ver) { '3.1' }
        let(:other_ver) { '3.1.0' }
        it { is_expected.to be true }
      end

      context '1.2.3 == 1.2.3' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.3' }
        it { is_expected.to be true }
      end

      context '1.2.0 == 1.2' do
        let(:org_ver) { '1.2.0' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be true }
      end

      context '1.12.0 == 1.12' do
        let(:org_ver) { '1.12.0' }
        let(:other_ver) { '1.12' }
        it { is_expected.to be true }
      end
    end

    describe 'falseとなるパターン' do
      context '1 == 2' do
        let(:org_ver) { '1' }
        let(:other_ver) { '2' }
        it { is_expected.to be false }
      end

      context '1.1 == 1.2' do
        let(:org_ver) { '1.1' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be false }
      end

      context '1.1.1 == 2.1.1' do
        let(:org_ver) { '1.1.1' }
        let(:other_ver) { '2.1.1' }
        it { is_expected.to be false }
      end

      context '1.2.1 == 1.2' do
        let(:org_ver) { '1.2.1' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be false }
      end

      context '3.1.0 == 3.10' do
        let(:org_ver) { '3.1.0' }
        let(:other_ver) { '3.10' }
        it { is_expected.to be false }
      end
    end
  end

  describe '#>' do
    subject do
      Competo::Version.new(org_ver) > other_ver
    end

    describe 'trueとなるパターン' do
      context '1.2.0 > 1.1' do
        let(:org_ver) { '1.2' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be true }
      end

      context '1.2.0 > 1.1' do
        let(:org_ver) { '1.2.0' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be true }
      end

      context '1.2.3 > 1.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.1' }
        it { is_expected.to be true }
      end

      context '1.12.0 > 1.10' do
        let(:org_ver) { '1.12.0' }
        let(:other_ver) { '1.10' }
        it { is_expected.to be true }
      end
    end

    describe 'falseとなるパターン' do
      context '1 > 2' do
        let(:org_ver) { '1' }
        let(:other_ver) { '2' }
        it { is_expected.to be false }
      end

      context '1.1 > 1.2' do
        let(:org_ver) { '1.1' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be false }
      end

      context '1.2.3 > 1.2.4' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.4' }
        it { is_expected.to be false }
      end

      context '1.2.3 > 11.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '11.2.1' }
        it { is_expected.to be false }
      end

      context '1.2.3 > 1.2.3' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.3' }
        it { is_expected.to be false }
      end
    end

  end

  describe '#>=' do
    subject do
      Competo::Version.new(org_ver) >= other_ver
    end

    describe 'trueとなるパターン' do
      context '1.2.0 >= 1.1' do
        let(:org_ver) { '1.2' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be true }
      end

      context '1.2.0 >= 1.1' do
        let(:org_ver) { '1.2.0' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be true }
      end

      context '1.2.3 >= 1.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.1' }
        it { is_expected.to be true }
      end

      context '1.12.0 >= 1.10' do
        let(:org_ver) { '1.12.0' }
        let(:other_ver) { '1.10' }
        it { is_expected.to be true }
      end

      context '1.2.3 >= 1.2.3' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.3' }
        it { is_expected.to be true }
      end
    end

    describe 'falseとなるパターン' do
      context '1 > 2' do
        let(:org_ver) { '1' }
        let(:other_ver) { '2' }
        it { is_expected.to be false }
      end

      context '1.1 > 1.2' do
        let(:org_ver) { '1.1' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be false }
      end

      context '1.2.3 > 1.2.4' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.4' }
        it { is_expected.to be false }
      end

      context '1.2.3 > 11.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '11.2.1' }
        it { is_expected.to be false }
      end
    end

  end


  describe '#<' do
    subject do
      Competo::Version.new(org_ver) < other_ver
    end

    describe 'trueとなるパターン' do
      context '1 < 2' do
        let(:org_ver) { '1' }
        let(:other_ver) { '2' }
        it { is_expected.to be true }
      end

      context '1.1 < 1.2' do
        let(:org_ver) { '1.1' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be true }
      end

      context '1.2.3 < 1.2.4' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.4' }
        it { is_expected.to be true }
      end

      context '1.2.3 < 11.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '11.2.1' }
        it { is_expected.to be true }
      end
    end

    describe 'falseとなるパターン' do
      context '1.2.0 < 1.1' do
        let(:org_ver) { '1.2' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be false }
      end

      context '1.2.0 < 1.1' do
        let(:org_ver) { '1.2.0' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be false }
      end

      context '1.2.3 < 1.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.1' }
        it { is_expected.to be false }
      end

      context '1.12.0 < 1.10' do
        let(:org_ver) { '1.12.0' }
        let(:other_ver) { '1.10' }
        it { is_expected.to be false }
      end

      context '1.2.3 < 1.2.3' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.3' }
        it { is_expected.to be false }
      end
    end
  end

  describe '#<=' do
    subject do
      Competo::Version.new(org_ver) <= other_ver
    end

    describe 'true' do
      context '1 <= 2' do
        let(:org_ver) { '1' }
        let(:other_ver) { '2' }
        it { is_expected.to be true }
      end

      context '1.1 <= 1.2' do
        let(:org_ver) { '1.1' }
        let(:other_ver) { '1.2' }
        it { is_expected.to be true }
      end

      context '1.2.3 <= 1.2.4' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.4' }
        it { is_expected.to be true }
      end

      context '1.2.3 <= 11.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '11.2.1' }
        it { is_expected.to be true }
      end

      context '1.2.3 <= 1.2.3' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.3' }
        it { is_expected.to be true }
      end
    end

    describe 'falseとなるパターン' do
      context '1.2.0 <= 1.1' do
        let(:org_ver) { '1.2' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be false }
      end

      context '1.2.0 <= 1.1' do
        let(:org_ver) { '1.2.0' }
        let(:other_ver) { '1.1' }
        it { is_expected.to be false }
      end

      context '1.2.3 <= 1.2.1' do
        let(:org_ver) { '1.2.3' }
        let(:other_ver) { '1.2.1' }
        it { is_expected.to be false }
      end

      context '1.12.0 <= 1.10' do
        let(:org_ver) { '1.12.0' }
        let(:other_ver) { '1.10' }
        it { is_expected.to be false }
      end
    end
  end

  describe '比較対象もAppVersionのオブジェクト' do
    describe 'trueとなる' do
      it '== がtrueとなる' do
        origin = Competo::Version.new('2.1.3')
        other = Competo::Version.new('2.1.3')
        reuslt = origin == other
        expect(reuslt).to be true
      end

      it '> がtrueとなる' do
        reuslt = Competo::Version.new('2.2.3') > Competo::Version.new('2.1.3')
        expect(reuslt).to be true
      end

      it '>= がtrueとなる' do
        reuslt = Competo::Version.new('2.1.4') >= Competo::Version.new('2.1.3')
        expect(reuslt).to be true
      end

      it '< がtrueとなる' do
        reuslt = Competo::Version.new('2.1.3') < Competo::Version.new('2.2.3')
        expect(reuslt).to be true
      end

      it '<= がtrueとなる' do
        reuslt = Competo::Version.new('3.1.3') <= Competo::Version.new('5.1.3')
        expect(reuslt).to be true
      end
    end

    describe 'falseとなる' do
      it '== がfalseとなる' do
        reuslt = Competo::Version.new('2.1.4') == Competo::Version.new('2.1.3')
        expect(reuslt).to be false
      end

      it '> がfalseとなる' do
        reuslt = Competo::Version.new('2.1.3') > Competo::Version.new('2.2.3')
        expect(reuslt).to be false
      end

      it '>= がfalseとなる' do
        reuslt = Competo::Version.new('2.1.4') >= Competo::Version.new('2.1.5')
        expect(reuslt).to be false
      end

      it '< がfalseとなる' do
        reuslt = Competo::Version.new('2.1.3') < Competo::Version.new('2.0.3')
        expect(reuslt).to be false
      end

      it '<= がfalseとなる' do
        reuslt = Competo::Version.new('3.1.3') <= Competo::Version.new('2.1.3')
        expect(reuslt).to be false
      end
    end
  end

  describe 'alias method' do
    describe '#equal?' do
      it 'trueとなる' do
        reuslt = Competo::Version.new('3.1.3').equal?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be true
      end

      it 'falseとなる' do
        reuslt = Competo::Version.new('3.1.4').equal?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be false
      end
    end

    describe '#greater_or_equal?' do
      it 'trueとなる' do
        reuslt = Competo::Version.new('3.1.3').greater_or_equal?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be true
      end

      it 'falseとなる' do
        reuslt = Competo::Version.new('3.1.2').greater_or_equal?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be false
      end
    end

    describe '#greater?' do
      it 'trueとなる' do
        reuslt = Competo::Version.new('3.1.4').greater?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be true
      end

      it 'falseとなる' do
        reuslt = Competo::Version.new('3.1.3').greater?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be false
      end
    end

    describe '#less_or_equal?' do
      it 'trueとなる' do
        reuslt = Competo::Version.new('3.1.4').less_or_equal?(Competo::Version.new('3.2.3'))
        expect(reuslt).to be true
      end

      it 'falseとなる' do
        reuslt = Competo::Version.new('3.10.3').less_or_equal?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be false
      end
    end

    describe '#less?' do
      it 'trueとなる' do
        reuslt = Competo::Version.new('3.1.4').less?(Competo::Version.new('3.2.3'))
        expect(reuslt).to be true
      end

      it 'falseとなる' do
        reuslt = Competo::Version.new('3.10.3').less?(Competo::Version.new('3.1.3'))
        expect(reuslt).to be false
      end
    end
  end
end
