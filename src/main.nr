global N2: Field = 81;
global N: Field = 9;
global Nh: Field = 3;

fn ensure_solution_for_puzzle(
  solution:  [u4; N2],
  puzzle  :  [u4; N2]
) {
  for i in 0..N2 {
    let solEl: u4 = solution[i];
    constrain solEl > 0;
    constrain solEl <= 9;
    let puzEl: u4 = puzzle[i];
    constrain (solEl == puzEl) | (puzEl == 0);
  }
}

fn check_solution_lines(solution: [u4; N2]) {
  for i in 0..N {
    for a in 0..N {
      for b in (a+1)..N {
        // Check row element
        constrain solution[i * 9 + a] != solution[i * 9 + b];
        // Check column Element
        constrain solution[i + 9 * a] != solution[i + 9 * b];
      }
    }
  }
}

fn check_solution_blocks(solution: [u4; N2]) {
  for x in 0..Nh {
    for y in 0..Nh {
      let baseInd: comptime Field = x * 27 + y * 3;
      constrain solution[baseInd +  0] != solution[baseInd +  1];
      constrain solution[baseInd +  0] != solution[baseInd +  2];
      constrain solution[baseInd +  0] != solution[baseInd +  9];
      constrain solution[baseInd +  0] != solution[baseInd + 10];
      constrain solution[baseInd +  0] != solution[baseInd + 11];
      constrain solution[baseInd +  0] != solution[baseInd + 18];
      constrain solution[baseInd +  0] != solution[baseInd + 19];
      constrain solution[baseInd +  0] != solution[baseInd + 20];
      constrain solution[baseInd +  1] != solution[baseInd +  2];
      constrain solution[baseInd +  1] != solution[baseInd +  9];
      constrain solution[baseInd +  1] != solution[baseInd + 10];
      constrain solution[baseInd +  1] != solution[baseInd + 11];
      constrain solution[baseInd +  1] != solution[baseInd + 18];
      constrain solution[baseInd +  1] != solution[baseInd + 19];
      constrain solution[baseInd +  1] != solution[baseInd + 20];
      constrain solution[baseInd +  2] != solution[baseInd +  9];
      constrain solution[baseInd +  2] != solution[baseInd + 10];
      constrain solution[baseInd +  2] != solution[baseInd + 11];
      constrain solution[baseInd +  2] != solution[baseInd + 18];
      constrain solution[baseInd +  2] != solution[baseInd + 19];
      constrain solution[baseInd +  2] != solution[baseInd + 20];
      constrain solution[baseInd +  9] != solution[baseInd + 10];
      constrain solution[baseInd +  9] != solution[baseInd + 11];
      constrain solution[baseInd +  9] != solution[baseInd + 18];
      constrain solution[baseInd +  9] != solution[baseInd + 19];
      constrain solution[baseInd +  9] != solution[baseInd + 20];
      constrain solution[baseInd + 10] != solution[baseInd + 11];
      constrain solution[baseInd + 10] != solution[baseInd + 18];
      constrain solution[baseInd + 10] != solution[baseInd + 19];
      constrain solution[baseInd + 10] != solution[baseInd + 20];
      constrain solution[baseInd + 11] != solution[baseInd + 18];
      constrain solution[baseInd + 11] != solution[baseInd + 19];
      constrain solution[baseInd + 11] != solution[baseInd + 20];
      constrain solution[baseInd + 18] != solution[baseInd + 19];
      constrain solution[baseInd + 18] != solution[baseInd + 20];
      constrain solution[baseInd + 19] != solution[baseInd + 20];
    }
  }
}

fn main(
  solution:  [u4; N2],
  puzzle: pub [u4; N2]
) {
  ensure_solution_for_puzzle(solution, puzzle);

  check_solution_lines(solution);
}
