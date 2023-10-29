class ImportLocalesJob < ApplicationRecord
  after_create :enqueue

  def enqueue
    ImportLocalesWorker.perform_async(id)
  end
end
