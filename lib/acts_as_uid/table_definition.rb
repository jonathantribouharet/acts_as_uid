module ActiveRecord; module ConnectionAdapters; end; end
module ActiveRecord::ConnectionAdapters::ActsAsUidTableDefinition
	
	def uid
		column :uid, :string, :null => false
	end
	
end

ActiveRecord::ConnectionAdapters::TableDefinition.send(:include, ActiveRecord::ConnectionAdapters::ActsAsUidTableDefinition)
