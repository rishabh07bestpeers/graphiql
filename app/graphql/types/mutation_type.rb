# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_blog, [Types::BlogType], null: false, description: "create blog" do
      argument :title, String, required: true
      argument :description, String, required: true
      argument :user_id, Integer, required: true
    end

    def create_blog(**args)
      blog = Blog.new(args)
      if blog.save
        [blog]
      else
        raise GraphiQL::ExecutionError.new("Blog not created")
      end
    end
  end
end
