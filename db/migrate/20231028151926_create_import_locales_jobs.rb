class CreateImportLocalesJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :import_locales_jobs do |t|

      t.timestamps
    end
  end
end
