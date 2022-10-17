void main(){
  List board = [["5","3",".",".","7",".",".",".","."],
                ["6",".",".","1","9","5",".",".","."],
                [".","9","8",".",".",".",".","6","."],
                ["8",".",".",".","6",".",".",".","3"],
                ["4",".",".","8",".","3",".",".","1"],
                ["7",".",".",".","2",".",".",".","6"],
                [".","6",".",".",".",".","2","8","."],
                [".",".",".","4","1","9",".",".","5"],
                [".",".",".",".","8",".",".","7","9"]];

    print(validateBoard(board));
}

bool validateBoard(List board)
{
  bool uniqueRow = true;
  bool uniqueCol = true;
  bool uniqueBox = true;
  
  
  for(int row=0; row<9; row++)
  {
    Map<String,int> rowMap = {};
    Map<String,int> colMap = {};
    for (int col=0; col<9; col++)
    {
      //Check for duplicates in row.
      if(rowMap.containsKey(board[row][col])) 
      {
        uniqueRow = false;
        break;
      }

      //Check for duplicates in row.
      if(colMap.containsKey(board[col][row])) 
      {
        uniqueCol = false;
        break;
      }

      // Adding values to the map of row.
      if(board[row][col] != ".") 
      {
        rowMap[board[row][col]] = 1;
      }

      // Adding values to the map of column.
      if(board[col][row] != ".") 
      {
        colMap[board[col][row]] = 1;
      }

      // Check for duplicates in 3*3 box.
      int smallBoxRow= row - row % 3; 
      int smallBoxCol= col - col % 3;
      Map<String,int> boxMap = {};

      for(int sRow=0; sRow<3; sRow++)
      {
        for(int sCol=0; sCol<3; sCol++)
        {
          String currentDigit = board[sRow + smallBoxRow][sCol + smallBoxCol];

          if(boxMap.containsKey(currentDigit))
          {
            uniqueBox=false;
            break;
          }
          if(currentDigit!=".")
          {
            boxMap[currentDigit] = 1;
          }
        }
      }
    }
  }

  if (uniqueRow && uniqueCol && uniqueBox)
  {
    return true;
  }
  else
  {
    return false;
  }
}
