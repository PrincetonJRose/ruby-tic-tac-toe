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
    if rand(2) == 0
        computer_turn(board)
    else
        player_turn(board)
    end
end

def draw_board(board)
    puts "\n     +-+-+-+"
    board.each do |row|
        print "     |"
        row.each do |column|
            print "#{column}|"
        end
        puts "\n     +-+-+-+"
    end
end

def player_turn(board)
    clear_screen()
    puts "It's your turn!"
    draw_board(board)
    moves_available = check_available_moves(board)
    
end

def computer_turn(board)
    puts "It's the computer's turn. Press enter to continue..."
    gets
    moves_available = check_available_moves(board)
    moved = false
    
    if moves_available.include?([1,1]) and moved == false
        board[1][1] = $computer
        moved = true
    end
    

    player_turn(board)
end

def check_available_moves(board)
    # check_win(board)
    available_spaces = []
    for row in 0...board.length
        for column in 0...board[row].length
            if board[row][column] == ' '
                available_spaces << [row, column]
            end
        end
    end
    if available_spaces.length == 0
        game_tie()
    end
    return available_spaces
end

def check_win(baord, turn)

end


welcome_screen()