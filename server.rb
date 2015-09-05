require "sinatra"
require 'pry'


use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe",
  expire_after: 86400
}

human = "Let's play Rock, Paper, Scissors!"
cpu = nil

human_score = 0
computer_score= 0

winner = nil

get "/" do

  if human_score > 2
    winner = "YOU WIN!"
    human_score = 0
    computer_score = 0
  elsif computer_score > 2
    winner = "COMPUTER WINS!"
    human_score = 0
    computer_score = 0
  else
    winner = nil
  end

  erb :index, locals: { choice: human, computer_choice: cpu, human_score: human_score, computer_score: computer_score, winner: winner }
end


post "/" do

  choice = params[:choice]
  human = "You chose " + params[:choice]

  computer_choice = ["Rock", "Paper", "Scissors"].sample
  cpu = ", computer chose " + computer_choice

  if choice=="Rock"&&computer_choice=="Scissors" || choice=="Paper"&&computer_choice=="Rock" || choice=="Scissors"&&computer_choice=="Paper"
    human_score += 1
  elsif choice == computer_choice
    nil
  else
    computer_score += 1
  end

  redirect "/"
end
