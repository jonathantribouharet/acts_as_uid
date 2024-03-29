ActsAsUID
======================

A plugin for generate UID for ActiveRecord model. Usefull for generate token or hide number of elements in your database.

Installation
------------

Include the gem in your Gemfile:

    gem 'acts_as_uid', :git => 'https://github.com/jonathantribouharet/acts_as_uid'


Usage
-----

In your migrations:
	
	class CreateUsers < ActiveRecord::Migration
		def self.up
			create_table :users do |t|
				t.uid
			end
			add_index :users, :uid, :uniq => true
		end
	end
	

Minimal configuration in your model:
	
	class User < ActiveRecord::Base
		acts_as_uid
	end

Custom configuration in your model:
	
	class User < ActiveRecord::Base
		acts_as_uid do |config|
			config.acts_as_uid_size = 20
			config.acts_as_uid_charset = %w{ 0 1 2 3 4 5 6 7 8 9 A B C D E F}
		end
	end

* `acts_as_uid_size` is the size of UID field, by default it's `15`.
* `acts_as_uid_charset` is the charset of UID field, by default it's `%w{ 0 1 2 3 4 5 6 7 8 9 }`.

Use dynamic method `User.find_by_uid!("012345")` for find a record and raise `ActiveRecord::RecordNotFound` if the record is not found or `User.find_by_uid("012345")` for return nil if the record is not found.

If you want replace the default find method in a model:

	class User < ActiveRecord::Base
		acts_as_uid
		
		def self.find(*args)
			self.find_by_uid!(*args)
		end
	end	
