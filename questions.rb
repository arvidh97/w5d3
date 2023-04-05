require 'sqlite3'
require 'singleton'

    class QuestionsDatabase < SQLite3::Database
        include Singleton

        def initialize
            super('questions.db')
            self.type_translation = true
            self.results_as_hash = true
        end
    end

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

    #    def self.find_by_name(fname, lname)
    #     users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    #     SELECT
    #         *
    #     FROM
    #         users
    #     WHERE
    #         fname = ? and lname = ?
    # SQL
    # Users.new(users.first)
    #    end

       def initialize(options)
            @id = options['id']
            @fname = options['fname']
            @lname = options['lname']
       end
    end

# class Questions
#     attr_accessor :id, :title, :body, :author

#     def self.find_by_id(id)
#         questions = QuestionsDatabase.instance.execute(<-- SQL, id)
#             SELECT
#                 *
#             FROM
#                 questions
#             WHERE
#                 id = ?
#         SQL
#         Questions.new(questions.first)
#    end

#     def self.find_by_author(author)
#         questions = QuestionsDatabase.instance.execute(<-- SQL, author)
#         SELECT
#             *
#         FROM
#             questions
#         WHERE
#             author = ?
#     SQL
#     Questions.new(questions.first)
#        end
# end

# class QuestionsFollows
#     attr_accessor :id, :user_id, :questions_id

#     def self.find_by_id(id)
#         questions_follows = QuestionsDatabase.instance.execute(<-- SQL, id)
#             SELECT
#                 *
#             FROM
#                 questions_follows
#             WHERE
#                 id = ?
#         SQL
#         QuestionsFollows.new(questions_follows.first)
#    end
# end

# class Replies
#     attr_accessor :id, :question_id, :parent_id, :user_id, :body

#     def self.find_by_user_id(user_id)
#         user_idd = QuestionsDatabase.instance.execute(<-- SQL, user_idd)
#         SELECT
#             *
#         FROM
#             replies
#         WHERE
#             user_idd = ?
#     SQL
#     Replies.new(user_idd.first)
#     end

#     def self.find_by_question_id(question_id)
#         question_idd = QuestionsDatabase.instance.execute(<-- SQL, question_idd)
#         SELECT
#             *
#         FROM
#             replies
#         WHERE
#             question_idd = ?
#     SQL
#     Replies.new(question_idd.first)
#     end
# end
