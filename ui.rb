def da_boas_vindas
	puts "Bem vindo ao jogo Foge-foge"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n\n\n"
	puts "Começaremos o jogo para você #{nome.upcase}"
	nome
end