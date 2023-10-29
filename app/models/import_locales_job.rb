class ImportLocalesJob < ApplicationRecord
  after_create :enqueue

  def enqueue
    ImportLocalesWorker.perform_async
  end
end
