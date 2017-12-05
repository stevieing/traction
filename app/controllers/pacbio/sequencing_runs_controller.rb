module Pacbio
  class SequencingRunsController < ApplicationController

    # layout false

    def index
      render layout: 'pacbio'
    end
  end
end