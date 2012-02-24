module ActiveRecord; module Acts; end; end
module ActiveRecord::Acts::ActsAsUid
  
  def self.included(klass)
		klass.class_eval do
			class_attribute :acts_as_uid_size
			class_attribute :acts_as_uid_charset
			self.acts_as_uid_size = 15
			self.acts_as_uid_charset = %w{ 0 1 2 3 4 5 6 7 8 9 }
			extend(ClassMethods)
		end
  end
	
  module ClassMethods
	
    def acts_as_uid(&block)	
			include ActiveRecord::Acts::ActsAsUid::InstanceMethods
			
			yield self if block_given?
			
			attr_protected :uid
						
			before_validation(:on => :create) do
				
				self.uid = (0...(self.acts_as_uid_size)).map{ self.acts_as_uid_charset.to_a[rand(self.acts_as_uid_charset.size)] }.join
				while self.class.where(:uid => self.uid).count > 0
					self.uid = (0...(self.acts_as_uid_size)).map{ self.acts_as_uid_charset.to_a[rand(self.acts_as_uid_charset.size)] }.join
				end
				
				true
			end

			def self.find_by_uid!(args)
				args = args.to_s.split('-')[0]
				super(args)
			end
			
			def self.find_by_uid(args)
				args = args.to_s.split('-')[0]
				super(args)
			end			
			
    end    

	end	

	module InstanceMethods
				
		def to_param
			self.uid
		end
				
	end

end

ActiveRecord::Base.send(:include, ActiveRecord::Acts::ActsAsUid)
