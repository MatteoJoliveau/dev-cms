module JobsHelper
  def job_title
    @job_title ||= "#{@job.position} #{I18n.t('label.at')} #{@job.company_name}"
  end
end
