class Page < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  name_regexp = /\A[a-z\d\-_]+\z/
  validates :name, presence: true,
                   length: { :minimum => 2, :maximum => 16 }                  format: { :with => name_regexp },
                   uniqueness: true


  def html
    BlueCloth.new(self.content).to_html
  end

end
