class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    Delayed::Job.enqueue CommentNotifierJob.new(comment.id)
  end
end
