require_relative 'ui'

def calcula_nova_posicao(heroi,direcao)
	heroi = heroi.dup
	case direcao
		when "W"
			heroi[0] -= 1
		when "S"
			heroi[0] += 1
		when "A"
			heroi[1] -= 1
		when "D"
			heroi[1] += 1
	end
	heroi
end

def encontra_jogador(mapa)
	caracter_do_heroi = "H"
	mapa.each_with_index do |linha_atual, linha| 
		coluna_do_heroi = linha_atual.index caracter_do_heroi
		if coluna_do_heroi
			return [linha, coluna_do_heroi]
		end
	end
	#não achei
end

def le_mapa (numero)
	arquivo = "mapa#{numero}.txt"
	texto = File.read(arquivo)
	mapa = texto.split "\n"
end

def posicao_valida?(mapa,posicao)
	linhas = mapa.size
	colunas = mapa[0].size

	passou_max_linha = posicao[0] < 0 || posicao[0] >= linhas
	passou_max_coluna = posicao[1] <0 || posicao[1] >= colunas

	return false if passou_max_coluna || passou_max_linha

	return false if mapa[posicao[0]][posicao[1]] == "X"

	true
end

def joga(nome)
	mapa = le_mapa 1

	while true
		desenha mapa
		direcao = pede_movimento
		heroi = encontra_jogador mapa
		nova_posicao = calcula_nova_posicao heroi, direcao
		next if !posicao_valida? mapa,nova_posicao
		mapa[heroi[0]][heroi[1]] = " "
		mapa[nova_posicao[0]][nova_posicao[1]] = "H"
	end
end

def inicia_fogefoge
	nome = da_boas_vindas
	joga nome
end