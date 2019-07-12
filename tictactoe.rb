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
    $player = prompt.select("Choose which symbol you want to be:", %w(X O Quit))
    if $player == 'Quit'
        clear_screen()
        exit
    end
    if $player == 'X'
        $computer = 'O'
    else
        $computer = 'X'
    end
    start_game()
end

def start_game
    puts $player
    puts $computer
end


welcome_screen()