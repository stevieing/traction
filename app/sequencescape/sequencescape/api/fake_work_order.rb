# frozen_string_literal: true

module Sequencescape
  module Api
    # this class is used if sequencescape connection is disabled
    # see config/initializers/sequencescape_api.rb and config/sequencescape.yml
    class FakeWorkOrder

      WORK_ORDER_COUNT = 10

      def self.for_reception
        [].tap do |work_orders|
          (1..10).each do |i|
            work_orders << SequencescapeWorkOrder.new(id: 1000+i)
          end
        end
      end

      def self.find_by_ids(ids)
        ids.collect do |id|
          SequencescapeWorkOrder.new(id: id)
        end
      end

      def self.update_state(_work_order)
        true
      end

      class SequencescapeWorkOrder
        include ActiveModel::Model

        attr_accessor :id

        def self.model_name
          ActiveModel::Name.new(self, nil, 'WorkOrder')
        end

        def persisted?
          false
        end

        def study_uuid
          SecureRandom.uuid
        end

        def sample_uuid
          SecureRandom.uuid
        end

        def library_preparation_type
          'rapid'
        end

        def state
          'pending'
        end

        def data_type
          'basecalls'
        end

        def number_of_flowcells
          3
        end

        def name
          "DN#{id}A:A1"
        end
      end

    end

  end
end
