class ImportLocalesJob < ApplicationRecord
  STATUSES = Hash(
    failed: -1,
    created: 0,
    enqueued: 1,
    finished: 2
  )

  enum status: STATUSES

  after_create :enqueue

  def enqueue
    ActiveRecord::Base.transaction do
      update!(status: :enqueued)

      ImportLocalesWorker.perform_async(id)
    end
  end
end
