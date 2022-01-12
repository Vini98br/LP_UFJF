import Data.Char
import System.Random

-- represents the initial board of the game
initialBoard :: [Int]
initialBoard = [1, 3, 5, 7]

-- function that return the next player who has a turn
nextPlayer :: Int -> Int
nextPlayer 1 = 2
nextPlayer 2 = 1

-- utility function to print a newline to the console
newline :: IO ()
newline = putChar '\n'

getMode :: IO Char
getMode = do putStr "Qual modo deseja jogar, fácil ou difícil ? (f/d)"
             x <- getChar
             newline
             if x == 'f' || x == 'd' then
                do return x
             else 
               do putStrLn "Invalid input"
                  getMode

-- takes an inpu and checks if it is a digit and return it, if not asks for input again
getDigit :: String -> IO Int
getDigit message = do putStr message
                      x <- getChar
                      newline
                      if isDigit x then
                        do return (digitToInt x)
                      else 
                        do putStrLn "Invalid input"
                           getDigit message

-- utility function to print the board onto the console
printBoard :: [Int] -> IO ()
printBoard board = putStr $ unlines [(show row) ++ ": " ++ replicate sticks '|' ++ "\n" | (sticks, row) <- zip board [1..length board]]

-- checks the end condition for the game
checkEnd :: [Int] -> Bool
checkEnd board = all (==0) board

-- checks whether a move is valid or not
checkValidMove :: [Int] -> Int -> Int -> Bool
checkValidMove board row rSticks = if (board !! (row - 1)) >= rSticks then True else False

randomInt :: Int -> Int -> IO Int
randomInt l g = randomRIO (l, g)

-- generates a new board once a move has been played
generateNewBoard :: [Int] -> Int -> Int -> [Int]
generateNewBoard board row rSticks = [if irow == row then sticks - rSticks else sticks | (sticks, irow) <- zip board [1..length board]]


{-
  EX: 
  board: [1, 3, 5, 7]
  [1..length board]: [1, 2, 3, 4]
  zip board [1..length board]: [[1,1], [3, 2], [5, 3], [7, 4]]
-}
-- Pegar a quantidade de palitos em uma determinada linha
getSticksInRow :: [Int] -> Int -> Int
getSticksInRow board row = ([[sticks, row] | (sticks, row) <- zip board [1..length board]] !! (row - 1)) !! 0
-- getSticksInRow board row = [if irow == row then sticks else 0 | (sticks, irow) <- zip board [1..length board]]

-- getEasyPlayData :: [Int] -> IO (Int, Int)
-- getEasyPlayData board = do machineRow <- randomInt 1 4
--                            print machineRow
--                            do return ((getSticksInRow board machineRow), machineRow)
-- makeHardPlay

-- makes use of the do notation to run a loop for the game
playNim :: [Int] -> Int -> Char -> IO ()
playNim board player mode = do printBoard board
                               if checkEnd board then
                                 do putStr "Player "
                                    putStr (show (nextPlayer player))
                                    putStrLn " wins!"
                               else
                                 do putStr "Player "
                                    putStrLn (show player)
                                    if player == 2 then do
                                       if mode == 'f' then do
                                          machineRow <- randomInt 1 4
                                          let rowSticks = getSticksInRow board machineRow
                                          machineSticks <- randomInt 1 rowSticks
                                          -- putStr "Enter row number: " ++ (show machineRow)
                                          -- putStr "Enter number of sticks to remove: " ++ (show machineSticks)
                                          if checkValidMove board machineRow machineSticks then
                                             playNim (generateNewBoard board machineRow machineSticks) (nextPlayer player) mode
                                          else
                                            do putStrLn "Invalid move"
                                               playNim board player mode
                                       else 
                                         do putStr "aaa"
                                    else do
                                      row <- getDigit "Enter row number: "
                                      sticks <- getDigit "Enter number of sticks to remove: " 
                                      if checkValidMove board row sticks then
                                        playNim (generateNewBoard board row sticks) (nextPlayer player) mode
                                      else
                                        do putStrLn "Invalid move"
                                           playNim board player mode
                
-- call this function to start the game with the initial conditions
nim :: IO ()
nim = do mode <- getMode
         playNim initialBoard 1 mode


{-
 Para relatório:
  - Decisões:
    - Modelagem: Decidimos guardar o jogo em uma matriz, de forma que as linhas da segunda coluna represente o identificador das linhas do jogo
      e o valor da primeira coluna do valor em questão, significa quantos palitos aquela linha possui, por exemplo:
      [
       [1, 1] -> linha 1 possui 1 palito
       [3, 2] -> linha 2 possui 3 palitos
       [5, 3] -> linha 3 possui 5 palitos
       [7, 4] -> linha 4 possui 7 palitos
      ]
      - Para montar essa estrutura usamos a função zip nativa, para combinar um array de quantidade de palitos ([1, 3, 5, 7]), com um array indo de 1 até seu a tamanho ([1..4]), obtendo a seguinte matriz resultante:
        [[1,1], [3, 2], [5, 3], [7, 4]]
      - Dessa forma, a impressão ficou simples de ser feita, basicamente percorremos cada posição do array mais externo, e printamos {identificador da linha}: {quantidade de palitos} * "|"
-}