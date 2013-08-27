class Document < ActiveRecord::Base
  versioned :dependent => :tracking
#--------------------------------------------------------------------------------------------------------------------------------

  include CommonStuff
  include Publishable

#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

  #--- associations
  has_many :document_attachments
  
  #--- validations
  validates_presence_of   :name
  validates_uniqueness_of :name

  #--- callbacks
  after_save :before_save_tasks
  
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

  def before_save_tasks
    self.title = self.name if self.title.blank?
  end

#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------
end