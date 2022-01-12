import System.IO
import Control.Monad

-- getUserLines :: IO String                      -- optional type signature
-- getUserLines = go ""
--   where go contents = do
--     line <- getLine
--     if line == "q"
--         then return contents
--         else go (contents ++ line ++ "n")     -- add a newline

initGame :: IO ()
initGame = do
  let lineOneList = [(1, ["|"]), (2, ["|", "|", "|"])]
  display lineOneList[0]
  putStrLn ("\n")
  putStrLn ("1 | \n")
  putStrLn ("2 | | |\n")
  putStrLn ("3 | | | | |\n")
  putStrLn ("4 | | | | | | |\n")
  putStrLn "Insira de qual linha deseja retirar palitos \n"
  line <- getLine
  putStrLn "Insira quantos palitos deseja retirar \n"
  qnt <- getLine
  putStrLn qnt

main :: IO ()
main = do 
  putStrLn "Qual modo deseja jogar, fácil ou difícil ? (f/d)"
  mode <- getChar
  
  if (mode == 'f' || mode == 'd') then
    initGame

  else do
    putStrLn "\nModo inválido \n"
    main
  -- putStrLn ("Mode" ++ mode ++ "!")



-- Trabalho
-- Variavel "turn" que guarda de qm eh vez
-- "Selecione o modo de jogo: Facil ou dificil"
-- Loop até o fim dos palitos
---- Vez do primeiro jogado
---- "Escolha em qual fileira deseja remover"
---- "Escolha quais posições deseja remover (separado por ,)" // informar erro em caso de index out of bound
---- Vez do segundo
---- "Escolha em qual fileira deseja remover"
---- "Escolha quais posições deseja remover (separado por ,)" // informar erro em caso de index out of bound
----
---- Verifica se ainda tem palito no jogo
------- Se tem, proxima jogada e atualiza variável "turn"
------- Se não, declara o jogador da variavel vencedor 
---- ....


-- Impressao
-- 1  |
-- 2  | | |
-- 3  | | | | |
-- 4  | | | | | | |
--    1 2 3 4 5 6 7

--   |
--   |   |
--   | | | |  
--     | | | | | |
--   1 2 3 4 5 6 7
  
--   ...
