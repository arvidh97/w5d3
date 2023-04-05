require 'sqlite3'
require 'singleton'
require_relative 'quest_data'

class Users
    attr_accessor :id, :fname, :lname

   def self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        Users.new(users.last)
   end

   def self.find_by_name(fname, lname)
        raise "#{self} not in database" unless self.fname || self.lname
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? and lname = ?
            SQL
    Users.new(users.first)
   end

   def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
   end
end