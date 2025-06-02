class ApplicationMailer < ActionMailer::Base
  default from: "singhsujit5112002@gmail.com"
  layout "mailer"
   def worker_applied_email(application)
    @application = application
    @task = application.task
    @contractor = @task.contractor
    @worker = application.worker

    mail(
      to: @contractor.email,
      subject: "New Application Received for Task: #{@task.description}"
    )
  end
end
