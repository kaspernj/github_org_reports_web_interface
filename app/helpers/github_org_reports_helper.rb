module GithubOrgReportsHelper
  def self.db_conn
    mysql_conn = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env].symbolize_keys)
    db = Baza::Db.from_object(mysql_conn)
    db.q("SET sql_mode = ''")
    
    begin
      yield db
    ensure
      db.close
    end
  end
  
  def self.instance
    GithubOrgReportsHelper.db_conn do |db|
      gor = GithubOrgReports.new(:db => db)
      yield(:db => db, :gor => gor, :ob => gor.ob)
    end
  end
end