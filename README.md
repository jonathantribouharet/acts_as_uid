ActsAsUID
======================

A plugin for generates unique UID for ActiveRecord model.

Installation
------------

Include the gem in your Gemfile:

    gem 'acts_as_uid', :git => 'https://github.com/eviljojo22/acts_as_uid'


Usage
-----

In your migrations:
	
	class CreateUsers < ActiveRecord::Migration
		def self.up
			create_table :users do |t|
				t.string :uid, :null => false
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
