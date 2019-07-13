require 'pry'
require 'tty-prompt'
$player = ''
$computer = ''

def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
        system('cls')
    else
        system('clear')
    end
end

def welcome_screen
    clear_screen()
    puts "Welcome to Tic-Tac-Toe where you need to get 3 in a row!"
    puts
    game_initialize()
end

def game_initialize
    prompt = TTY::Prompt.new
    puts "Would you like to be X or O ? "
    choices = ['X', 'O', 'Quit']
    $player = prompt.select("Choose which symbol you want to be:", choices)
    if $player == 'Quit'
        clear_screen()
        exit
    end
    $computer = $player == 'X' ? 'O' : 'X'
    start_game()
end

def start_game
    clear_screen()
    board = []
    for row in 0...3
        board << []
        for column in 0...3
            board[row] << ' '
        end
    end
    # if rand(2) == 0
    #     computer_turn(board)
    # else
    #     player_turn(board)
    # end
    draw_board(board)
end

def draw_board(board)
    puts
    puts '     +-+-+-+'
    board.each do |row|
        print '     |'
        row.each do |column|
            print "#{column}|"
        end
        puts
        puts '     +-+-+-+'
    end
    puts
end


welcome_screen()