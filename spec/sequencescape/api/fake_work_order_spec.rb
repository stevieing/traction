# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sequencescape::Api::FakeWorkOrder, type: :model do
  # it 'should not reach Sequencescape if FakeWorkOrderWork id used' do
  #   expect(Sequencescape::Api::FakeWorkOrder.for_reception).to eq []
  #   expect(Sequencescape::Api::FakeWorkOrder.find_by_ids(%w[1 2])).to eq []
  #   expect(Sequencescape::Api::FakeWorkOrder.update_state('test')).to eq true
  # end

  it 'creates a number of fake work orders' do
    work_orders = Sequencescape::Api::FakeWorkOrder.for_reception
    expect(work_orders.length).to eq(Sequencescape::Api::FakeWorkOrder::WORK_ORDER_COUNT)
  end

  it 'finds fake work orders by id' do
    work_orders = Sequencescape::Api::FakeWorkOrder.find_by_ids([1000, 10001, 10002])
    expect(work_orders.length).to eq(3)
    expect(work_orders.first.id).to eq(1000)
  end

  describe "SequencescapeWorkOrder" do

    it 'has a model name' do
      expect(Sequencescape::Api::FakeWorkOrder::SequencescapeWorkOrder.model_name).to eq('WorkOrder')
    end

    it 'is never persisted' do
      expect(Sequencescape::Api::FakeWorkOrder::SequencescapeWorkOrder.new).to_not be_persisted
    end

    describe '#new' do
      let(:work_order)  { Sequencescape::Api::FakeWorkOrder::SequencescapeWorkOrder.new(
                            id: 1
                        )}

      it 'has an id' do
        expect(work_order.id).to eq(1)
      end

      it 'has a name' do
        expect(work_order.name).to eq('DN1A:A1')
      end

      it 'has state' do
        expect(work_order.state).to eq('pending')
      end

      it 'has a data type' do
        expect(work_order.data_type).to eq('basecalls')
      end

      it 'has a number of flowcells' do
        expect(work_order.number_of_flowcells).to eq(3)
      end

      it 'has a sample uuid' do
        expect(work_order.sample_uuid).to be_present
      end

       it 'has a study uuid' do
        expect(work_order.study_uuid).to be_present
      end
    end
  end
end
