require 'sqlite3'
require 'singleton'
require_relative 'quest_data'

class Replies
    attr_accessor :id, :question_id, :parent_id, :user_id, :body

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        Replies.new(replies.first)
    end

    def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
    SQL
    Replies.new(replies.first)
    end


    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
        @body = options['body']
    end
end
