class Account

  def self.create(username, email, password)
    db = SQLite3::Database.open('db/accounts.sqlite')
    hash = BCrypt::Password.create(password)
    usernames = db.execute('SELECT username FROM accounts')

    usernames.each do |name|
      if name.first == username
        return '/createAccount/usrTaken'
      end
    end
    db.execute('INSERT INTO accounts (username,email,password) VALUES (?,?,?)', [username,email,hash])
    return '/home'
  end

  def self.authenticate(username, password)
    db = SQLite3::Database.open('db/accounts.sqlite')
    hash = db.execute('SELECT password FROM accounts WHERE username IS ? OR email IS ?', [username,username])
    decrypted = BCrypt::Password.new(hash.first.first)

    if decrypted == password
      return '/home'
    else
      return '/login'
    end
  end

end
