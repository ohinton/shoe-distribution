class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  before_save(:titlecase_name)

private

  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
