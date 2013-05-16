class UpdateWorker
  @queue = :updates
  
  def self.perform
    puts "Worker starting: UpdateWorker"
    
    begin
      require "baza"
      require "github_org_reports"
      
      GithubOrgReportsHelper.db_conn do |db|
        gor = GithubOrgReports.new(:db => db)
        
        Repository.find_each do |repo|
          gor_repo = GithubOrgReports::Repo.new(:user => repo.user, :name => repo.name, :login => repo.login, :password => repo.password)
          gor.add_repo(gor_repo)
        end
        
        gor.scan
      end
      
      puts "Worker success: UpdateWorker"
    rescue => e
      puts "Worker error: UpdateWorker"
      
      puts e.inspect
      puts e.backtrace
      
      raise e
    end
  end
end