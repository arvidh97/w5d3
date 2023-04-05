require 'sqlite3'
require 'singleton'
require_relative 'quest_data'

class Questions
        attr_accessor :id, :title, :body, :author
    
        def self.find_by_id(id)
            questions = QuestionsDatabase.instance.execute(<<-SQL, id)
                SELECT
                    *
                FROM
                    questions
                WHERE
                    id = ?
            SQL
            Questions.new(questions.first)
       end
    
        def self.find_by_author(author)
            questions = QuestionsDatabase.instance.execute(<<-SQL, author)
                SELECT
                    *
                FROM
                    questions
                WHERE
                    author = ?
            SQL
            Questions.new(questions.first)
           end
        
        def initialize(options)
            @id = options['id']
            @title = options['title']
            @body = options['body']
            @author = options['author']
        end
    end