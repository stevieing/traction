# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Workflow::WorkOrder, type: :model, workflow: true do
  let!(:work_order) { create(:work_order_for_sequencing) }
  subject           { Workflow::WorkOrder.new(work_order: work_order) }

  it 'has initial state' do
    expect(subject).to be_started
    expect(subject.state).to eq(:started)
  end

  it 'can transition from started to qc' do
    subject.qc!
    expect(subject).to be_qc
    expect(subject.state).to eq(:qc)
  end

  it 'can transition from qc to library preparation' do
    subject.qc!
    subject.library_preparation!
    expect(subject).to be_library_preparation
    expect(subject.state).to eq(:library_preparation)
  end

  it 'can transition from library preparaton to sequencing' do
    subject.qc!
    subject.library_preparation!
    subject.sequencing!
    expect(subject).to be_sequencing
    expect(subject.state).to eq(:sequencing)
  end

  it 'can transition from sequencing to completed' do
    subject.qc!
    subject.library_preparation!
    subject.sequencing!
    subject.completed!
    expect(subject).to be_completed
    expect(subject.state).to eq(:completed)
  end

  context 'work order' do
    it 'updates state after each tranisition without a guard' do
      work_order = create(:work_order)
      workflow = Workflow::WorkOrder.new(work_order: work_order)
      workflow.started!
      expect(work_order.reload.aasm_state).to eq(Workflow::WorkOrder::STATE_STARTED.to_s)
    end

    it 'updates to qc if the work order aliquot is valid' do
      work_order = create(:work_order)
      work_order.assign_attributes(aliquot_attributes: attributes_for(:aliquot_proceed).except(:name))
      workflow = Workflow::WorkOrder.new(work_order: work_order)
      workflow.qc!
      expect(work_order.aasm_state).to eq(Workflow::WorkOrder::STATE_QC.to_s)

      work_order = create(:work_order)
      workflow = Workflow::WorkOrder.new(work_order: work_order)
      work_order.assign_attributes(aliquot_attributes: attributes_for(:aliquot_proceed).except(:name, :concentration))
      workflow.qc!
      expect(workflow).to_not be_valid
      expect(workflow.errors).to include('aliquot')
      expect(work_order.aasm_state).to be_nil
    end

    it 'updates to library preparation if the work order library is valid' do
      work_order = create(:work_order_with_qc_proceed)
      work_order.assign_attributes(library_attributes: attributes_for(:library))
      workflow = Workflow::WorkOrder.new(work_order: work_order)
      workflow.qc!
      workflow.library_preparation!
      expect(work_order.aasm_state).to eq(Workflow::WorkOrder::STATE_LIBRARY_PREPARATION.to_s)

      work_order = create(:work_order_with_qc_proceed)
      workflow = Workflow::WorkOrder.new(work_order: work_order)
      work_order.assign_attributes(library_attributes: attributes_for(:library).except(:volume))
      workflow.qc!
      workflow.library_preparation!
      expect(workflow).to_not be_valid
      expect(workflow.errors).to include('library')
      expect(work_order.aasm_state).to eq(Workflow::WorkOrder::STATE_QC.to_s)

    end
  end
end
