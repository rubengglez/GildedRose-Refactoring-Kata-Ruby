require_relative '../gilded_rose'
require_relative '../factory_item'

describe GildedRose do

  describe "#update_quality" do
    let(:item) { Item.new("foo", 0, 0) }
    let(:items) { [item] }

    subject do
      described_class.new(items).update_quality
    end

    before do
      subject
    end

    it "does not change the name" do
      expect(item.name).to eq 'foo'
    end

    it 'quality never is negative' do
      expect(item.quality).to eq 0
    end

    context 'when the sell by date has passed, quality degrades twice' do
      let(:item) { Item.new('foo', -1, 4) }
      it do
        expect(item.quality).to eq(2)
      end
    end

    context 'when the sell by date has passed more than one day, quality degrades twice' do
      let(:item) { Item.new('foo', -10, 9) }
      it do
        expect(item.quality).to eq(7)
      end
    end

    context 'when the sell by date has passed and quality is one, quality has to be zero' do
      let(:item) { Item.new("foo", 0, 0) }
      it do
        expect(item.quality).to eq(0)
      end
    end

    context 'Aged Brie increases in Quality the older it gets' do
      let(:item) { Item.new(FactoryItem::AGED_BRIE, 1, 2) }
      it '', :focus do
        expect(item.quality).to eq(3)
      end
    end

    context 'Aged Brie increases twice in Quality when the sell by date has passed' do
      let(:item) { Item.new(FactoryItem::AGED_BRIE, 0, 3) }
      it do
        expect(item.quality).to eq(5)
      end
    end

    context "Aged Brie higher quality is 50" do
      let(:item) { Item.new(FactoryItem::AGED_BRIE, -1, 49) }
      it do
        expect(item.quality).to eq(50)
      end
    end

    context 'Sufuras never has to be sold or decreases in Quality' do
      let(:item) { Item.new(FactoryItem::SULFURAS, 5, 50) }
      it do
        expect(item.quality).to eq(50)
        expect(item.sell_in).to eq(5)
      end
    end

    context "Sufuras never has to be sold or decreases in Quality" do
      let(:item) { Item.new(FactoryItem::SULFURAS, 0, 50) }
      it do
        expect(item.quality).to eq(50)
        expect(item.sell_in).to eq(0)
      end
    end

    context 'Backstage increases in Quality by 1 when there are more than 10 days for the concert' do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 11, 2) }
      it do
        expect(item.quality).to eq(3)
      end
    end

    context 'Backstage increases in Quality by 2 when there are between 10 and 6 days for the concert' do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 6, 2) }
      it do
        expect(item.quality).to eq(4)
      end
    end

    context 'Backstage increases in Quality by 2 when there are between 10 and 6 days for the concert' do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 10, 2) }
      it do
        expect(item.quality).to eq(4)
      end
    end

    context "Backstage increases in Quality by 3 when there are between 5 and 1 days for the concert" do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 5, 2) }
      it do
        expect(item.quality).to eq(5)
      end
    end

    context "Backstage increases in Quality by 3 when there are between 5 and 1 days for the concert" do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 1, 2) }
      it do
        expect(item.quality).to eq(5)
      end
    end

    context 'Backstage quality is 0 when the day comes' do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 0, 20) }
      it do
        expect(item.quality).to eq(0)
      end
    end

    context "Backstage higher quality is 50" do
      let(:item) { Item.new(FactoryItem::BACKSTAGE, 1, 49) }
      it do
        expect(item.quality).to eq(50)
      end
    end

    context "Conjured decrease its quality by 2" do
    let(:item) { Item.new(FactoryItem::CONJURED, 4, 49) }
      it do
        expect(item.quality).to eq(47)
      end
    end

    context "Conjured lower quality is 0" do
    let(:item) { Item.new(FactoryItem::CONJURED, 4, 1) }
      it do
        expect(item.quality).to eq(0)
      end
    end
  end
end
