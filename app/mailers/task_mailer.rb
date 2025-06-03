class TaskMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def worker_applied_email(application)
    @application = application
    @task = application.task
    @contractor = @task.contractor  # assuming a task belongs_to a contractor

    mail(
      to: @contractor.email,
      subject: "New Application for Your Task: #{@task.description}"
    )
  end

  def worker_selected_email(worker, task)
    @worker = worker
    @task = task

    mail(
      to: @worker.email,
      subject: "You've Been Selected for Task: #{@task.title}"
    )
    
  end
end
