require 'rack'
require './cashmachine'
class App
  def call(env)
    req = Rack::Request.new(env)

    param = req.query_string.split('=').last.to_i
    router(req.path, param)
  end

  def router(path, param)
    case path
    when '/'
      [200, { 'Content-Type' => 'text/html' }, File.readlines('./index.html')]
    when '/deposit'
      cash_controller(path, param)
      [200, { 'Content-Type' => 'text/html' }, ['ok']]
    when '/balance'
      result = cash_controller(path, param)
      [200, { 'Content-Type' => 'text/html' }, [result]]
    when '/help'
      [200, { 'Content-Type' => 'text/html' }, File.readlines('./index.html')]
    when '/withdraw'
      cash_controller(path, param)
      [200, { 'Content-Type' => 'text/html' }, ['ok']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['404']]
    end
  end

  def cash_controller(path, param)
    cashmachine = CashMachine.new

    case path
    when '/deposit'
      cashmachine.deposit(param)
    when '/balance'
      cashmachine.balance
    when '/withdraw'
      cashmachine.withdraw(param)
    end
  end
end
