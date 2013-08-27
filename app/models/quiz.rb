class Quiz < ActiveRecord::Base
  versioned :dependent => :tracking
#--------------------------------------------------------------------------------------------------------------------------------

  include CommonStuff
  include Publishable

#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

  #--- associations
  belongs_to :lecture
  belongs_to :course

  has_many   :questions
  
  has_many   :results
  has_many   :users, :through => :results
  
  #--- validations
  validates_presence_of   :code
  validates_uniqueness_of :code, :scope => :app_segment_id
  validates_presence_of   :lecture_id
  
  #--- scopes
  scope :ns_active,     :conditions => { :active => true }
  scope :ns_published,  :conditions => { :published => true }
  
  #--- callbacks
  before_save :before_save_tasks
  before_save :before_save_tasks_local
  
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

  def before_save_tasks_local
    self.title = self.lecture.title if self.title.blank?
    self.description = self.lecture.course.title if self.description.blank?
    self.course_id = self.lecture.course_id
  end

#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------
end
