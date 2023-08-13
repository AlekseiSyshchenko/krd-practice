module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp.strip
      break if verb == 'q'

      unless %w[GET POST PUT DELETE].include?(verb)
        puts 'Unknown verb. Use (GET/POST/PUT/DELETE) / q to exit'
        next
      end

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'

        unless %w[index show].include?(action)
          puts 'Unknown action. Use (index/show) / q to exit'
          next
        end
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    if @posts.empty?
      puts 'There are no posts here yet'
    else
      @posts.each_with_index do |value, index|
        puts "#{index} #{value}"
      end
    end
  end

  def show
    print 'Choose the number of post: '
    number = gets.to_i
    if @posts[number].nil?
      puts "There is no post with number #{number}"
    else
      puts @posts[number]
    end
  end

  def create
    puts 'Enter post'
    text = gets.chomp
    @posts << text
    puts "#{@posts.length - 1} #{@posts.last}"
  end

  def update
    print 'Choose the number of post: '
    number = gets.to_i
    if @posts[number].nil?
      puts "There is no post with number #{number}"
    else
      puts 'Enter post'
      @posts[number] = gets.chomp
      puts "#{number} #{@posts[number]}"
    end
  end

  def destroy
    print 'Choose the number of post: '
    number = gets.to_i
    if @posts[number].nil?
      puts "There is no post with number #{number}"
    else
      @posts.delete_at(number)
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
