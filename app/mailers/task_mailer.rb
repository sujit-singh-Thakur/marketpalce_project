class TaskMailer < ApplicationMailer

   default from: 'noreply@example.com'

  def status_updated_email(application)
    @worker = application.worker
    @task = application.task
    @status = application.status
    mail(to: @worker.email, subject: "Your Application Has Been #{@status.capitalize}")
  end


  def worker_applied_email(application)
    @application = application
    @task = application.task
    @contractor = @task.contractor  

    mail(
      to: @contractor.email,
      subject: "New Application for Your Task: #{@task.description}"
    )
  end

end
