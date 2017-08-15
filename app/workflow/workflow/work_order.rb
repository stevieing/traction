# frozen_string_literal: true

module Workflow
  class WorkOrder
    include ActiveModel::Model
    include AASM

    validate :check_aliquot, if: :started?
    validate :check_library, if: :qc?

    attr_accessor :state, :work_order

    aasm whiny_transitions: false do
      state :started, initial: true
      state :qc
      state :library_preparation
      state :sequencing
      state :completed

      before_all_events :set_current_state
      after_all_events :set_state, :update_work_order

      event :started do
        transitions to: :started
      end

      event :qc do
        transitions from: :started, to: :qc, guard: :valid?
      end

      event :library_preparation do
        transitions from: :qc, to: :library_preparation, guard: :valid?
      end

      event :sequencing do
        transitions from: :library_preparation, to: :sequencing
      end

      event :completed do
        transitions from: :sequencing, to: :completed
      end
    end

    def initialize(attributes = {})
      super
      initialize_state
    end

    private

    def set_current_state
      aasm.current_state = state.to_sym
    end

    def set_state
      self.state = aasm.current_state
    end

    def initialize_state
      self.state ||= aasm.current_state
    end

    def update_work_order
      work_order.update_attributes(aasm_state: state)
    end

    def check_aliquot
      [:concentration, :fragment_size, :qc_state].each do |attribute|
        if work_order.aliquot.send(attribute).blank?
          errors.add(:aliquot, "#{attribute.to_s.humanize} can't be blank")
        end
      end
    end

    def check_library
      return if work_order.library.valid?
      work_order.library.errors.each do |key, value|
        errors.add(:library, "#{key} value")
      end
    end
  end
end
